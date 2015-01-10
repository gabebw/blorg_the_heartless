class NamesController < ApplicationController
  def index
    search_results = TwitterClient.new.search
    @names = NameTransformer.new(
      NameFilter.new(search_results).filter
    ).transform
    @original_tweets = NameFilter.new(search_results).filter
  end
end
