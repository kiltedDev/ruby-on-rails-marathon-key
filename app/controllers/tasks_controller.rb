class TasksController < ApplicationController
  # GET /questions
  def show
    @project = GroupProject.find(params[:group_project_id])
    @task = Task.find(params[:id])
  end

end
