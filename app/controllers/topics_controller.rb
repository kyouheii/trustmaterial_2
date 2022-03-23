class TopicsController < ApplicationController

  
  def index
    @topics = Topic.new
  end



  private

  def topic_params
    params.require(:topic).permit(:body, :pdf)
  end

end