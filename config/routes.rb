Rails.application.routes.draw do
  root 'bootstrap_examples#index'
  get "/navbar", to: 'bootstrap_examples#navbar'
  get "/btn", to: 'bootstrap_examples#btn'
  get "/tmp", to: 'bootstrap_examples#tmp'
end
