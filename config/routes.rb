Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :structure_items
      resources :content_items
      resources :inline_items
    end
  end

  mount_ember_app :frontend, to: "/"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
