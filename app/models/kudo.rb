# == Schema Information
#
# Table name: kudos
#
#  id          :integer          not null, primary key
#  giver_id    :integer
#  receiver_id :integer
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Kudo < ApplicationRecord
  belongs_to :giver, class_name: 'User', counter_cache: :kudos_given_count
  belongs_to :receiver, class_name: 'User', counter_cache: :kudos_received_count

  validates_presence_of :giver, :receiver
  validates :text, length: { maximum: 140 }
end
