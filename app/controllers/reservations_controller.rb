class ReservationsController < ApplicationController
  def index
  end
   def show
    @reservation = reservation.find(params[:id])
    authorize @reservation
  end


  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    authorize @reservation

    if @reservation.save
      redirect_to reservation_path(@reservation), notice: "Une Réservation à été faite !"
    else
      render :new
    end
  end

  def edit
  end
  def update
  end
  def destroy
  end


  private

  def reservation_params
    params.require(:reservation).permit(:date_from, :date_to)
  end
end
