Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end

  root to: "pins#index"
end
