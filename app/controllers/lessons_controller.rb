class LessonsController < ApplicationController
  before_action :set_course, only: [:show, :index]
  before_action :set_lesson, only: :show

  def index
    @lessons = @course.lessons
  end

  def show; end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = @course.lessons.find(params[:id])
  end
end
