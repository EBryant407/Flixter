class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def showCourse.find(params[:id])
  end
end
