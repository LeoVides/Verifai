require 'faker'

puts "------- Seeding the database 🌱 -------"

################### Clean the database ###################

Result.destroy_all
User.destroy_all

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
  political_bias_confidence: 0.9,
  fact_score_confidence: 0.7,
  title: 'UK companies switch to 4 day working weeks',
  user_id: User.first.id
)

Result.create(
  fact_score: 'Very high',
  political_bias: "Center",
  source_media: 'Reuters',
  user_input: 'The UN reports that global hunger has decreased by 15% over the past decade.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.95,
  title: 'Global hunger declines by 15% in 10 years',
  user_id: User.first.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: 'The Intercept',
  user_input: 'Capitalism has been the single biggest contributor to global inequality.',
  political_bias_confidence: 0.95,
  fact_score_confidence: 0.4,
  title: 'Capitalism and global inequality',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Medium',
  political_bias: "Right",
  source_media: 'The Wall Street Journal',
  user_input: 'Tax cuts for corporations have led to job growth in all states.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.65,
  title: 'Corporate tax cuts and job growth',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-low',
  political_bias: "Far-right",
  source_media: 'Infowars',
  user_input: 'Climate change is a myth created by China to destabilize the West.',
  political_bias_confidence: 0.9,
  fact_score_confidence: 0.2,
  title: 'Climate change conspiracy theories',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: 'The Guardian',
  user_input: 'Wind energy now accounts for 20% of Europe’s power supply.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.85,
  title: 'Wind energy contribution in Europe',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Medium',
  political_bias: "Right",
  source_media: 'Fox News',
  user_input: 'Immigration is the main reason for rising unemployment in the US.',
  political_bias_confidence: 0.9,
  fact_score_confidence: 0.5,
  title: 'Immigration and unemployment rates',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-high',
  political_bias: "Center",
  source_media: 'Associated Press',
  user_input: 'NASA’s Artemis program aims to land astronauts on the moon by 2025.',
  political_bias_confidence: 0.7,
  fact_score_confidence: 0.95,
  title: 'NASA Artemis program plans',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: 'Very-low',
  political_bias: "Left",
  source_media: 'MSNBC',
  user_input: 'The US military budget could singlehandedly end world poverty.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.2,
  title: 'Military budget and world poverty',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Right",
  source_media: 'The Daily Caller',
  user_input: 'Several states report economic growth after rolling back business regulations.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Right",
  source_media: 'The Daily Caller',
  user_input: 'Several states report economic growth after rolling back business regulations.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

Result.create(
  fact_score: "High",
  political_bias: "Right",
  source_media: 'The Daily Caller',
  user_input: 'Multiple states report economic expansion following the easing of business regulations.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

Result.create(
  fact_score: "High",
  political_bias: "Right",
  source_media: 'The Daily Caller',
  user_input: 'The US military budget alone has the potential to eradicate global poverty.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.last.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare leads to better public health outcomes and reduced costs.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and public health",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Gun control laws infringe on the constitutional rights of American citizens.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun control and constitutional rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The wealth gap is increasing due to corporate greed and tax loopholes.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Wealth gap and corporate greed",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "Renewable energy is a scam pushed by the government to control the market.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Renewable energy and government control",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "Free markets drive innovation and economic growth better than regulations.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Free markets and economic growth",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Immigration strengthens the economy and enhances cultural diversity.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Immigration and economic benefits",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "Mainstream media intentionally suppresses conservative viewpoints.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Media bias and conservative suppression",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Raising the minimum wage will lead to widespread job losses.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Minimum wage and job market",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Climate change is an existential crisis that requires immediate action.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Climate change and global impact",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Big pharma is manipulating health policies for profit.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Big pharma and health policies",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Lowering taxes on the wealthy creates more jobs for the middle class.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Tax cuts and middle class jobs",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Public education is underfunded due to government priorities favoring corporations.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Public education and government priorities",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "Voter ID laws disproportionately suppress minority voters.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Voter ID laws and minority suppression",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "Government overreach in tech censorship threatens free speech.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Tech censorship and free speech",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Police funding cuts lead to increased crime rates in urban areas.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Police funding cuts and crime rates",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Socialism would destroy the American economy and individual freedoms.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Socialism and the American economy",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "Corporate lobbying has too much influence on political decision-making.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Corporate lobbying and politics",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "The Federal Reserve intentionally manipulates inflation for elite interests.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Federal Reserve and inflation manipulation",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Welfare programs encourage dependency instead of self-sufficiency.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Welfare programs and dependency",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "The military-industrial complex drives unnecessary wars for profit.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Military-industrial complex and wars",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Bitcoin will replace traditional currency and decentralize financial power.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Bitcoin and financial decentralization",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Illegal immigration is overwhelming public services and harming citizens.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Illegal immigration and public services",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "The Green New Deal would bankrupt the economy and increase poverty.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Green New Deal and economic impact",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Automation and AI will eliminate millions of jobs without creating new ones.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Automation and job losses",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "The criminal justice system disproportionately targets people of color.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Criminal justice system and racial bias",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-low",
  political_bias: "Far-right",
  source_media: sources.sample,
  user_input: "The COVID-19 pandemic was exaggerated to control the population.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "COVID-19 and population control",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Social media platforms are intentionally stifling free speech.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Social media and free speech",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Very-high",
  political_bias: "Center",
  source_media: sources.sample,
  user_input: "Corporate tax rates should be lowered to promote business investment.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Corporate taxes and business investment",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Income inequality is the result of unfair economic policies favoring the wealthy.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Income inequality and economic policies",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare ensures better healthcare access and equality for all citizens.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and equality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Healthcare for all is essential for a healthier society and lower overall healthcare costs.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Healthcare for all and cost reduction",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "The right to bear arms is fundamental for protecting individual freedoms in America.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "The right to bear arms and individual freedoms",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Gun ownership is a constitutional right and should not be restricted by the government.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun ownership and constitutional rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Corporate tax cuts disproportionately benefit the wealthy, worsening the wealth gap.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Corporate tax cuts and wealth inequality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Corporate greed and tax breaks are the root causes of rising income inequality in society.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Corporate greed and income inequality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "A progressive tax system is essential for reducing the wealth gap and providing public services.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Progressive taxes and wealth distribution",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Increasing gun regulations will lead to the erosion of citizens' rights and freedoms.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun regulation and citizens' rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The concentration of wealth in the hands of a few is detrimental to the economy and society as a whole.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Wealth concentration and economic inequality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Social healthcare systems improve public health outcomes and reduce costs in the long term.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Social healthcare systems and cost benefits",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare ensures better health outcomes for all citizens and reduces overall healthcare costs.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and public health outcomes",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "A universal healthcare system can eliminate disparities in health access and improve outcomes.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and health access",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare helps reduce long-term health costs by providing preventive care for all.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and cost reduction",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "The right to own firearms is protected by the Constitution and should not be infringed upon by new laws.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun control and the right to bear arms",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Restricting gun rights violates the Constitution and undermines personal freedoms.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun rights and constitutional protections",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Gun ownership is a constitutional right, and increasing restrictions undermines individual freedoms.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun ownership and individual rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The wealth gap continues to grow due to tax policies that favor the rich and leave the poor behind.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Wealth inequality and tax policies",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Wealth inequality is driven by tax cuts for the rich and the concentration of wealth among a few elites.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Wealth inequality and corporate tax cuts",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The growing wealth gap is a direct result of policies that disproportionately benefit the wealthy and powerful.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Wealth gap and policy impacts",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Corporate tax loopholes exacerbate the wealth gap and widen the divide between the rich and the poor.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Corporate tax loopholes and wealth inequality",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare reduces overall health costs and improves public health for all citizens.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and reduced health costs",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare is essential for reducing health disparities and improving public health outcomes.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and health disparities",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "High",
  political_bias: "Left",
  source_media: sources.sample,
  user_input: "Universal healthcare guarantees better healthcare access and improved public health outcomes.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Universal healthcare and access to care",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "The right to own firearms is fundamental and should not be restricted by the government.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun rights and government restrictions",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "The right to bear arms is a constitutional right and should not be restricted by new gun laws.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun rights and constitutional protections",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Medium",
  political_bias: "Right",
  source_media: sources.sample,
  user_input: "Limiting gun ownership infringes on the Second Amendment rights and individual freedoms.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Gun ownership and constitutional rights",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The wealth gap has grown due to tax breaks that favor the rich and corporate loopholes.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Wealth inequality and corporate tax breaks",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Tax cuts for the wealthy are a key driver of income inequality and the growing wealth gap.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Income inequality and tax cuts for the rich",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "Corporate greed and tax loopholes are primary contributors to the widening wealth gap in society.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Corporate greed and wealth gap",
  user_id: User.all.sample.id
)

Result.create(
  fact_score: "Low",
  political_bias: "Far-left",
  source_media: sources.sample,
  user_input: "The concentration of wealth in the hands of the wealthy elite is a major factor in the wealth gap.",
  political_bias_confidence: rand(0.6..1.0).round(2),
  fact_score_confidence: rand(0.3..0.9).round(2),
  title: "Wealth concentration and inequality",
  user_id: User.all.sample.id
)

puts "Created #{Result.count} results 🎯"

puts "------- Seed data created successfully 🌱 -------"
