# frozen_string_literal: true

class DeleteUser
  prepend SimpleCommand

  def initialize(id:)
    @id = id
  end

  def call
    user = User.find_by_id(@id)
    return unless user

    user.destroy
  end
end
