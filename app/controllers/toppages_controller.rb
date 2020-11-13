class ToppagesController < ApplicationController
  def index
    @term = Term.new
  end
end
