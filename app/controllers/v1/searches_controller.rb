class V1::SearchesController < V1::ApplicationController

  def show
  end

  def private_show
  end

  def search
    @queries = Query.search params[:q], limit: 15, fields: [:content]
    render 'show'
  end

  def private_search
    @queries = Query.search params[:q], limit: 15, fields: [:content]
    render 'private_show'
  end
end
