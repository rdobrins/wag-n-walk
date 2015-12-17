class WalkersController < ApplicationController
  def index
    @walkers = Walker.all
  end
end
