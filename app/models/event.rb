class Event < ApplicationRecord
  has_and_belongs_to_many :users

  validates :eventdate, comparison: { greater_than: DateTime.now }
end
