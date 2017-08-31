class GroupProjectsController < ApplicationController
  # GET /questions
  def index
    @group_projects = GroupProject.all
  end

  def show
    @group_project = GroupProject.find(params[:id])
  end

end
