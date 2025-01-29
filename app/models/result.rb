class Result < ApplicationRecord
  belongs_to :user
  validates :user_input, presence: true, length: { in: 50..5000, wrong_length: "You should provide between 50 and 5000 characters" }
  after_create :add_points_to_user

  include PgSearch::Model
  pg_search_scope :search_by_results,
    against: [ :title, :user_input, :fact_score, :political_bias ],
    using: {
      tsearch: { prefix: true }
    }

  private

  def add_points_to_user
    self.user.add_points_to_checker_score
  end
end
