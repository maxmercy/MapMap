class SharingMapMailer < ApplicationMailer
  default from: 'map.from.a.friend@gmail.com'


  def ShareAMap()
      @user = "mxmercy@gmail.com"
      @user_email = "mxmercy@gmail.com"
      @friend_name = "marco"
      mail(to: 'mxmercy@gmail.com', subject: "A Map from Maxime")
  end


end
