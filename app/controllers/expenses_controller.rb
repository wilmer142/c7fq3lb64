class ExpensesController < ApplicationController
  def index
     @expenses = Expense.order("date DESC")
  end
end
