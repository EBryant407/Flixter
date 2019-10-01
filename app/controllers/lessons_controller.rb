class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]

  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_authorized_for_current_course
    if current_lesson.section.course != current_user
     flash[:notice] = "You must Enroll first"
     redirect_to courses_url
    end
  end

end