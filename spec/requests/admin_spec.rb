require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in admin
  end

  describe 'GET #edit' do
    it 'responds successfully' do
      get :edit, params: { id: admin.id }      
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the user' do
        put :update, params: { id: user.id, user: { role: 'editor' } }
        user.reload
        expect(user.reload.role).to eq('editor')        expect(user.status).to eq('new_status')
      end
    end

    context 'with invalid attributes' do
      it 'does not update the user' do
        put :update, params: { id: user.id, user: { role: nil, status: nil } }
        user.reload
        expect(user.role).to_not be_nil
        expect(user.status).to_not be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user' do
      delete :destroy, params: { id: user.id }
      expect(User.exists?(user.id)).to be_falsey
    end
  end
end