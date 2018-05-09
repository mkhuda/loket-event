class User < ApplicationRecord
  has_many :events

  validates :name, :email, presence: true, length: { maximum: 150 }
end
