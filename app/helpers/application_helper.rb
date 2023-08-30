module ApplicationHelper
  #画像がないときはデフォルト画像
  def display_user_avatar(user, options = {})
    class_name = options.delete(:class)
    if user.image.present?
      image_tag user.image.url, class: class_name
    else
      image_tag 'default_avatar.png', class: class_name
    end
  end

  def display_room_avatar(room, options = {})
    if room.image.present?
      image_tag room.image.url, options
    else
      image_tag 'default_image.png', options
    end
  end

end

