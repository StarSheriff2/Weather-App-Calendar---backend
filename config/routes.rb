Rails.application.routes.draw do
  # namespace the controllers without affecting the URI
  scope module: :v2, :defaults => {:format => :json}, constraints: ApiVersion.new('v2') do
    resources :reminders, only: :index
  end

  scope module: :v1, :defaults => {:format => :json}, constraints: ApiVersion.new('v1', default: true) do
    resources :reminders
  end

  get  '/healthcheck', to: 'healthcheck#check'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
