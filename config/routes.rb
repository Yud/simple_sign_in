SimpleSignIn::Engine.routes.draw do
  root "login#new"
  post "login", to: "login#create", via: :post
  post "login", to: "login#destroy", via: :delete
end
