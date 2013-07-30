Rails.application.routes.draw do

  root "secrets#index"
  mount SimpleSignIn::Engine => "/simple_sign_in"
end
