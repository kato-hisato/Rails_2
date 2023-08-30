class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = @user.rooms
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    # ログイン中のユーザーに関連するデータを作成
    @room = current_user.rooms.build(params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id))
    if @room.save
      redirect_to rooms_path, notice: '登録が完了しました。'
    else
      render "new"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to :rooms
  end


  def search
    @keyword = params[:keyword]
    @area = params[:area]
    
    if @keyword.present?
      @rooms = Room.where("name LIKE ? OR introduction LIKE ?", "%#{@keyword}%", "%#{@keyword}%")
    elsif @area.present?
      @rooms = Room.where("address LIKE ?", "%#{@area}%")
    else
      @rooms = Room.all
    end
  end
end
