class OpenAiCallJob < ApplicationJob
  queue_as :default

  def perform(params, user)
    puts "Performing OpenAI call job"
    result = Result.new(params)
    result.user = user
    # Do something later
    if result.valid?
      # Prompt to ChatGPT to get the political bias and fact score
      prompt =  <<~TEXT
        Based on this news excerpt: #{result.user_input}.
        Return the political_bias of the text (choose  only one between: Far-left, Left, Center, Right, Far-right),
        the fact_score (choose only one between: Very low, Low, Medium, High, Very high),
        a title summarizing the key point of the news excerpt (maximum 5 words),
        a link to the homepage of news outlets of opposite political biases (maximum 3, called 'source')
        and an explanation of the political bias and credibility results (maximum 60 words).
        Provide your response in JSON format with keys 'political_bias’, 'fact_score', 'title', 'source'
        (source is a hash itself with the 3 links) and 'summary',
        and use the Media Bias/Fact Check (MBFC) methodology.
      TEXT
      client = OpenAI::Client.new
      chatgpt_response = client.chat(parameters: {
        model: "gpt-4o-mini",
        messages: [{ role: "user", content: prompt }]
      })

      # Extract the response from ChatGPT and clean it to parse the JSON
      response = chatgpt_response["choices"][0]["message"]["content"]
      clean_response = response.gsub(/```json\n|```/, '')
      result.political_bias = JSON.parse(clean_response)["political_bias"]
      result.fact_score = JSON.parse(clean_response)["fact_score"]
      result.title = JSON.parse(clean_response)["title"]
      media = JSON.parse(clean_response)["source"]
      result.summary = JSON.parse(clean_response)["summary"]

      # New medias are created based on the response from ChatGPT
      media.each do |political_bias, url|
        result.medias.new(political_bias: political_bias, url: url)
      end
    end

    if result.save
      result.medias.each do |media|
        media.save
      end
      puts "Result id #{result.id} : #{result.title} created successfully with medias #{result.medias.map(&:url)}, broadcasting to user_#{result.user.id}"

      # Broadcast the update via Turbo Streams
      Turbo::StreamsChannel.broadcast_update_to(
        "user_#{result.user.id}",
        target: "user_#{result.user.id}",
        partial: "results/result",
        locals: { result: result }
      )

      return result
    else
      puts "Result #{result.title} in error"
      return { errors: result.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
