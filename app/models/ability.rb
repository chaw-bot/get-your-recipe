class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.admin?
      can :manage, :all
    else
      can :read, Recipe, public: true
      can :create, [Food, Recipe], user_id: user.id
      can :destroy, [Food, Recipe], user_id: user.id
    end
  end
end
