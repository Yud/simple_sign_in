SimpleSignIn::Engine.routes.draw do
  root "login#new"
  post "login", to: "login#create"
  match "signout", to: "login#destroy", via: 'delete'
end
