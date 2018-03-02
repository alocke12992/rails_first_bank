class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts 
  end

  def show
  end

  def new
    @account = Account.new(params[:id])
  end

  def create 
    @account = current_user.accounts.new(account_params)

    if @account.save 
      redirect_to accounts_path 
    else 
      render :new 
    end 

  end 

  def edit
  end

  def update
  end 

  def destroy 
  end 

  private 
    def account_params 
      params.require(:account).permit(:name, :balance)
    end 

end
