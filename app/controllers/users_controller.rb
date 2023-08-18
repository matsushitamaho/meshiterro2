class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
    # 特定のユーザ(@user)に関連づけられた投稿全て(.post_images)を取得して@post_imagesに渡す
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)  # user_params を使ってデータを更新
      redirect_to user_path(@user.id)  # 更新が成功したらユーザーページにリダイレクト
    else
      render 'edit'  # 更新が失敗したら編集ページを再表示
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
