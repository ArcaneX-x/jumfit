class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user_question, only: %i[edit update destroy]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "Deleted"
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_current_user_question
    @question = current_user.questions.find(params[:id])
  end
end
