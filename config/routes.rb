Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root to: 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  get "posts_api", to: "posts#posts_api"
  post "new_post_api", to: "posts#new_post_no_image_api"
end
