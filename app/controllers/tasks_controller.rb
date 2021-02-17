class TasksController < ApplicationController

    before_action :authenticate_user!
    def index
        # @task = Task.all()
        #  @task=  Task.joins(:user).where(:users => { :id => current_user })
         @task = Task.where(:user_id => current_user)
    
    end

    def new
        @task = current_user.tasks.build
    end

    def show
        @task = Task.find(params[:id])
    end

    def create
        # output =params[:task].inspect
        # render plain: output

        @task = current_user.tasks.build(post_params)

        if(@task.save)
            redirect_to @task
        else
            render 'new'
        end
    end


    private def post_params
        params.require(:task).permit(:title, :body)
    end 



    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])

        if(@task.update(post_params))
            redirect_to @task
        else
            render 'edit'
        end
    end


    def destroy 
        @task = Task.find(params[:id])

        @task.destroy

        # redirect_to task_path
        redirect_to '/'
    end
end
