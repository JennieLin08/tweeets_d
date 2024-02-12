class PagesController < ApplicationController
  def home
    Time.zone = 'Asia/Manila'
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def admin
    @users = User.all
    @userpending = User.where(status: 'pending')
  end

end
