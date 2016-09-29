class ArticlePolicy < ApplicationPolicy
	def update?
		return true if admin? || record.user_id == user.id
	end

	private

	def admin?
		admin_types.include?(user.type)
	end

end