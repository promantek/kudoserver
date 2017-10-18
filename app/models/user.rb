class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable

  has_many :kudos_given, class_name: 'Kudo', foreign_key: :giver_id, dependent: :destroy
  has_many :kudos_received, class_name: 'Kudo', foreign_key: :receiver_id

  belongs_to :organization

  validates_presence_of :username, :first_name, :last_name, :organization
  validates_uniqueness_of :username

  def over_limit?
    kudos_given.where(created_at: 1.day.ago..Time.current).count > 2
  end
end
