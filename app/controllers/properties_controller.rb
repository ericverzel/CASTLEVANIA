class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
    @properties = policy_scope(Property).order(created_at: :desc)

    @markers = @properties.geocoded.map do |prop|
      {
        lat: prop.latitude,
        lng: prop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { prop: prop })

      }
    end
  end

  def show
    authorize @property
  end

  def new
    @property = Property.new
    authorize @property
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    authorize @property
    if @property.save
      redirect_to property_path(@property), notice: "Un Château à louer a été créé !"
    else
      render :new
    end
  end

  def edit
    authorize @property
  end

  def update
    authorize @property
    if @property.update(property_params)
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @property
    @property.destroy
    redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  private

  def property_params
    params.require(:property).permit(:name, :address, :price, photos: [])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
