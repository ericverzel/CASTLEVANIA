class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_property, only: [:new, :create, :show, :edit, :update, :destroy]

  # GET /property/:property_id/reservations
  def index
    @property = Property.includes(:reservations).find(params[:property_id])
    @reservations = @Property.reservations.all
    authorize @reservation
  end

  def show
    authorize @reservation
  end

  # GET /propertys/:property_id/reservations/new
  def new
    @reservation = Reservation.new
    authorize @reservation
  end


  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.property = @property
    authorize @reservation

    if @reservation.save
      redirect_to property_reservation_path(@property, @reservation), notice: "Une Réservation à été faite !"
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def update
    authorize @reservation
    if @reservation.update(reservation_params)
      redirect_to property_reservation_path(@reservation.property, @reservation), notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @reservation
    @reservation.destroy
    redirect_to properties_url, notice: 'Reservation was successfully destroyed.'
  end


  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end


    def set_property
      # @property = Property.where(id: params[:id], user: current_user).take
      @property = Property.find(params[:property_id])
    end

    def reservation_params
      params.require(:reservation).permit(:date_from, :date_to)
    end
end
