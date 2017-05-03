Rails.application.routes.draw do
  root 'bootstrap_examples#index'
  get "/navbar", to: 'bootstrap_examples#navbar'
end
