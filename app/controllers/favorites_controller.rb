class FavoritesController < ApplicationController

  def index
    @favorite_questions = current_user.favorites_questions
    @user = current_user
    #@users # 基於測試規格，必須講定變數名稱，請用此變數中存放關注人數 Top 10 的使用者資料
  end

end
