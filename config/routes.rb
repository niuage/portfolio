Rails.application.routes.draw do
  root to: "home#index"

  namespace :v2 do
    root to: "home#index"
  end
end
