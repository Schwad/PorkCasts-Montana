class QueriesController < ApplicationController
  def index

  end

  def create
    @query_email = params[:query][:content]
    if User.exists?(:email => @query_email)
      redirect_to new_user_session_path
    else
      redirect_to new_user_registration_path
    end
  end
end
