class DishesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]
  
  def create
    @dish = current_user.dishes.build(dish_params)
    if @dish.save
      flash[:success] = "料理が登録されました！"
      redirect_to dish_path(@dish)
    else
      render 'dishes/new'
    end
  end
  
  def destroy
    @dish = Dish.find(params[:id])
    if current_user.admin? || current_user?(@dish.user)
      @dish.destroy
      flash[:success] = "料理が削除されました"
      redirect_to request.referrer == user_url(@dish.user) ? user_url(@dish.user) : root_url
    else
      flash[:danger] = "他人の料理は削除できません"
      redirect_to root_url
    end
  end
  
  private

    def dish_params
      params.require(:dish).permit(:name, :description, :portion, :tips,
                                   :reference, :required_time, :popularity, :cook_memo, :picture,
                                   ingredients_attributes: [:id, :name, :quantity])
    end
    
    def correct_user
      # 現在のユーザーが更新対象の料理を保有しているかどうか確認
      @dish = current_user.dishes.find_by(id: params[:id])
      redirect_to root_url if @dish.nil?
    end
end
