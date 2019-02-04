require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'correct params' do
    let!(:user) { build(:user) }
    it 'user create normal' do
      expect(user.name).to eql('Test')
    end
    it "should require a email" do
      build(:user, :email => "adsds").should_not be_valid
    end
    it "should require a password" do
      build(:user, :password => "adsds").should_not be_valid
    end
  end
end
