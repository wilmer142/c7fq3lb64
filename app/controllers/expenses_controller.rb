class ExpensesController < ApplicationController
  def index
  	if params[:category_id].present? && params[:concept].present?
	 		@expenses = Expense.where("category_id = ? and concept LIKE ?", params[:category_id], "%#{params[:concept]}%")
  	elsif params[:concept].present?
  		@expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%")
  	elsif params[:category_id].present?
  		@expenses = Expense.where("category_id = ?", params[:category_id], )
  	else
  		@expenses = Expense.all
  	end
  end

  private 
  	def expense_params
  		params.require(:expense).permit(:category_id, :date, :concept, :amount)
  	end
end
