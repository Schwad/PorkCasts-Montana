class SearchesController < ApplicationController

  def show
    render 'show'
  end

  def private_show
    render 'private_show'
  end

  def search
    @queries = Query.search params[:content], limit: 25, fields: [:content]
    render 'show'
  end

  def autocomplete
    respond_to do |format|
      format.json {
        @queries = Query.search params[:term], limit: 5, fields: [:content]
        render json: { result: @queries[0].content }
      }
    end
  end

  def private_search
    @queries = Query.search params[:content], limit: 25, fields: [:content]
    render 'private_show'
  end
end
