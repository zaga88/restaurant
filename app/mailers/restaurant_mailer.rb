class RestaurantMailer < ApplicationMailer
  def send_token(email, token)
    @token = token
    mail(to: email, subject: 'Restaurant account confirmation')
  end

  def send_user_reserv(reserv)
    @reserv = reserv
    mail(to: reserv.user.try(:email), subject: 'Reservation confirmation')
  end

  def send_restaurant_reserv(reserv)
    @reserv = reserv
    mail(to: reserv.restaurant.try(:email), subject: 'Reservation confirmation')
  end
end
