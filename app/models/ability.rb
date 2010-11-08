class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user?

    if user.is_admin?
      can :manage, :all
    else
      can :read, [Icon, Route, Stop, Update, Vehicle]
      # Regular people can't access statuses or users.
    end
  end

end
