class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
   def create
    @post = Post.new
    @post.user_id = current_user.id
    @post.title = Post.title
    @post.body = Post.body
    @post.save
    redirect_to posts_path
  end
     # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
   
  end
