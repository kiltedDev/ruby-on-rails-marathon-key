class StudentsController < ApplicationController
  # GET /questions
  def index
    @students = Student.all
  end

end
