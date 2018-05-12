class EventLocation < ApplicationRecord
  belongs_to :event
  belongs_to :location
  attribute :name, :string
end
