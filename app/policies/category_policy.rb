class CategoryPolicy < ApplicationPolicy
	def create?
		admin?
	end

	def update?
		admin?
	end

	private

	def admin?
		admin_types.include?(user.type)
	end

end