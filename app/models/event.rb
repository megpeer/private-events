class Event < ApplicationRecord
  scope :past_events, -> { where('date < ?', Time.zone.now) }
  scope :future_events, -> { where('date > ?', Time.zone.now) }

  belongs_to :user
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, dependent: :destroy
  # , source: user
  # validates :title, :location, :body, allow_blank: false
end
