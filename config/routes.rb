Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/users', defaults: { format: :json },
  controllers: {
    registrations: 'api/v1/registrations',
  }

  use_doorkeeper do
    skip_controllers :authorizations, :applications,
                     :authorized_applications
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: { registrations: 'api/v1/registrations' }
    end
  end
end
