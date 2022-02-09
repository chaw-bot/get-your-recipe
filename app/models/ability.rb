class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Food, user_id: user.id
    can :manage, Recipe, user_id: user.id
    can :read, :all
  end
end
