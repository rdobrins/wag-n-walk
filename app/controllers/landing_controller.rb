class LandingController < ApplicationController
  def home
    @user = current_user
    @dogs = Dog.all
    @dogimgs = [
    "http://i.imgur.com/jfR0pHW.png",
    "http://i.imgur.com/TPq8ws6.png",
    "http://i.imgur.com/m0sRWLH.png",
    "http://i.imgur.com/xRrVLZr.png",
    "http://i.imgur.com/GPUsFGs.png",
    "http://i.imgur.com/tOqC63w.png",
    "http://i.imgur.com/F9KR6pq.png",
    "http://i.imgur.com/kYowgbu.png",
    "http://i.imgur.com/DlPTQra.png",
    "http://i.imgur.com/NoRwLv7.png",
    "http://i.imgur.com/ewbQn0p.png"
    ]
  end
end
