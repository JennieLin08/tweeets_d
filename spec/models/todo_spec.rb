require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:todo) { FactoryBot.create(:todo, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(100) }
  end

  # describe 'custom methods' do
  #   # generic custom method template
  #   describe '#custom_method' do
  #     it 'does something' do
  #       result = todo.custom_method
  #       expect(result).to eq(expected_result)
  #     end
  #   end
  # end
end