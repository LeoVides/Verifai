Rails.application.routes.draw do
  # Tells Devise to use a custom "registrations" controller instead of the default one.
  devise_for :users, controllers: {
    registrations: "registrations"  # Overrides Devise's default RegistrationsController
  }
  # Defines custom routes specifically for Devise users
  devise_scope :user do
    # Creates a DELETE route for removing the user's profile picture
    # When a DELETE request is sent to "users/edit/profile_picture",
    # it will call the "remove_profile_picture" action inside the "registrations" controller.
    delete "users/edit/profile_picture", to: "registrations#remove_profile_picture", as: "remove_profile_picture"
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/results/history", to: "results#history", as: "history"
  get "results/history/:id", to: "results#show", as: "result_history"
  delete "results/history/:id", to: "results#destroy", as: "result"

  get "results", to: "results#search", as: "fact_check"
  post "results", to: "results#create"

  get "results/hot_topics", to: "results#hot_topics"

  get "insights", to: "pages#insights", as: "insights"
end
