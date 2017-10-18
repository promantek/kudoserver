require 'rails_helper'

RSpec.describe 'Profile Controller', type: :request do
  let!(:users) { create_list(:user, 3) }
  let(:user) { users.first }

  describe "#home" do
    it "redirects to auth if not signed in" do
      get '/'
      expect(response).to redirect_to('/auth/sign_in')
    end

    context "after logging in" do
      before(:each) do
        post user_session_path, params: { user: { username: user.username,
                                                  password: user.password }}
        get '/'
      end

      it "renders home tempate" do
        expect(response.body).to include('Your Kudos')
      end

      it "returns successfully" do
        expect(response.status).to eq(200)
      end
    end
  end

  describe "#profile" do
    let(:profile_user) { users.second }

    it "redirects to auth if not signed in" do
      get "/profile/#{profile_user.id}"
      expect(response).to redirect_to('/auth/sign_in')
    end

    context "after logging in" do
      before(:each) do
        post user_session_path, params: { user: { username: user.username,
                                                  password: user.password }}
      end

      context "when viewing your profile" do
        it "redriects home" do
          get "/profile/#{user.id}"
          expect(response).to redirect_to('/')
        end
      end

      context "when viewing another profile" do
        before(:each) { get "/profile/#{profile_user.id}" }

        it "renders profile tempate" do
          expect(response.body).to include("#{profile_user.last_name}'s Profile")
        end

        it "returns successfully" do
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
