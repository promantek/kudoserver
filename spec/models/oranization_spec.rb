# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  username             :string
#  kudos_given_count    :integer
#  kudos_received_count :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  first_name           :text
#  last_name            :text
#

require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { should have_many(:users) }
end
