class Location < ApplicationRecord
  has_many :event_locations
  has_many :events, through: :event_locations
  attribute :description, :string

  validates :name, presence: true
end
