module ProductsHelper

  def username_of(review)
    User.find(review.user_id).username
  end

end
