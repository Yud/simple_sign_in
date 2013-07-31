SimpleSignIn::Engine.routes.draw do
  root "login#new"
  post "login", to: "login#create"
  delete "login", to: "login#destroy"
end
