class WelcomeController < ApplicationController
  def index
    @writer = Writer.new
  end
end
