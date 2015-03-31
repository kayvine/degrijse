class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Users = {"degrijse" => "d888dedc02b6e2b9b3971a9b2c6edc53"}

  private
  def basic_authenticate
    authenticate_or_request_with_http_basic("Factr Administration") do |username, password|
      Users[username] == Digest::MD5.hexdigest(password)
    end
  end
end
