class Result < ApplicationRecord
  belongs_to :user
  has_many :media_results
  has_many :medias, through: :media_results
  validates :user_input, presence: true, length: { in: 50..5000, wrong_length: "You should provide between 50 and 5000 characters" }

  include PgSearch::Model
  pg_search_scope :search_by_results,
    against: [ :title, :user_input, :fact_score, :political_bias ],
    using: {
      tsearch: { prefix: true }
    }
end
