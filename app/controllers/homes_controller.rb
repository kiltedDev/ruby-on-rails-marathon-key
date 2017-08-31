require 'pry'

class HomesController < ApplicationController
  # GET /questions
  def index
    @cohort = Cohort.last

  end
end
