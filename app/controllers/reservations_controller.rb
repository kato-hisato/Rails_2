class ReservationsController < ApplicationController
  
  before_action :authenticate_user!
  
  #自分の予約だけ表示
  def index
    @user = current_user
    @reservations = @user.reservations
  end

  def new
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:start_day, :end_day, :people, :user_id, :room_id))#入力から来たデータ
    @room = Room.find(params[:reservation][:room_id])
    
    if @reservation.valid?
      @reservation.price = @room.price * (@reservation.end_day - @reservation.start_day).to_i * @reservation.people
      render :confirm
    else
      render 'rooms/show'
    end
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    #ログイン中のユーザーの予約
    @reservation = current_user.reservations.build(params.require(:reservation).permit(:start_day, :end_day, :people, :price, :user_id, :room_id))
    if @reservation.save
      redirect_to reservations_path, notice: '予約が完了しました。'
    else
      render 'rooms/show'
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :reservations
  end
end
