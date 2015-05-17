class StaticPagesController < ApplicationController

  def index
    if current_user
    end
    @query = User.new
    # @user = User.new
  end

end

