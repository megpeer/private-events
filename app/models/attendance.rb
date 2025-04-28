class Atendance < ApplicationRecord
  belongs_to :user
  has_one :event

  validates :attendee, :attended_event, allow_blank: false
end
