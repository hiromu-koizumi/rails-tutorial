class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the Sample App!"
      # ユーザーページへ画面遷移
      redirect_to @user
    else
      render 'new'
    end
  end


  # 外部から使えないようにしている
  private

    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
