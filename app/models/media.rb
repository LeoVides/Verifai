class Media < ApplicationRecord
  has_many :media_results
  has_many :results, through: :media_results
end
