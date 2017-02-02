class UsersController < ApplicationController
	before_action :find_user, only: [:show, :destroy]
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path, notice: "User has been successfully created"
		else
			redirect_to :back
		end
	end

	def destroy
		@user.destroy
		redirect_to root_path, notice: "User has been successfully deleted"
	end

	private

	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :terms, :type)
	end
end