class StaticPagesController < ApplicationController

  def index
    if session[:new_user_query]
      Query.create(
          :content => session[:new_user_query],
          :user_id => current_user.id
        )
      reset_session
      redirect_to user_queries_path(current_user.id)
    end
    @user = User.new
    @query = Query.new
    # @user = User.new
  end

end

