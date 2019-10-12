class SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]

  def new
    @section = Section.new
  end

  def create
    @section = current_course.section.create(section_params)
    redirect_to instructor_course_path(current_course)
  end

  def update
    current_section.update_attributes(section_params)
  end

  private

  def current_section
    @current_section ||= Section.find(params[:id])
  end

  def require_authorized_for_current_course
    if current_section.course.user != current_user
     flash[:notice] = "You must Enroll first"
     redirect_to courses_url
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:id])
  end

  def lesson_params
    params.require(:section).permit(:title, :subtitle, :video, :row_order_position)
  end

end