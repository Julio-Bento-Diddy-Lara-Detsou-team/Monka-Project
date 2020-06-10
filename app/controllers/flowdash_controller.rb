class FlowdashController < ApplicationController
  layout 'flowdash/application'

  def index
  end

  def show
    params[:page] = 'index' unless params[:page]
    render 'flowdash/'+ params[:page]
  end
end
