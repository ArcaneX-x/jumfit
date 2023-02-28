class AnswersController < ApplicationController
  before_action :set_question, only: [:create, :destroy]
  before_action :set_answer, only: [:destroy]

  def create
    @new_answer = @question.answers.build(answer_params)
    @new_answer.user = current_user

    if @new_answer.save
      redirect_to @question, notice: t('controllers.answers.created')
    else
      flash[:alert] = 'Заполните, ответ'
      render 'questions/show'
      flash.discard
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.answers.destroyed')}

    if current_user_can_edit?(@answer)
      @answer.destroy!
    else
      message = {alert: I18n.t('controllers.answers.error')}
    end

    redirect_to @question, message
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