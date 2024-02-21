require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  # describe 'custom methods' do
  #   # generic custom method template
  #   describe '#custom_method' do
  #     it 'does something' do
  #       result = user.custom_method
  #       expect(result).to eq(expected_result)
  #     end
  #   end
  # end
end