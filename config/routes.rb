Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/terms'
end