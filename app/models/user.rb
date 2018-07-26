# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  username             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  first_name           :text
#  last_name            :text
#

class User < ApplicationRecord
  has_many :kudos_given, class_name: 'Kudo', foreign_key: :giver_id, dependent: :destroy
  has_many :kudos_received, class_name: 'Kudo', foreign_key: :receiver_id

  validates_presence_of :username, :first_name, :last_name

  def kudos_given_count
    kudos_given.count
  end

  def kudos_received_count
    kudos_received.count
  end

end
