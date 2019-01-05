require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user defined' do
    let!(:user)       { create(:user) }

    describe "creation" do
      it "can be created" do
        expect(user).to be_valid
      end

      it "cannot be created without first_name" do
        user.first_name = nil
        expect(user).to_not be_valid
      end

      it "cannot be created without last_name" do
        user.last_name = nil
        expect(user).to_not be_valid
      end
    end

    describe "custom name methods" do
      it 'has a full name method thet combine first_name and last_name' do
        expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
      end
  end
  end
end
