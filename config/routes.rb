Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
	devise_for :users
	resources :versions, only: [:index, :show]
	resources :categories

	scope "/admin_dashboard" do
		resources :users, except: [:index, :show]
	end

	resources :users, only: [:index, :show], as: 'contributors'

	resources :forums do
		collection do
			get 'search'
		end
		resources :answers do
			member do
				get :flagged
				get :unflag
			end
		end
	end

	resources :articles do
		collection do
			get 'search'
		end
		resources :comments do
			member do
				get :flagged
				get :unflag
			end
		end
	end
	get 'pages/home' => 'pages#home'
	get 'pages/profile'
	get 'pages/contact'
	get 'pages/terms'
	root 'pages#home'

	get 'admin_dashboard', :to => 'admin_dashboard#index', :as => :admin_dashboard_index
end
