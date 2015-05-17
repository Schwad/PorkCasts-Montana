class StaticPagesController < ApplicationController

  def index
    if session[:new_user_query]
      Query.create(
          :content => session[:new_user_query],
          :user_id => current_user.id
        )
      session[:new_user_query] = nil
    end
    @user = User.new
    @query = Query.new
    # @user = User.new
  end

end

