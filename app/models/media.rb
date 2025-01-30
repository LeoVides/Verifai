class Media < ApplicationRecord
  has_many :media_results, dependent: :destroy
  has_many :results, through: :media_results
end
