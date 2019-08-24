class Facebook::MessagesController < ApplicationController

  def create
    Facebook::MessengerClient.new.send_message(
                      "recipient": {
                        "id":"112032206819748"
                      },
                      "message": {
                        "text": "hello, world!"
                      }
                    )
    head :ok
  end
end
