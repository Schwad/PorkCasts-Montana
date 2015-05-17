class StaticPagesController < ApplicationController

  def index
    if current_user
    end
    @query = Query.new
    # @user = User.new
  end

end

