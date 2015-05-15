class UsersController < ApplicationController
  def create
    @user = User.new(whitelisted_params)
  end

  private

  def whitelisted_params
    djflka;sd
    params.require(:user).permit(:email, queries_attributes: [:content])
  end
end
