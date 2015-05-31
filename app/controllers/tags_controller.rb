class TagsController < ApplicationController
  def index
     @tags = Rails.application.config.my_config["array"].grep(/#{params[:value].upcase}/)

    respond_to do |format|
      format.json { render :json => @tags.to_json }
    end
  end
end

