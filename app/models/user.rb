class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable

  has_many :kudos_given, class_name: 'Kudo', foreign_key: :giver_id, dependent: :destroy
  has_many :kudos_received, class_name: 'Kudo', foreign_key: :receiver_id

  validates_presence_of :username, :first_name, :last_name
  validates_uniqueness_of :username
end
