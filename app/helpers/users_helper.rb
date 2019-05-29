module UsersHelper


    def top_wine_type_rating
      red = @user.wines.red.average_rating,
      white = @user.wines.white.average_rating,
      rose = @user.wines.rose.average_rating,
      sparkling = @user.wines.sparkling.average_rating,
      sweet =  @user.wines.sweet.average_rating
      ratings = [red, white, sparkling, sweet, rose]

    end

    # def top_wine_type_count(user)
    #   # @user = current_user
    #   count = [user.wines.red.count,
    #               user.wines.white.count,
    #               user.wines.rose.count,
    #               user.wines.sparkling.count,
    #               user.wines.sweet.count]
    #   count.order('desc').limit(1)
    # end
end
