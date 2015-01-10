class NamesController < ApplicationController
  def index
    client = TwitterClient.new
    @search_results = NameTransformer.new(NameFilter.new(client.search).filter).transform
  end
end
