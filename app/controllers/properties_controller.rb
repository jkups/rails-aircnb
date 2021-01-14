class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  # GET /properties
  # GET /properties.json
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @properties = Property.all


    respond_to do |format|
      format.html { check_if_admin_logged_in  }
      format.json { render json: Property.all, include: ['images','reservations','reviews'] }
    end
  end

  #GET /properties/search/:search_term/
  def search
    results = Property.near(params[:search_term], 100, units: :km)
    # results = Property.all.limit(params[:limit]).offset(params[:offset])
    render json: results, include: ['images','reservations','reviews']
  end
  #GET /properties/search/:search_term/:limit/:offset
  def search_limit
    results = Property.near(params[:search_term], 100, units: :km).limit(params[:limit]).offset(params[:offset])
    render json: results, include: ['images','reservations','reviews']
  end
  #GET /properties/search_type/:search_term/:search_type/:limit/:offset
  def search_type_limit
    results = Property.near(params[:search_term], 100, units: :km).limit(params[:limit]).offset(params[:offset]).where(property_type: params[:search_type])
    render json: results, include: ['images','reservations','reviews']
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    headers['Access-Control-Allow-Origin'] = '*'
    property = Property.where(id: params[:id])

    respond_to do |format|
      format.html { check_if_admin_logged_in }
      format.json { render json: property, include: ['images','reservations','reviews'] }
    end

  end

  # GET /properties/new
  def new
    check_if_admin_logged_in
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    check_if_admin_logged_in
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:heading, :title, :address, :description, :max_guests, :bedrooms, :bathrooms, :longitude, :latitude, :cleaning_fee, :service_fee)
    end
end
