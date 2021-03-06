class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @items = current_user.items
  end

  def update
    if current_user.update(user_params) # 更新出来たかを条件分岐する
      redirect_to root_path # 更新できたらrootパスへ
    else
      redirect_to "show" # 失敗すれば再度マイページへ
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email) # 編集出来る情報を制限
  end
  
end
