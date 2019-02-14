Rails.application.routes.draw do
  root 'welcome#home'
  get '/about', to: 'welcome#about'
  resources :campaigns do
    resources :posts
  
  end
  
end
