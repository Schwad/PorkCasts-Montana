class QueriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @queries = @user.queries
  end
end
