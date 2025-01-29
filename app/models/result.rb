class Result < ApplicationRecord
  belongs_to :user
  validates :user_input, presence: true, length: { in: 50..5000, wrong_length: "You should provide between 50 and 5000 characters" }
end
