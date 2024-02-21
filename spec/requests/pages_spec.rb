require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'responds successfully' do
      get :home
      expect(response).to be_successful
    end

    it 'renders the home template' do
      get :home
      expect(response).to render_template('home')
    end
  end

  describe 'GET #admin' do
    context 'when user is not authenticated' do
      it 'redirects to login page' do
        get :admin
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is authenticated' do
      before do
        user = FactoryBot.create(:user)
        sign_in user
      end

      it 'responds successfully' do
        get :admin
        expect(response).to be_successful
      end

      it 'renders the admin template' do
        get :admin
        expect(response).to render_template('admin')
      end
    end
  end
end