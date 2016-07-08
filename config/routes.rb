Rails.application.routes.draw do
	devise_for :users
	resources :versions, only: [:index]
	resources :categories
	resources :users, only: [:index, :show]

	resources :forums do
		resources :answers
	end

	resources :articles do
		collection do
			get 'search'
		end
		resources :comments
	end
	get 'pages/home' => 'pages#home'
	get 'pages/profile'
	get 'pages/contact'
	get 'pages/terms'
	root 'pages#home'
end
