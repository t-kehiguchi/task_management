class Task < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { minimum: 5 , maximum: 50 }
end
