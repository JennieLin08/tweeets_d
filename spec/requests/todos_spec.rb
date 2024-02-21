require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:todo) { FactoryBot.create(:todo, user: user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'responds successfully' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'responds successfully' do
      get :edit, params: { id: todo.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new todo' do
        expect {
          post :create, params: { todo: FactoryBot.attributes_for(:todo) }
        }.to change(Todo, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new todo' do
        expect {
          post :create, params: { todo: FactoryBot.attributes_for(:todo, name: nil) }
        }.to_not change(Todo, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the todo' do
        put :update, params: { id: todo.id, todo: { name: 'New Name' } }
        todo.reload
        expect(todo.name).to eq('New Name')
      end
    end

    context 'with invalid attributes' do
      it 'does not update the todo' do
        put :update, params: { id: todo.id, todo: { name: nil } }
        todo.reload
        expect(todo.name).to_not be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the todo' do
      delete :destroy, params: { id: todo.id }
      expect(Todo.exists?(todo.id)).to be_falsey
    end
  end
end