class Kudo < ApplicationRecord
  belongs_to :giver, class_name: 'User', counter_cache: :kudos_given_count, inverse_of: :kudos_given
  belongs_to :receiver, class_name: 'User', counter_cache: :kudos_received_count, inverse_of: :kudos_received

  validates_presence_of :giver_id, :receiver_id
  validates :text, length: { maximum: 140 }
  validate :rate_limit_giver

  def with_giver
    as_json(include: { giver: user_json_params })
  end

  def with_giver_and_receiver
    as_json(include: { receiver: user_json_params, giver: user_json_params })
  end

  private

  def rate_limit_giver
    errors[:giver] << 'has too many kudos today' if giver.try!(:over_limit?)
  end

  def user_json_params
    { only: [:id, :username] }
  end
end
