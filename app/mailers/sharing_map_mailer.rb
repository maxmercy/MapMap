class SharingMapMailer < ApplicationMailer
  default from: 'map.from.a.friend@gmail.com'





  def share_a_map(params)
    @user_email_name = params[:user_name]
    @friend_name = params[:friend_name]
    @friend_email = params[:friend_email]
    @message_perso = params[:message_perso]
    @map = Map.find(params[:id])
binding.pry
    mail(to: @friend_email, subject:   @friend_name + " want to share a map with you")
  end



end
