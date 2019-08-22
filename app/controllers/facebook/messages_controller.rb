class Facebook::MessagesController < ApplicationController

  def create
    Facebook::MessengerClient.new.send_message('hello world!!!')
    head :ok
  end
end
