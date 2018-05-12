class Location < ApplicationRecord
  has_many :event_locations
  has_many :events, through: :event_locations
  attribute :description, :string

  validates :name, presence: true

  def self.search_location(location_name)
    search = self.find_by(name: location_name)
    if search.nil?
      self.create(name: location_name)
    else
      return search
    end
  end
end
