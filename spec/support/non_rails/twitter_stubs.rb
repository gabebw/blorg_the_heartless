module TwitterStubs
  def stub_matching_search(term, result_term, lang: "en",result_type: "recent", exclude: "retweets", count: 1)
    encoded_term = URI.encode(term)

    url = "https://api.twitter.com/1.1/search/tweets.json?count=100&exclude=#{exclude}&lang=#{lang}&q=#{encoded_term}&result_type=#{result_type}"

    stub_request(:get, Regexp.new(Regexp.escape(url))).
      to_return(status: 200, body: search_result(result_term, count).to_json)

    stub_next_search_page
  end

  def stub_next_search_page
    url = Regexp.new(Regexp.escape("https://api.twitter.com/1.1/search/tweets.json?count=4&include_entities=1&max_id=249279667666817023&q=%23freebandnames&result_type=mixed"))
    stub_request(:get, url).
      to_return(status: 200, body: empty_search_results.to_json)
  end

  def search_result(term, count)
    statuses = [status(term)] * count

    {
      "statuses" => statuses,
      "search_metadata" => {
        "max_id" => 250126199840518145,
        "since_id" => 24012619984051000,
        "refresh_url" => "?since_id=250126199840518145&q=%23freebandnames&result_type=mixed&include_entities=1",
        "next_results" => "?max_id=249279667666817023&q=%23freebandnames&count=4&include_entities=1&result_type=mixed",
        "count" => 4,
        "completed_in" => 0.035,
        "since_id_str" => "24012619984051000",
        "query" => "%23freebandnames",
        "max_id_str" => "250126199840518145"
      }
    }
  end

  def status(term)
    {
      "coordinates" => nil,
      "favorited" => false,
      "truncated" => false,
      "created_at" => "Mon Sep 24 03:35:21 +0000 2012",
      "id_str" => "250075927172759552",
      "entities" => {
        "urls" => [],
        "hashtags" => [
          {
            "text" => "freebandnames",
            "indices" => [
              20,
              34
            ]
          }
        ],
        "user_mentions" => [

        ]
      },
      "in_reply_to_user_id_str" => nil,
      "contributors" => nil,
      "text" => "Hello there #{term} why not\n eh",
      "metadata" => {
        "iso_language_code" => "en",
        "result_type" => "recent"
      },
      "retweet_count" => 0,
      "in_reply_to_status_id_str" => nil,
      "id" => 250075927172759552,
      "geo" => nil,
      "retweeted" => false,
      "in_reply_to_user_id" => nil,
      "place" => nil,
      "user" => {
        "profile_sidebar_fill_color" => "DDEEF6",
        "profile_sidebar_border_color" => "C0DEED",
        "profile_background_tile" => false,
        "name" => "Sean Cummings",
        "profile_image_url" => "http://a0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg",
        "created_at" => "Mon Apr 26 06:01:55 +0000 2010",
        "location" => "LA, CA",
        "follow_request_sent" => nil,
        "profile_link_color" => "0084B4",
        "is_translator" => false,
        "id_str" => "137238150",
        "entities" => {
          "url" => {
            "urls" => [
              {
                "expanded_url" => nil,
                "url" => "",
                "indices" => [
                  0,
                  0
                ]
              }
            ]
          },
          "description" => {
            "urls" => [

            ]
          }
        },
        "default_profile" => true,
        "contributors_enabled" => false,
        "favourites_count" => 0,
        "url" => nil,
        "profile_image_url_https" => "https://si0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg",
        "utc_offset" => -28800,
        "id" => 137238150,
        "profile_use_background_image" => true,
        "listed_count" => 2,
        "profile_text_color" => "333333",
        "lang" => "en",
        "followers_count" => 70,
        "protected" => false,
        "notifications" => nil,
        "profile_background_image_url_https" => "https://si0.twimg.com/images/themes/theme1/bg.png",
        "profile_background_color" => "C0DEED",
        "verified" => false,
        "geo_enabled" => true,
        "time_zone" => "Pacific Time (US & Canada)",
        "description" => "Born 330 Live 310",
        "default_profile_image" => false,
        "profile_background_image_url" => "http://a0.twimg.com/images/themes/theme1/bg.png",
        "statuses_count" => 579,
        "friends_count" => 110,
        "following" => nil,
        "show_all_inline_media" => false,
        "screen_name" => "sean_cummings"
      },
      "in_reply_to_screen_name" => nil,
      "source" => "<a>Twitter for Mac</a>",
      "in_reply_to_status_id" => nil
    }
  end

  def empty_search_results
    {
      "statuses" => [],
      "search_metadata" => {
        "max_id" => 250126199840518145,
        "since_id" => 24012619984051000,
        "refresh_url" => "?since_id=250126199840518145&q=%23freebandnames&result_type=mixed&include_entities=1",
        "next_results" => nil,
        "count" => 4,
        "completed_in" => 0.035,
        "since_id_str" => "24012619984051000",
        "query" => "%23freebandnames",
        "max_id_str" => "250126199840518145"
      }
    }
  end
end

RSpec.configure do |config|
  config.include TwitterStubs
end
