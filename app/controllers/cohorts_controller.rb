class CohortsController < ApplicationController
  # GET /questions
  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
    @students = @cohort.students
    @mentors = @cohort.mentors
  end
end
