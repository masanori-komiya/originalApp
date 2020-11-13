class Term < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_many :shifts
end
