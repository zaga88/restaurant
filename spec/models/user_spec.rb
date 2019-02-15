require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'correct params' do
    let!(:user) { build(:user) }
    it 'user create normal' do
      expect(user.name).to eql('Test')
    end
    it "should require a email" do
      expect(build(:user, email: "adsds")).not_to be_valid
    end
    it "should require a password" do
      expect(build(:user, password: "adsds")).not_to be_valid
    end
  end
end
