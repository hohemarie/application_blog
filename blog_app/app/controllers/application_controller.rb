class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

class Migrations
  def migrate
    system('cd')
    system('cd depot-local-blo/blog-app/db/')
    system('rails db:migrate')
  end

end
