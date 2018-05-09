class Ticket < ApplicationRecord
  belongs_to :event

  validates :ticket_name, presence: true
end
