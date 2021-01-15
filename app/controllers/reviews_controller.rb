class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, raise: false
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    headers['Access-Control-Allow-Origin'] = '*'
    respond_to do |format|
      format.html { check_if_admin_logged_in }
      format.json { render json: Review.all, include: ['reservation'] }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    check_if_admin_logged_in
  end

  # GET /reviews/new
  def new

    check_if_admin_logged_in
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    check_if_admin_logged_in
  end

  # POST /reviews
  # POST /reviews.json
  def create
    # headers['Access-Control-Allow-Origin'] = '*'
    puts "+++++++++++++++++++++++++++++"
    puts params[:reservation_id]
    puts "+++++++++++++++++++++++++++++"

    @review = Review.new(review_params)


    # puts Reservation.find_by(id: params[:reservation_id]).reviews

    respond_to do |format|
      if @review.save
        # puts "+++++++++++++++++++++++++++++"
        # puts Reservation.find_by(id: params[:reservation_id])
        # puts Reservation.find_by(id: params[:reservation_id]).reviews
        Reservation.find_by(id: params[:reservation_id]).reviews << @review
        # Reservation.find_by(id: params[:reservation_id]).id = @review.reservation_id


        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end

    # For the API create
    # headers['Access-Control-Allow-Origin'] = '*'
    # review = Review.create review_params
    #
    # render json: review, include: ['reservation', 'users']
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    puts "+++++++++++++++++++++++++++++++++++"
    puts "clicked"
    puts "+++++++++++++++++++++++++++++++++++"

    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reservations_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:comment, :rating, :reservation_id)
    end
end
