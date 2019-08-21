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
    ENV.fetch('FACEBOOK_PAGE_ACCESS_TOKEN')
  end

  def api_url
    ENV.fetch('FACEBOOK_GRAPH_BASE_URL')
  end
end
