class ApplicationController < ActionController::Base
  before_action :load_user

  private

  def load_user
    @current_user = cookies[:participant] ? Participant.find_by(uuid: cookies[:participant]) : nil

    unless @current_user
      redirect_to '/participants'
    end
  end
end
