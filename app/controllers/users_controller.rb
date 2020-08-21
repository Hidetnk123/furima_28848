class UsersController < ApplicationController

  def new
    
  end

  def create
    @user = User.new(product_params)
    if @user.save
      redirect_to controller: :products, action: :index
    else
      render "new"
    end
  end

  def destory

  end

end
