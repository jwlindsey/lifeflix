class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_lesson, only: [:show]
    
    def show

    end
    
    private
    
    helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end

	def require_authorized_for_current_lesson
	    course_for_this_lesson = current_lesson.section.course
        if !current_user.enrolled_in?(course_for_this_lesson)
			redirect_to course_path(current_lesson.section.course), :alert => "You cannot access this course if you are not enrolled."
		end
	end
	
end
