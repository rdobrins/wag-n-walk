class WalksController < ApplicationController
  def index
    @walks = Walk.all
  end
end
