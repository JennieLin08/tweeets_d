require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:title).is_at_most(100) }
    it { should validate_length_of(:body).is_at_least(10) }
  end

  # describe 'custom methods' do
  #   # generic custom method template
  #   describe '#custom_method' do
  #     it 'does something' do
  #       result = post.custom_method
  #       expect(result).to eq(expected_result)
  #     end
  #   end
  # end
end