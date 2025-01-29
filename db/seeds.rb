require 'faker'

################### Clean the database ###################
Result.destroy_all
User.destroy_all

# Restart ID counter
ActiveRecord::Base.connection.reset_pk_sequence!('results')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

################### User seeds ###################
User.create(
  username: 'alice_wonder',
  email: 'alice.wonder@example.com',
  password: 'alice.wonder@example.com'
)

14.times do |i|
  user = User.create(
    username: Faker::Internet.username(specifier: 5..10),
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

puts "Created #{User.count} users 🤪"

################### Custom result seeds ###################
Result.create(
  fact_score: 'High',
  political_bias: 'left-leaning',
  source_media: ' Associated Press news',
  user_input: 'More than 200 UK companies switching to 4 day working weeks: 4 Day Week Foundation',
  political_bias_confidence: 0.9,
  fact_score_confidence: 0.7,
  title: 'UK companies switch to 4 day working weeks',
  user_id: User.first.id
)

Result.create(
  fact_score: 'Very-high',
  political_bias: 'center',
  source_media: 'Reuters',
  user_input: 'The UN reports that global hunger has decreased by 15% over the past decade.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.95,
  title: 'Global hunger declines by 15% in 10 years',
  user_id: User.first.id
)

Result.create(
  fact_score: 'Low',
  political_bias: 'far-left',
  source_media: 'The Intercept',
  user_input: 'Capitalism has been the single biggest contributor to global inequality.',
  political_bias_confidence: 0.95,
  fact_score_confidence: 0.4,
  title: 'Capitalism and global inequality',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Mixed',
  political_bias: 'right-leaning',
  source_media: 'The Wall Street Journal',
  user_input: 'Tax cuts for corporations have led to job growth in all states.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.65,
  title: 'Corporate tax cuts and job growth',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-low',
  political_bias: 'far-right',
  source_media: 'Infowars',
  user_input: 'Climate change is a myth created by China to destabilize the West.',
  political_bias_confidence: 0.9,
  fact_score_confidence: 0.2,
  title: 'Climate change conspiracy theories',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'High',
  political_bias: 'left',
  source_media: 'The Guardian',
  user_input: 'Wind energy now accounts for 20% of Europe’s power supply.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.85,
  title: 'Wind energy contribution in Europe',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Mixed',
  political_bias: 'right',
  source_media: 'Fox News',
  user_input: 'Immigration is the main reason for rising unemployment in the US.',
  political_bias_confidence: 0.9,
  fact_score_confidence: 0.5,
  title: 'Immigration and unemployment rates',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-high',
  political_bias: 'neutral',
  source_media: 'Associated Press',
  user_input: 'NASA’s Artemis program aims to land astronauts on the moon by 2025.',
  political_bias_confidence: 0.7,
  fact_score_confidence: 0.95,
  title: 'NASA Artemis program plans',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-low',
  political_bias: 'left-leaning',
  source_media: 'MSNBC',
  user_input: 'The US military budget could singlehandedly end world poverty.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.2,
  title: 'Military budget and world poverty',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'High',
  political_bias: 'right-leaning',
  source_media: 'The Daily Caller',
  user_input: 'Several states report economic growth after rolling back business regulations.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'high',
  political_bias: 'right-leaning',
  source_media: 'The Daily Caller',
  user_input: 'Several states report economic growth after rolling back business regulations.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

Result.create(
  fact_score: 'high',
  political_bias: 'right-leaning',
  source_media: 'The Daily Caller',
  user_input: 'Multiple states report economic expansion following the easing of business regulations.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

Result.create(
  fact_score: 'high',
  political_bias: 'right-leaning',
  source_media: 'The Daily Caller',
  user_input: 'The US military budget alone has the potential to eradicate global poverty.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

sources = ["The Guardian", "The Wall Street Journal", "Fox News", "CNN", "The Intercept", "Infowars", "BBC", "Al Jazeera"]

Result.create(
  fact_score: "High",
  political_bias: "left",
  source_media: sources.sample,
  user_input: "Universal healthcare leads to better public health outcomes and reduced costs.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and public health",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Mixed",
  political_bias: "right",
  source_media: sources.sample,
  user_input: "Gun control laws infringe on the constitutional rights of American citizens.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun control and constitutional rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "far-left",
  source_media: sources.sample,
  user_input: "The wealth gap is increasing due to corporate greed and tax loopholes.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Wealth gap and corporate greed",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "far-right",
  source_media: sources.sample,
  user_input: "Renewable energy is a scam pushed by the government to control the market.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Renewable energy and government control",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "centre",
  source_media: sources.sample,
  user_input: "Free markets drive innovation and economic growth better than regulations.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Free markets and economic growth",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "left",
  source_media: sources.sample,
  user_input: "Immigration strengthens the economy and enhances cultural diversity.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Immigration and economic benefits",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "far-right",
  source_media: sources.sample,
  user_input: "Mainstream media intentionally suppresses conservative viewpoints.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Media bias and conservative suppression",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Mixed",
  political_bias: "right",
  source_media: sources.sample,
  user_input: "Raising the minimum wage will lead to widespread job losses.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Minimum wage and job market",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "left",
  source_media: sources.sample,
  user_input: "Climate change is an existential crisis that requires immediate action.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Climate change and global impact",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "far-left",
  source_media: sources.sample,
  user_input: "Big pharma is manipulating health policies for profit.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Big pharma and health policies",
  user_id: User.all.sample.id
)

puts "Created #{Result.count} results 🎯"
