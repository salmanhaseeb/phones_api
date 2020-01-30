Rails.application.routes.draw do
  resources :phones, only: [:index, :create]
  post '/phones/:phone' => 'phones#create_special'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
