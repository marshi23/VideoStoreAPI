Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :customers, only: [:index] do
  resources :rentals
end

resources :movies, only: [:index, :show, :create] do
  resources :rentals
end

post 'rentals/:id', to: 'rentals#checkout', as: 'checkout'

# post 'rentals/id', to: 'rental/checkin', as: 'checkin'



end
