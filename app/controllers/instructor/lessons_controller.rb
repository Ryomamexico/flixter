class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section
  def new
    @lesson = Lesson.new
  end
  def create
    @lesson = current_section.lessons.create(lessons_params)
    redirect_to instructor_course_path(current_section.course)
  end

  private
  helper_method :current_section
  def require_authorized_for_current_section
    if current_section.course.user != current_user
      return render text: 'Unauthorized', status: :Unauthorized
    end    
  end
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end
  def lessons_params
    params.require(:lesson).permit(:title, :subtitle)
  end
end
