module ApplicationHelper
  def get_app_url
    ENV['APP_URL'] || 'http://localhost:3000'
  end
end
