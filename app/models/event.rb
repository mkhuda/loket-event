class Event < ApplicationRecord
  belongs_to :user
  has_one :event_location, dependent: :nullify
  has_many :tickets, dependent: :delete_all

  validates :name, :event_detail, presence: true, length: { minimum: 5 }
end
