class PaymentsController < ApplicationController
  def index
    @category = Category.includes(:payments).find(params[:category_id])
    @payments = @category.payments.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @payment = Payment.new
    @categories = current_user.categories
  end

  def create
    @category = Category.find(params[:payment][:category_id])
    @payment = @category.payments.build(payments_params)
    @payment.author = current_user

    if @payment.save
      CategoryPayment.create(category: @category, payment: @payment)
      redirect_to category_payments_path(@category), notice: 'Payment created successfully'
    else
      render :new, alert: 'Failed to create payment.'
    end
  end

  private

  def payments_params
    params.require(:payment).permit(:name, :amount)
  end
end
