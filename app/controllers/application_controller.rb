class ApplicationController < ActionController::Base
  before_action :load_user

  private

  def load_user
    @current_user = Participant.last
  end
end
