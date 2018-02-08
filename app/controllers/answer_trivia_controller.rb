class AnswerTriviaController < ApplicationController
  def index
     answered_questions=UsersAnsweredQuestion.where(user_id:current_user.id).map{|u| u.trivium_id}
    @question = params["category_id"].present? ? Trivium.where(category_id: params["category_id"]).where.not(user_id: current_user.id,id:answered_questions).order("RANDOM()").first : Trivium.where.not(user_id: current_user.id,id:answered_questions).order("RANDOM()").first
    if (@question).nil?
      redirect_to new_trivium_path, notice: 'No questions remaining to be answered'
    end
  end

  def get_score
    trivium = Trivium.find(params[:id])
    UsersAnsweredQuestion.create!(user_id:current_user.id,trivium_id:params[:id])
    if (trivium.right_answer == params["option"])
      msg = "your answer is right, #{trivium.right_answer} : #{trivium["option_#{trivium.right_answer}"]}"
      current_user.update(:score => (current_user.score.to_i + 4))


      if(UsersCategoryScore.find_by_user_id(current_user.id).present?)
        # user present
        @user_cat=UsersCategoryScore.where(user_id:current_user.id)
        if(@user_cat.where(category_id:trivium.category_id).present?)
          @user_cat=@user_cat.where(category_id:trivium.category_id)
          @user_cat.first.update(score:@user_cat.first.score.to_i+4)
        else
          @user_cat=UsersCategoryScore.create(user_id:current_user.id,category_id:trivium.category_id,score:4)
        end
      else
        @user_cat=UsersCategoryScore.create(user_id:current_user.id,category_id:trivium.category_id,score:4)

      end

      redirect_to answer_trivia_path(category_id: params[:category_id]), notice: msg

    else
      msg = "your answer is wrong, #{trivium.right_answer} : #{trivium["option_#{trivium.right_answer}"]}"
      current_user.update(:score => ((current_user.score.nil? ? 0 : current_user.score) - 1))
      redirect_to answer_trivia_path(category_id: params[:category_id]), alert: msg
      if(UsersCategoryScore.find_by_user_id(current_user.id).present?)
        # user present
        @user_cat=UsersCategoryScore.where(user_id:current_user.id)
        if(@user_cat.where(category_id:trivium.category_id).present?)
          @user_cat=@user_cat.where(category_id:trivium.category_id)
          @user_cat.first.update(score:@user_cat.first.score.to_i-1)
        else
          @user_cat=UsersCategoryScore.create(user_id:current_user.id,category_id:trivium.category_id,score:-1)
        end
      else
        @user_cat=UsersCategoryScore.create(user_id:current_user.id,category_id:trivium.category_id,score:-1)

      end

    end
  end

  def show_answer_result

  end
end
