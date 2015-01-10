class NamesController < ApplicationController
  def index
    client = TwitterClient.new
    @search_results = NameFilter.new(client.search).filter
  end
end
