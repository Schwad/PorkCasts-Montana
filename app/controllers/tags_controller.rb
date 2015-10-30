class TagsController < ApplicationController
  def index
    myvalue = params[:value]
     @tags = Rails.application.config.my_config["array"].grep(/#{myvalue.upcase}/)

    respond_to do |format|
      format.json { render :json => @tags.to_json }
    end
  end
end

