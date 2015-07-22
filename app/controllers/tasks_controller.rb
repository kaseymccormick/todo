class TasksController < ApplicationController
    def index
      @task = Task.all
    end
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path
    end
  
    def show
      @task = Task.find(params[:id])
      # Automatically load the view in /views/posts/show.html.erb
    end
  
    # Get the form to edit a post.
    def edit
      @task = Task.find(params[:id])
      # Automatically load the view in /views/posts/edit.html.erb
    end
  
    # Processes the edit-post form submission.
    def update
      @task = Task.find(params[:id])
    
      if @task.update_attributes(task_params)
        redirect_to tasks_path # Redirection needs a request path.
      else
        # Rendering needs a specific view template to show.
      
        # erb :"posts/edit" # That's Sinatra though.
        render "edit" # "posts" folder is assumed.
      end
    end
  
    # Get the form to create a post.
    def new
      @task = Task.new
      # Automatically load the view in /views/posts/new.html.erb
    end
  
    # Processes the new-post form submission.
    def create
      @task = Task.new(task_params)
    
      if @task.save
        redirect_to tasks_path # Redirection needs a request path.
      else
        # Rendering needs a specific view template to show.
      
        # erb :"posts/new" # That's Sinatra though.
        render "new" # "posts" folder is assumed.
      end
    end
  
    private
  
    def task_params
      binding.pry
      params[:task].permit(:description)
    end
  
end
