class Review < ApplicationRecord
  belongs_to :movie
  validates :reviewer,
    presence: true
  validates :score,
    presence: true,
    numericality: { less_than_or_equal_to: 5,  only_integer: true }
end
