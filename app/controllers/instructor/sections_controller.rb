class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:create]
  before_action :require_authorized_for_current_section, only: [:update]

  def create
    @section = current_course.sections.create(section_params)
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
    if current_course.user != current_user
     flash[:notice] = "You must Enroll first"
     redirect_to courses_url
    end
  end

  helper_method :current_course
  def current_course
   if params[:course_id]
    @current_course ||= Course.find(params[:course_id])
   else
    current_section.course
   end
  end

  def section_params
    params.require(:section).permit(:title, :subtitle, :video, :row_order_position)
  end
end
