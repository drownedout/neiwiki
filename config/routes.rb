Rails.application.routes.draw do
	devise_for :users
	resources :versions, only: [:index]
	resources :categories

	resources :articles do
		collection do
			get 'search'
		end
		resources :comments
	end
	root 'articles#index'
end
