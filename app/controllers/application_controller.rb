class ApplicationController < ActionController::API
  rescue_from StandardError, with: :handle_error_method

  def handle_error_method
    nil
  end

end
