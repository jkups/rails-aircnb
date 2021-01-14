class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def create
    @reservation = Reservation.find params[:id]

    # if reservation.is_valid?
      process_trxn = @reservation.pay_with_braintree params[:nonce]

      if process_trxn.success?
        @user = User.find params[:user_id]

        trxn_code = process_trxn.transaction.id
        @reservation.update trxn_code: trxn_code, trxn_status: 'successfull'
        @user.reservations << @reservation

        UserMailer.confirm_reservation(@user, @reservation).deliver_now
        render json: @reservation, include:['property']
      else
        render json: { status: 401, errors: 'Payment failed to process. Please try again.' }
      end
    # else
    #   flash[:error] = "The number of units you want is not available."
    #   redirect_to properties_path
    # end
    #
    # render json: pay_with_braintree total_due, params[:nonce]
  end


end
