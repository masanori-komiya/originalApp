class Shift < ApplicationRecord
  validates :day, presence: true
  validates :kind, presence: true
  belongs_to :user
  belongs_to :term
end
