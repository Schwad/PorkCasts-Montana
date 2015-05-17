class UsersController < ApplicationController
  def update
    if session[:editing_query]
      @query = Query.find(session[:editing_query])
      @query.content = params[:query][:content]
    else
      @query = Query.new(
        :content => params[:query][:content],
        :user_id => current_user.id
      )
    end
    if @query.save
      redirect_to user_queries_path(current_user.id)
    end
  end
end
