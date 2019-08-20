class Facebook::WebhooksController < ApplicationController
  # skip_before_action :verify_authenticity_token

  HUB_VERIFY_TOKEN = 'hub.verify_token'.freeze
  HUB_CHALLENGE = 'hub.challenge'.freeze

  def create
    # Facebook::MessengerService.new(params).process_message!
    MessengerClient.new.send_message('hello world!!!')
    head :ok
  end

  def index
    return head :bad_request if params[HUB_VERIFY_TOKEN] != webhook_verify_key
    render plain: params[HUB_CHALLENGE]
  end

  private

  def index_permit_params
    params.require([HUB_VERIFY_TOKEN, HUB_CHALLENGE]).permit(HUB_VERIFY_TOKEN, HUB_CHALLENGE)
  end

  def webhook_verify_key
    # ENV['FACEBOOK_WEBHOOK_VERIFY_KEY']
    "2387c744-db7f-4034-b50e-3cf75c1e9799"
  end
end

