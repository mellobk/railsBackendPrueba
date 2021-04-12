Rails.application.routes.draw do
  resources :user
  resources :postp
  resources :comentario
  resources :userlikepost

  get '/getallposts/:id_user', to: 'postp#getallposts'
end
