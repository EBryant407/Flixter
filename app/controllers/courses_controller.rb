class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show 
    Course.find(params[:id])
  end
end
