require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do

  describe 'restaurant unauthorized' do
    before { get :reservations }
    it 'with unsign restaurant' do
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST #create' do
    let(:restaurant){ { name: 'Test', email: 'ddd@ff.ff', phone_number: '3-333-333-333'} }
    context 'valid attributes' do
      before{ post :create, params: {restaurant: restaurant} }
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'invalid params' do
      before do
        restaurant[:phone_number] = '32332'
        post :create, params: {restaurant: restaurant}
      end

      it 'returns valid errors msg' do
        expect(response).to have_http_status(401)
      end
    end
  end

end
