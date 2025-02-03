class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :results
  has_one_attached :profile_picture

  def add_points_to_checker_score
    self.update(checker_score: self.checker_score + 5)
  end

  def self.extension_user
    User.find_by(email: "alice.wonder@example.com") || User.create(username: 'alice_wonder', email: 'alice.wonder@example.com', password: 'alice.wonder@example.com')
  end
end
