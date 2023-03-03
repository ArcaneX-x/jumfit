class CoursesController < ApplicationController
  # before_action :set_question, only: [:create, :destroy]
  # before_action :set_answer, only: [:destroy]

  def index
    @courses = Course.all
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = @question.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end