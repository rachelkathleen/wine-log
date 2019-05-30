module UsersHelper

  def insights
    @user = current_user
    if @user.wines.average_rating && @user.wines.top_aromas && @user.wines.top_terms
      render 'insights'
    else
      render 'no_insights'
    end
  end
end
