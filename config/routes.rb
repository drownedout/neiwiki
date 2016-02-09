Rails.application.routes.draw do
	devise_for :users
	resources :versions

	resources :articles do
		collection do
			get 'search'
		end
	end
	root 'articles#index'
end
