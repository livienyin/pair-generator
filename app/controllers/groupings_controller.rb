class GroupingsController < ApplicationController

  def index
    @groupings = Grouping.order("date DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groupings }
    end
  end
  
end
