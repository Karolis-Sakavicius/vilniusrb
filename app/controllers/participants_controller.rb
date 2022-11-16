class ParticipantsController < ApplicationController
  skip_before_action :load_user
  before_action :find_user

  def index
    redirect_to '/v1/posts' if @current_user
  end

  def create
    uuid = SecureRandom.uuid

    @participant = Participant.new(username: participant_params[:username], color: "##{SecureRandom.hex(3)}", uuid: uuid)

    if @participant.save
      cookies.permanent[:participant] = uuid

      redirect_to '/v1/posts'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def participant_params
    params.permit(:username)
  end

  def find_user
    if cookies[:participant]
      @current_user = Participant.find_by(uuid: cookies[:participant])
    end
  end
end
