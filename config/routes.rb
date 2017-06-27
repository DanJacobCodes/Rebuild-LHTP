Rails.application.routes.draw do
  resources :chapters do
    resources :sections do
      resources :lessons
    end
  end
end
