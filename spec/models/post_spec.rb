require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:title).is_at_most(100) }
    it { should validate_length_of(:content).is_at_least(10) }
  end


  # describe 'custom methods' do
  #   describe 'self.search' do
  #     it 'returns posts with a matching title' do
  #       post1 = FactoryBot.create(:post, title: 'Matching Title', user: user)
  #       post2 = FactoryBot.create(:post, title: 'Unmatching Title', user: user)
  #       result = Post.search('Matching Title')
  #       expect(result).to eq([post1])
  #     end
  #   end

  #   describe 'self.search' do
  #     it 'returns posts with a matching content' do
  #       post1 = FactoryBot.create(:post, content: 'Matching content', user: user)
  #       post2 = FactoryBot.create(:post, content: 'Unmatching content', user: user)
  #       result = Post.search('Matching content')
  #       expect(result).to eq([post1])
  #     end
  #   end

  #   describe 'self.search' do
  #     it 'returns posts with a matching title or content' do
  #       post1 = FactoryBot.create(:post, title: 'Matching Title', content: 'Unmatching content', user: user)
  #       post2 = FactoryBot.create(:post, title: 'Unmatching Title', content: 'Matching content', user: user)
  #       result = Post.search('Matching')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, title: 'Matching Title', content: 'Unmatching content', user: user)
  #       post2 = FactoryBot.create(:post, title: 'Unmatching Title', content: 'Matching content', user: user)
  #       result = Post.search('')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, title: 'Matching Title', content: 'Unmatching content', user: user)
  #       post2 = FactoryBot.create(:post, title: 'Unmatching Title', content: 'Matching content', user: user)
  #       result = Post.search(nil)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user' do
  #     it 'returns posts with a matching user name' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_user(user.name)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user' do
  #     it 'returns posts with a matching user email' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_user(user.email)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_user('')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_user(nil)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_category' do
  #     it 'returns posts with a matching category' do
  #       post1 = FactoryBot.create(:post, category: 'Matching Category', user: user)
  #       post2 = FactoryBot.create(:post, category: 'Unmatching Category', user: user)
  #       result = Post.search_by_category('Matching Category')
  #       expect(result).to eq([post1])
  #     end
  #   end

  #   describe 'self.search_by_category' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, category: 'Matching Category', user: user)
  #       post2 = FactoryBot.create(:post, category: 'Unmatching Category', user: user)
  #       result = Post.search_by_category('')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_category' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, category: 'Matching Category', user: user)
  #       post2 = FactoryBot.create(:post, category: 'Unmatching Category', user: user)
  #       result = Post.search_by_category(nil)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_date' do
  #     it 'returns posts with a matching date' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_date(post1.created_at)
  #       expect(result).to eq([post1])
  #     end
  #   end

  #   describe 'self.search_by_date' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_date('')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_date' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_date(nil)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_date_range' do
  #     it 'returns posts within the date range' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_date_range(post1.created_at, post2.created_at)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_date_range' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_date_range('', '')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_date_range' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_date_range(nil, nil)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user_and_category' do
  #     it 'returns posts with a matching user name or category' do
  #       post1 = FactoryBot.create(:post, user: user, category: 'Matching Category')
  #       post2 = FactoryBot.create(:post, user: user, category: 'Unmatching Category')
  #       result = Post.search_by_user_and_category(user.name)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user_and_category' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user, category: 'Matching Category')
  #       post2 = FactoryBot.create(:post, user: user, category: 'Unmatching Category')
  #       result = Post.search_by_user_and_category('')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user_and_category' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user, category: 'Matching Category')
  #       post2 = FactoryBot.create(:post, user: user, category: 'Unmatching Category')
  #       result = Post.search_by_user_and_category(nil)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user_and_date' do
  #     it 'returns posts with a matching user name or date' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_user_and_date(user.name)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user_and_date' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_user_and_date('')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_user_and_date' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_user_and_date(nil)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_category_and_date' do
  #     it 'returns posts with a matching category or date' do
  #       post1 = FactoryBot.create(:post, category: 'Matching Category', user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_category_and_date('Matching Category')
  #       expect(result).to eq([post1])
  #     end
  #   end

  #   describe 'self.search_by_category_and_date' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, category: 'Matching Category', user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_category_and_date('')
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  #   describe 'self.search_by_category_and_date' do
  #     it 'returns all posts when no search term is provided' do
  #       post1 = FactoryBot.create(:post, category: 'Matching Category', user: user)
  #       post2 = FactoryBot.create(:post, user: user)
  #       result = Post.search_by_category_and_date(nil)
  #       expect(result).to eq([post1, post2])
  #     end
  #   end

  # end
end