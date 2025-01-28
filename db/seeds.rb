# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
  password: 'mypassword'
)

User.create(
  username: 'jane_doe',
  email: 'jane.doe@example.com',
  password: 'mypassword'
)

User.create(
  username: 'dylan_stone',
  email: 'dylan.stone@example.com',
  password: 'mypassword'
)

User.create(
  username: 'ella_bloom',
  email: 'ella.bloom@example.com',
  password: 'mypassword'
)

User.create(
  username: 'john_cliff',
  email: 'john.cliff@example.com',
  password: 'mypassword'
)

################### Result seeds ###################
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
  fact_score: 'very-high',
  political_bias: 'center',
  source_media: 'Reuters',
  user_input: 'The UN reports that global hunger has decreased by 15% over the past decade.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.95,
  title: 'Global hunger declines by 15% in 10 years',
  user_id: User.last.id
)

Result.create(
  fact_score: 'low',
  political_bias: 'far-left',
  source_media: 'The Intercept',
  user_input: 'Capitalism has been the single biggest contributor to global inequality.',
  political_bias_confidence: 0.95,
  fact_score_confidence: 0.4,
  title: 'Capitalism and global inequality',
  user_id: User.first.id
)

Result.create(
  fact_score: 'mixed',
  political_bias: 'right-leaning',
  source_media: 'The Wall Street Journal',
  user_input: 'Tax cuts for corporations have led to job growth in all states.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.65,
  title: 'Corporate tax cuts and job growth',
  user_id: User.last.id
)

Result.create(
  fact_score: 'very-low',
  political_bias: 'far-right',
  source_media: 'Infowars',
  user_input: 'Climate change is a myth created by China to destabilize the West.',
  political_bias_confidence: 0.9,
  fact_score_confidence: 0.2,
  title: 'Climate change conspiracy theories',
  user_id: User.first.id
)

Result.create(
  fact_score: 'high',
  political_bias: 'left',
  source_media: 'The Guardian',
  user_input: 'Wind energy now accounts for 20% of Europe’s power supply.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.85,
  title: 'Wind energy contribution in Europe',
  user_id: User.first.id
)

Result.create(
  fact_score: 'mixed',
  political_bias: 'right',
  source_media: 'Fox News',
  user_input: 'Immigration is the main reason for rising unemployment in the US.',
  political_bias_confidence: 0.9,
  fact_score_confidence: 0.5,
  title: 'Immigration and unemployment rates',
  user_id: User.last.id
)

Result.create(
  fact_score: 'very-high',
  political_bias: 'neutral',
  source_media: 'Associated Press',
  user_input: 'NASA’s Artemis program aims to land astronauts on the moon by 2025.',
  political_bias_confidence: 0.7,
  fact_score_confidence: 0.95,
  title: 'NASA Artemis program plans',
  user_id: User.first.id
)

Result.create(
  fact_score: 'very-low',
  political_bias: 'left-leaning',
  source_media: 'MSNBC',
  user_input: 'The US military budget could singlehandedly end world poverty.',
  political_bias_confidence: 0.8,
  fact_score_confidence: 0.2,
  title: 'Military budget and world poverty',
  user_id: User.first.id
)

Result.create(
  fact_score: 'high',
  political_bias: 'right-leaning',
  source_media: 'The Daily Caller',
  user_input: 'Several states report economic growth after rolling back business regulations.',
  political_bias_confidence: 0.85,
  fact_score_confidence: 0.8,
  title: 'Economic growth and deregulation',
  user_id: User.first.id
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
