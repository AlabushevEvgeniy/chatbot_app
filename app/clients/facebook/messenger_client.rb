class Facebook::MessengerClient
  def send_message(message)
    response = faraday_connection.post("me/messages?access_token=#{page_access_token}", message)
    response.body if response&.success?
  end

  def user_info(sender_id)
    response = faraday_connection.get("#{sender_id}?access_token=#{page_access_token}")
    response.body if response&.success?
  end

  private

  def faraday_connection
    connection = Faraday.new(url: api_url) do |faraday|
      faraday.response :json
      faraday.request :json
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
    connection
  end

  def page_access_token
    # ENV['FACEBOOK_PAGE_ACCESS_TOKEN']
    "EAAHlQHlllXEBALr25Mb2nyBODmZBwl10TiHcGQOK9cT4rGcJKFyns5nLiLg4nFU6xK9fdlZCN0VmeWKJ1MeMRyX2oa7h2m3tK51pNrg1Vsbp4bmTVeezuFD2i5zaoKNqPmv7RQxYGpIdljcbZA7g9QNFxIQ2dpjgP3LL25X4gZDZD"
  end

  def api_url
    # ENV['FACEBOOK_GRAPH_BASE_URL']
    "https://graph.facebook.com/v3.2/"
  end
end
