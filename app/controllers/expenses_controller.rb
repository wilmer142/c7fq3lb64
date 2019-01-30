class ExpensesController < ApplicationController
	before_action :authenticate_user!

  def index
  	@expenses = Expense.where("user_id = ?", current_user.id).order("date DESC")
    if params[:concept].present?
      @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
    end
    if params[:category_id].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id])
    end
  end

  private 
  	def expense_params
  		params.require(:expense).permit(:category_id, :date, :concept, :amount)
  	end
end
