# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Category, user_id: user.id
    can :manage, Operation, user_id: user.id
    can :manage, User
  end
end
