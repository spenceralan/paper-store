class UsersController < ApplicationController

  def reviews
    @reviews = Review.where(user_id: current_user.id)
  end

end
