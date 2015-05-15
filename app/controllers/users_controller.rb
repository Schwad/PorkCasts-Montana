class UsersController < ApplicationController
  def create
    @query = Query.new(
        :content => params[:user][:query][:content],
        :user_id => (User.last.id + 1)
      )
    @user = User.new(
        :id => User.last.id + 1,
        :email => params[:user][:email]
      )
    if @query.save && @user.save
      redirect_to user_queries_path(@user.id, @query.id)
    else
      redirect_to root_path
    end
  end

  private

  def whitelisted_params
    params.require(:user).permit(:email, :queries => [:content])
  end
end
