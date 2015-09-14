class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  
    private
   # Confirms a logged-in user.
   def logged_in_user
     unless logged_in?
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end
    
   
   def post_params
      params.require(:post).permit(:title, :body)  
   end
   
end
