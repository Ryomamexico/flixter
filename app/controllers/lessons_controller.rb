class LessonsController < ApplicationController
  def show
    
  end
  private
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id]) 
  end
  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video)
  end
end
