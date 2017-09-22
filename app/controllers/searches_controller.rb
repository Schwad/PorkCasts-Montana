class SearchesController < ApplicationController

  def show

  end

  def search
    @queries = Query.search params[:q], limit: 15, fields: [:content]
    render 'show'
  end

end
