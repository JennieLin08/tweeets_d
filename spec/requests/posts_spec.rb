require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'responds successfully' do
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'responds successfully' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'responds successfully' do
      get :edit, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new post' do
        expect {
          post :create, params: { post: FactoryBot.attributes_for(:post) }
        }.to change(Post, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new post' do
        expect {
          post :create, params: { post: FactoryBot.attributes_for(:post, title: nil) }
        }.to_not change(Post, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the post' do
        put :update, params: { id: post.id, post: { title: 'New Title' } }
        post.reload
        expect(post.title).to eq('New Title')
      end
    end

    context 'with invalid attributes' do
      it 'does not update the post' do
        put :update, params: { id: post.id, post: { title: nil } }
        post.reload
        expect(post.title).to_not be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the post' do
      delete :destroy, params: { id: post.id }
      expect(Post.exists?(post.id)).to be_falsey
    end
  end
end