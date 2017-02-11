class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  belongs_to :user
end
