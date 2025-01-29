class Result < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_results,
    against: [ :title, :user_input, :fact_score, :political_bias ],
    using: {
      tsearch: { prefix: true }
    }
end
