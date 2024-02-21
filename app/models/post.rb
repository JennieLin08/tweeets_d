class Post < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { maximum: 100 }
    validates :content, presence: true, length: { minimum: 10 }

    # def self.search(search)
    #     if search
    #         where('title LIKE ?', "%#{search}%")
    #     else
    #         all
    #     end
    # end

    # def self.search_by_user(search)
    #     if search
    #         joins(:user).where('users.name LIKE ?', "%#{search}%")
    #     else
    #         all
    #     end
    # end

    # def self.search_by_category(search)
    #     if search
    #         where('category LIKE ?', "%#{search}%")
    #     else
    #         all
    #     end
    # end

    # def self.search_by_date(search)
    #     if search
    #         where('created_at LIKE ?', "%#{search}%")
    #     else
    #         all
    #     end
    # end
    
    # def self.search_by_date_range(start_date, end_date)
    #     if start_date && end_date
    #         where('created_at BETWEEN ? AND ?', start_date, end_date)
    #     else
    #         all
    #     end
    # end

    # def self.search_by_user_and_category(search)
    #     if search
    #         joins(:user).where('users.name LIKE ? OR category LIKE ?', "%#{search}%", "%#{search}%")
    #     else
    #         all
    #     end
    # end

    # def self.search_by_user_and_date(search)
    #     if search
    #         joins(:user).where('users.name LIKE ? OR created_at LIKE ?', "%#{search}%", "%#{search}%")
    #     else
    #         all
    #     end
    # end

    # def self.search_by_category_and_date(search)
    #     if search
    #         where('category LIKE ? OR created_at LIKE ?', "%#{search}%", "%#{search}%")
    #     else
    #         all
    #     end
    # end

    # def self.search_by_user_and_category_and_date(search)
    #     if search
    #         joins(:user).where('users.name LIKE ? OR category LIKE ? OR created_at LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    #     else
    #         all
    #     end
    # end

    # def self.search_by_user_and_date_range(search, start_date, end_date)
    #     if search
    #         joins(:user).where('users.name LIKE ? OR created_at BETWEEN ? AND ?', "%#{search}%", start_date, end_date)
    #     else
    #         all
    #     end
    # end

    # def self.search_by_category_and_date_range(search, start_date, end_date)
    #     if search
    #         where('category LIKE ? OR created_at BETWEEN ? AND ?', "%#{search}%", start_date, end_date)
    #     else
    #         all
    #     end
    # end

    # def self.search_by_user_and_category_and_date_range(search, start_date, end_date)
    #     if search
    #         joins(:user).where('users.name LIKE ? OR category LIKE ? OR created_at BETWEEN ? AND ?', "%#{search}%", "%#{search}%", start_date, end_date)
    #     else
    #         all
    #     end
    # end

    # def self.search_by_user_and_category_and_date_and_date_range(search, start_date, end_date)
    #     if search
    #         joins(:user).where('users.name LIKE ? OR category LIKE ? OR created_at LIKE ? OR created_at BETWEEN ? AND ?', "%#{search}%", "%#{search}%", "%#{search}%", start_date, end_date)
    #     else
    #         all
    #     end
    # end
end
