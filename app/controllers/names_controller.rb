class NamesController < ApplicationController
  def index
    client = TwitterClient.new
    @search_results = client.search
  end
end
