class NamesController < ApplicationController
  def index
    search_results = TwitterClient.new.search
    filtered_by_name = NameFilter.new(search_results).filter
    @titles = PartOfSpeechFilter.new(
      NameTransformer.new(filtered_by_name).transform
    ).filter
  end
end
