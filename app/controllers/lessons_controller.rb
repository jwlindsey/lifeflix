class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_lesson, only: [:show]
    
    def show
        
    end
    
    private
    
    def require_authorized_for_current_lesson
        current_lesson = Lesson.find(params[:id])
        course_for_this_lesson = current_lesson.section.course
        if !current_user.enrolled_in?(course_for_this_lesson)
            redirect_to courses_path(course_for_this_lesson), alert: 'Please enroll in course to view lessons'
        end
    end
    
end
