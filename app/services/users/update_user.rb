# frozen_string_literal: true

module Users
  class UpdateUser
    prepend SimpleCommand

    def initialize(id:, user_attribute:, new_value:)
      @id = id
      @user_attribute = user_attribute
      @new_value = new_value
    end

    def call
      User.update(@id, @user_attribute => @new_value)
    end
  end
end
