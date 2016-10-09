class HomeController < ApplicationController

  def index
    @boards = Board.all.limit(5)
  end
end
