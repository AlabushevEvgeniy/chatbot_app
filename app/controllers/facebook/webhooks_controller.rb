class Facebook::WebhooksController < ApplicationController

  HUB_VERIFY_TOKEN = 'hub.verify_token'.freeze
  HUB_CHALLENGE = 'hub.challenge'.freeze

  def index
    return head :bad_request if params[HUB_VERIFY_TOKEN] != webhook_verify_key
    render plain: params[HUB_CHALLENGE]
  end

  def create
    Facebook::MessengerClient.new.send_message('hello world!!!')
    head :ok
  end

  private

  def index_permit_params
    params.require([HUB_VERIFY_TOKEN, HUB_CHALLENGE]).permit(HUB_VERIFY_TOKEN, HUB_CHALLENGE)
  end

  def webhook_verify_key
    ENV.fetch('FACEBOOK_PAGE_ACCESS_TOKEN')
  end
end

