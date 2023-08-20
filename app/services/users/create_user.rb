# frozen_string_literal: true

module Users
  class CreateUser
    prepend SimpleCommand

    def initialize(user_attributes:)
      @user_attributes = user_attributes
    end

    def call
      User.create! @user_attributes
    end
  end
end
