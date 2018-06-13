class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present? 
      can :read, :all
      can :update, :all
      if user.is_admin?
        can :manage, :all  
      end
    end
  end
end
