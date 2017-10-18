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

require 'rails_helper'

RSpec.describe Kudo, type: :model do
  it { should belong_to(:giver).class_name('User') }
  it { should belong_to(:receiver).class_name('User') }

  it { should validate_presence_of(:giver_id) }
  it { should validate_presence_of(:receiver_id) }
  it { should validate_length_of(:text).is_at_most(140) }

  describe "#with_giver" do
    subject { FactoryGirl.create :kudo }

    it "returns the giver username and id" do
      expect(subject.with_giver['giver']).to include(
        "id" => subject.giver.id,
        "username" => subject.giver.username,
      )
    end
  end

  describe "#with_giver_and_reciever" do
    subject { FactoryGirl.create :kudo }

    it "returns the giver username and id" do
      expect(subject.with_giver_and_reciever['receiver']).to include(
        "id" => subject.receiver.id,
        "username" => subject.receiver.username,
      )
      expect(subject.with_giver_and_reciever['giver']).to include(
        "id" => subject.giver.id,
        "username" => subject.giver.username,
      )
    end
  end
end
