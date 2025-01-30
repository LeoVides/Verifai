require 'faker'

puts "------- Seeding the database 🌱 -------"

################### Clean the database ###################

Result.destroy_all
User.destroy_all
Media.destroy_all

# Restart ID counter
ActiveRecord::Base.connection.reset_pk_sequence!('results')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

puts "Database cleaned 🧹"

################### User seeds ###################
User.create(
  username: 'alice_wonder',
  email: 'alice.wonder@example.com',
  password: 'alice.wonder@example.com'
)

14.times do |i|
  User.create(
    username: Faker::Internet.username(specifier: 5..10),
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

puts "Created #{User.count} users 🤓"

################### Media seeds ###################

Media.create(name: "The Guardian", url: "https://www.theguardian.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/f/f9/The_Guardian_2018.svg/1200px-The_Guardian_2018.svg.png")
Media.create(name: "The Wall Street Journal", url: "https://www.wsj.com", political_bias: "right", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/The_Wall_Street_Journal_logo.svg/1200px-The_Wall_Street_Journal_logo.svg.png")
Media.create(name: "Fox News", url: "https://www.foxnews.com", political_bias: "right", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Fox_News_Channel_logo.svg/1200px-Fox_News_Channel_logo.svg.png")
Media.create(name: "CNN", url: "https://www.cnn.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/CNN.svg/1920px-CNN.svg.png")
Media.create(name: "The Intercept", url: "https://theintercept.com", political_bias: "far-left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/0/02/The_Intercept_Logo.png")
Media.create(name: "Infowars", url: "https://www.infowars.com", political_bias: "far-right", logo_url: "https://upload.wikimedia.org/wikipedia/commons/4/48/InfoWars_Logo.png")
Media.create(name: "BBC", url: "https://www.bbc.com", political_bias: "centre", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/BBC_Logo_2021.svg/800px-BBC_Logo_2021.svg.png")
Media.create(name: "Al Jazeera", url: "https://www.aljazeera.com", political_bias: "center", logo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/4/4f/Al_Jazeera_Logo.svg/1200px-Al_Jazeera_Logo.svg.png")
Media.create(name: "The New York Times", url: "https://www.nytimes.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/New_York_Times_logo_variation.jpg/1200px-New_York_Times_logo_variation.jpg")
Media.create(name: "The Washington Post", url: "https://www.washingtonpost.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/9/91/The_Washington_Post_logo.png")
Media.create(name: "Reuters", url: "https://www.reuters.com", political_bias: "centre", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Reuters_logo.svg/1200px-Reuters_logo.svg.png")
Media.create(name: "NBC News", url: "https://www.nbcnews.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/NBC_News_2011.svg/1200px-NBC_News_2011.svg.png")
Media.create(name: "The Independent", url: "https://www.independent.co.uk", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/8e/The_Independent_2016_logo.svg/1200px-The_Independent_2016_logo.svg.png")
Media.create(name: "BuzzFeed News", url: "https://www.buzzfeednews.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/6/66/BuzzFeed_News_logo.png")
Media.create(name: "The Economist", url: "https://www.economist.com", political_bias: "center", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/The_Economist_Logo.svg/1200px-The_Economist_Logo.svg.png")
Media.create(name: "The Times", url: "https://www.thetimes.co.uk", political_bias: "center", logo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/d/db/The_Times_Logo.svg/1200px-The_Times_Logo.svg.png")
Media.create(name: "The Daily Mail", url: "https://www.dailymail.co.uk", political_bias: "right", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Daily_Mail_Logo.svg/1200px-Daily_Mail_Logo.svg.png")
Media.create(name: "The Sun", url: "https://www.thesun.co.uk", political_bias: "right", logo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3d/The_Sun_logo.svg/1200px-The_Sun_logo.svg.png")
Media.create(name: "MSNBC", url: "https://www.msnbc.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/8/8d/MSNBC_logo.png")
Media.create(name: "USA Today", url: "https://www.usatoday.com", political_bias: "centre", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/USA_Today_Logo.svg/1200px-USA_Today_Logo.svg.png")
Media.create(name: "Politico", url: "https://www.politico.com", political_bias: "center", logo_url: "https://upload.wikimedia.org/wikipedia/commons/4/41/Politico_Logo.png")
Media.create(name: "HuffPost", url: "https://www.huffpost.com", political_bias: "far-left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/HuffPost.svg/1200px-HuffPost.svg.png")
Media.create(name: "Vox", url: "https://www.vox.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Vox_logo.svg/1200px-Vox_logo.svg.png")
Media.create(name: "NPR", url: "https://www.npr.org", political_bias: "center", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/NPR_logo.svg/1200px-NPR_logo.svg.png")
Media.create(name: "The Daily Beast", url: "https://www.thedailybeast.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/The_Daily_Beast_Logo.svg/1200px-The_Daily_Beast_Logo.svg.png")
Media.create(name: "CBS News", url: "https://www.cbsnews.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/CBS_News_logo.svg/1200px-CBS_News_logo.svg.png")
Media.create(name: "Sky News", url: "https://news.sky.com", political_bias: "center", logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Sky_News_logo.svg/1200px-Sky_News_logo.svg.png")
Media.create(name: "The Atlantic", url: "https://www.theatlantic.com", political_bias: "left", logo_url: "https://upload.wikimedia.org/wikipedia/commons/4/49/The_Atlantic_logo.png")
Media.create(name: "The Spectator", url: "https://www.spectator.co.uk", political_bias: "right", logo_url: "https://upload.wikimedia.org/wikipedia/commons/e/e5/The_Spectator_logo.png")

puts "Created #{Media.count} media outlets 📰"

################### Result seeds ###################

sources = [
  "The Guardian", "The Wall Street Journal", "Fox News", "CNN", "The Intercept", "Infowars",
  "BBC", "Al Jazeera", "The New York Times", "The Washington Post", "Reuters", "NBC News",
  "The Independent", "BuzzFeed News", "The Economist", "The Times", "The Daily Mail",
  "The Sun", "MSNBC", "USA Today", "Politico", "HuffPost", "Vox", "NPR", "The Daily Beast",
  "CBS News", "Sky News", "The Atlantic", "The Spectator"
]

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: ' Associated Press news',
  user_input: 'More than 200 UK companies switching to 4 day working weeks: 4 Day Week Foundation',
  title: 'UK companies switch to 4 day working weeks',
  user_id: User.first.id
)

Result.create(
  fact_score: 'Very high',
  political_bias: "Center",
  source_media: 'Reuters',
  user_input: 'The UN reports that global hunger has decreased by 15% over the past decade.',
  title: 'Global hunger declines by 15% in 10 years',
  user_id: User.first.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: 'The Intercept',
  user_input: 'Capitalism has been the single biggest contributor to global inequality.',
  title: 'Capitalism and global inequality',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Medium',
  political_bias: "Right",
  source_media: 'The Wall Street Journal',
  user_input: 'Tax cuts for corporations have led to job growth in all states.',
  title: 'Corporate tax cuts and job growth',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-low',
  political_bias: "Far-right",
  source_media: 'Infowars',
  user_input: 'Climate change is a myth created by China to destabilize the West.',
  title: 'Climate change conspiracy theories',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: 'The Guardian',
  user_input: 'Wind energy now accounts for 20% of Europe’s power supply.',
  title: 'Wind energy contribution in Europe',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Medium',
  political_bias: "Right",
  source_media: 'Fox News',
  user_input: 'Immigration is the main reason for rising unemployment in the US.',
  title: 'Immigration and unemployment rates',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-high',
  political_bias: "Center",
  source_media: 'Associated Press',
  user_input: 'NASA’s Artemis program aims to land astronauts on the moon by 2025.',
  title: 'NASA Artemis program plans',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-low',
  political_bias: "Left",
  source_media: 'MSNBC',
  user_input: 'The US military budget could singlehandedly end world poverty.',
  title: 'Military budget and world poverty',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Right",
  source_media: 'The Daily Caller',
  user_input: 'Several states report economic growth after rolling back business regulations.',
  title: 'Economic growth and deregulation',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Right",
  source_media: 'The Daily Caller',
  user_input: 'Several states report economic growth after rolling back business regulations.',
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

Result.create(
  fact_score: "High",
  political_bias: "Right",
  source_media: 'The Daily Caller',
  user_input: 'Multiple states report economic expansion following the easing of business regulations.',
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

Result.create(
  fact_score: "High",
  political_bias: "Right",
  source_media: 'The Daily Caller',
  user_input: 'The US military budget alone has the potential to eradicate global poverty.',
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare leads to better public health outcomes and reduced costs.",
  title: "Universal healthcare and public health",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Gun control laws infringe on the constitutional rights of American citizens.",
  title: "Gun control and constitutional rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The wealth gap is increasing due to corporate greed and tax loopholes.",
  title: "Wealth gap and corporate greed",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "Renewable energy is a scam pushed by the government to control the market.",
  title: "Renewable energy and government control",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "Free markets drive innovation and economic growth better than regulations.",
  title: "Free markets and economic growth",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Immigration strengthens the economy and enhances cultural diversity.",
  title: "Immigration and economic benefits",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "Mainstream media intentionally suppresses conservative viewpoints.",
  title: "Media bias and conservative suppression",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Raising the minimum wage will lead to widespread job losses.",
  title: "Minimum wage and job market",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Climate change is an existential crisis that requires immediate action.",
  title: "Climate change and global impact",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Big pharma is manipulating health policies for profit.",
  title: "Big pharma and health policies",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Lowering taxes on the wealthy creates more jobs for the middle class.",
  title: "Tax cuts and middle class jobs",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Public education is underfunded due to government priorities favoring corporations.",
  title: "Public education and government priorities",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "Voter ID laws disproportionately suppress minority voters.",
  title: "Voter ID laws and minority suppression",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "Government overreach in tech censorship threatens free speech.",
  title: "Tech censorship and free speech",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Police funding cuts lead to increased crime rates in urban areas.",
  title: "Police funding cuts and crime rates",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Socialism would destroy the American economy and individual freedoms.",
  title: "Socialism and the American economy",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "Corporate lobbying has too much influence on political decision-making.",
  title: "Corporate lobbying and politics",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "The Federal Reserve intentionally manipulates inflation for elite interests.",
  title: "Federal Reserve and inflation manipulation",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Welfare programs encourage dependency instead of self-sufficiency.",
  title: "Welfare programs and dependency",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "The military-industrial complex drives unnecessary wars for profit.",
  title: "Military-industrial complex and wars",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Bitcoin will replace traditional currency and decentralize financial power.",
  title: "Bitcoin and financial decentralization",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Illegal immigration is overwhelming public services and harming citizens.",
  title: "Illegal immigration and public services",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "The Green New Deal would bankrupt the economy and increase poverty.",
  title: "Green New Deal and economic impact",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Automation and AI will eliminate millions of jobs without creating new ones.",
  title: "Automation and job losses",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "The criminal justice system disproportionately targets people of color.",
  title: "Criminal justice system and racial bias",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "The COVID-19 pandemic was exaggerated to control the population.",
  title: "COVID-19 and population control",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Social media platforms are intentionally stifling free speech.",
  title: "Social media and free speech",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "Corporate tax rates should be lowered to promote business investment.",
  title: "Corporate taxes and business investment",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Income inequality is the result of unfair economic policies favoring the wealthy.",
  title: "Income inequality and economic policies",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare ensures better healthcare access and equality for all citizens.",
  title: "Universal healthcare and equality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Healthcare for all is essential for a healthier society and lower overall healthcare costs.",
  title: "Healthcare for all and cost reduction",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "The right to bear arms is fundamental for protecting individual freedoms in America.",
  title: "The right to bear arms and individual freedoms",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Gun ownership is a constitutional right and should not be restricted by the government.",
  title: "Gun ownership and constitutional rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Corporate tax cuts disproportionately benefit the wealthy, worsening the wealth gap.",
  title: "Corporate tax cuts and wealth inequality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Corporate greed and tax breaks are the root causes of rising income inequality in society.",
  title: "Corporate greed and income inequality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "A progressive tax system is essential for reducing the wealth gap and providing public services.",
  title: "Progressive taxes and wealth distribution",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Increasing gun regulations will lead to the erosion of citizens' rights and freedoms.",
  title: "Gun regulation and citizens' rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The concentration of wealth in the hands of a few is detrimental to the economy and society as a whole.",
  title: "Wealth concentration and economic inequality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Social healthcare systems improve public health outcomes and reduce costs in the long term.",
  title: "Social healthcare systems and cost benefits",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare ensures better health outcomes for all citizens and reduces overall healthcare costs.",
  title: "Universal healthcare and public health outcomes",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "A universal healthcare system can eliminate disparities in health access and improve outcomes.",
  title: "Universal healthcare and health access",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare helps reduce long-term health costs by providing preventive care for all.",
  title: "Universal healthcare and cost reduction",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "The right to own firearms is protected by the Constitution and should not be infringed upon by new laws.",
  title: "Gun control and the right to bear arms",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Restricting gun rights violates the Constitution and undermines personal freedoms.",
  title: "Gun rights and constitutional protections",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Gun ownership is a constitutional right, and increasing restrictions undermines individual freedoms.",
  title: "Gun ownership and individual rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The wealth gap continues to grow due to tax policies that favor the rich and leave the poor behind.",
  title: "Wealth inequality and tax policies",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Wealth inequality is driven by tax cuts for the rich and the concentration of wealth among a few elites.",
  title: "Wealth inequality and corporate tax cuts",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The growing wealth gap is a direct result of policies that disproportionately benefit the wealthy and powerful.",
  title: "Wealth gap and policy impacts",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Corporate tax loopholes exacerbate the wealth gap and widen the divide between the rich and the poor.",
  title: "Corporate tax loopholes and wealth inequality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare reduces overall health costs and improves public health for all citizens.",
  title: "Universal healthcare and reduced health costs",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare is essential for reducing health disparities and improving public health outcomes.",
  title: "Universal healthcare and health disparities",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare guarantees better healthcare access and improved public health outcomes.",
  title: "Universal healthcare and access to care",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "The right to own firearms is fundamental and should not be restricted by the government.",
  title: "Gun rights and government restrictions",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "The right to bear arms is a constitutional right and should not be restricted by new gun laws.",
  title: "Gun rights and constitutional protections",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Limiting gun ownership infringes on the Second Amendment rights and individual freedoms.",
  title: "Gun ownership and constitutional rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The wealth gap has grown due to tax breaks that favor the rich and corporate loopholes.",
  title: "Wealth inequality and corporate tax breaks",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Tax cuts for the wealthy are a key driver of income inequality and the growing wealth gap.",
  title: "Income inequality and tax cuts for the rich",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Corporate greed and tax loopholes are primary contributors to the widening wealth gap in society.",
  title: "Corporate greed and wealth gap",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The concentration of wealth in the hands of the wealthy elite is a major factor in the wealth gap.",
  title: "Wealth concentration and inequality",
  user_id: User.all.sample.id
)

Result.all.each do |result|
  result.update(created_at: Faker::Date.between(from: 1.month.ago, to: Date.today))
  result.medias << Media.where(political_bias: "left").sample
  result.medias << Media.where(political_bias: "center").sample
  result.medias << Media.where(political_bias: "right").sample
end

puts "Created #{Result.count} results 🎯"

puts "------- Seed data created successfully 🌱 -------"
