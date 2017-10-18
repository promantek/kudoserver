require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:kudos_received) }
  it { should have_many(:kudos_given).dependent(:destroy) }
  it { should belong_to(:organization) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:organization) }
  it { should validate_uniqueness_of(:username) }

  describe "#over_limit?" do
    subject { FactoryGirl.create :user }

    it { expect(subject.over_limit?).to be false }

    context "with three recent kudos" do
      let!(:kudos) { 3.times { FactoryGirl.create :kudo, giver: subject } }

      it { expect(subject.over_limit?).to be true }
    end
  end
end
