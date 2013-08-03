SimpleSignIn::Engine.routes.draw do
  post "login", to: "login#create"
  match "signout", to: "login#destroy", via: 'delete'
  root to: "login#new"
end
