class SearchesController < ApplicationController

  def show
  end

  def private_show
  end

  def search
    @queries = Query.search params[:q], limit: 25, fields: [:content]
    render 'show'
  end

  def private_search
    @queries = Query.search params[:q], limit: 25, fields: [:content]
    render 'private_show'
  end
end
