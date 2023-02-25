class UsersController < ApplicationController
  # before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def show
    # Для профиля пользователя нам понадобятся всего игры в порядке давности
    @games = @user.games.order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
