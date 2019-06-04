module UsersHelper

  #logic for what view is displayed for insights_path
  def insights
    @user = current_user
    if @user.wines.average_rating && @user.wines.top_aromas.size == 3  && @user.wines.top_terms.size == 3
      render 'insights'
    else
      render 'no_insights'
    end
  end

  #logic for what view is displayed for home_path
  def home
    @user = current_user
    if @user.wines.size > 0
      render 'cellar'
    else
      render 'first_wine'
    end
  end
end
