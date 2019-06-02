module UsersHelper

  def insights
    @user = current_user
    if @user.wines.average_rating && @user.wines.top_aromas.size == 3  && @user.wines.top_terms.size == 3
      render 'insights'
    else
      render 'no_insights'
    end
  end
end
