class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances
  # , source: user
  # validates :title, :location, :body, allow_blank: false
end
