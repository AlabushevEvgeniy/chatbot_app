class Facebook::MessagesController < ApplicationController

  def create
    MessengerClient.new.send_message('hello world!!!')
    head :ok
  end
end
