class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, :all
    end
  end
end