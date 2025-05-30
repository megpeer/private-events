class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  scope :attending_event, ->(event_id) { attendances.where(attended_event_id: event_id.exists?) }
  scope :past_events, ->(attending_event) { where('date < ?', Time.zone.now) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances, dependent: :destroy
  validates :email, :username, uniqueness: true
end
