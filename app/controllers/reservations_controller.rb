class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token, raise: false

  # GET /reservations
  # GET /reservations.json
  def index

    headers['Access-Control-Allow-Origin'] = '*'
    @reservations = Reservation.all
    respond_to do |format|
      # perform the standard login check for the html version of the request.
      # ( this will also render the default index template )
      format.html do
        check_if_admin_logged_in
      end

      format.json do
        # TODO: do knock authentication check here
        render json: @reservations, include: ['users','property']
      end
    end #respond_to
  end #index

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    respond_to do |format|
      format.html {check_if_admin_logged_in}
      format.json { render json: @reservation, include:['property']}
    end
  end

  # GET /reservations/new
  def new
    check_if_admin_logged_in
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
    check_if_admin_logged_in
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    total_due = @reservation.get_total_due
    @reservation[:total_due] = total_due
    @reservation.save

    respond_to do |format|

      if @reservation.persisted?
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, include:['property']  }
      else
        format.html { render :new }
        format.json { render json: { status: 401, errors: @reservation.errors } }

        # for the API create
        # headers['Access-Control-Allow-Origin'] = '*'
        # reservation = Reservation.create reservation_params
        #
        # render json: reservation, include: ['flight', 'user']
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:from_date, :to_date, :property_id, :guests_count, :booking_code)
    end
end
