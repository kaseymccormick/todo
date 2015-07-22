class UsersController < ApplicationController

  def index
    @user = User.all
  end
   
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to posts_path
  end
  
  def show
    @user = Post.find(params[:id])
    # Automatically load the view in /views/posts/show.html.erb
  end
  
  # Get the form to edit a post.
  def edit
    @user = Post.find(params[:id])
    # Automatically load the view in /views/posts/edit.html.erb
  end
  
  # Processes the edit-post form submission.
  def update
    @user = Post.find(params[:id])
    
    if @user.update_attributes(user_params)
      redirect_to posts_path # Redirection needs a request path.
    else
      # Rendering needs a specific view template to show.
      
      # erb :"posts/edit" # That's Sinatra though.
      render "edit" # "posts" folder is assumed.
    end
  end
  
  # Get the form to create a post.
  def new
    @user = User.new
    # Automatically load the view in /views/posts/new.html.erb
  end
  
  # Processes the new-post form submission.
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to profile_path # Redirection needs a request path.
    else
      # Rendering needs a specific view template to show.
      
      # erb :"posts/new" # That's Sinatra though.
      render "new" # "posts" folder is assumed.
    end
  end
  
  private
  
  def user_params
    params[:user].permit(:name, :email, :password)
  end
end


