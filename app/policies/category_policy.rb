class CategoryPolicy < ApplicationPolicy
	def new
		admin?
	end

	def create
		admin?
	end

	def edit
		return true if admin?
	end

	private

	def admin?
		admin_types.include?(user.type)
	end

end