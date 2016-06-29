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
	get 'pages/home' => 'pages#home'
	get 'pages/profile'
	get 'pages/contact'
	root 'pages#home'
end
