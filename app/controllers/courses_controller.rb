class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show 
    @course = Course.find(params.permit(:id)[:id])
  end
end
