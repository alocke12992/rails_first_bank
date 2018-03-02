class AccountsController < ApplicationController

  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = current_user.accounts.new(account_params)
    if @account.save
      flash[:success] = 'Account Created!'
      redirect_to accounts_path
    else
      flash[:error] = "Error: #{@account.errors.full_messages.join("/n")}"
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance)
  end
end

flash = { success: 'It worked', error: 'It did not work'}