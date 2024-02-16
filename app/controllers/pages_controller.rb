class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:admin]
  def home
    Time.zone = 'Asia/Manila'
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
    if current_user
     @t_post = Post.where(user_id: current_user.id).count
    end
  end

  def admin
    @users = User.all
    @userpending = User.where(status: 'pending')
  end

  def news
    
  end
end
