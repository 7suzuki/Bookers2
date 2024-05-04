Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'homes#top'
get 'homes/about' => 'homes#about' ,as: 'about'


resources :users, only: [:show, :index, :edit] #1つのページで行われてることが多い 
# resources :books, only: [:index, :show] 複数か単数か、ネストか

end
