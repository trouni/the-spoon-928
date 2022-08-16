class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # `Restaurant` => `scope` in the policy file
      # Restaurant.all => scope.all
      scope.all

      # Other examples:
      
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(user: user)
      # end

      # Published posts
      # scope.where(published: true).where.not(archived: true)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  # def new?
  #   create?
  # end
  
  def update?
    # `current_user` => `user` in the policy file
    # `@restaurant` => `record` in the policy file
    # restaurant.user == current_user
    record.user == user || user.admin?
  end

  # def edit?
  #   update?
  # end
  
  def destroy?
    record.user == user || user.admin?
  end
end
