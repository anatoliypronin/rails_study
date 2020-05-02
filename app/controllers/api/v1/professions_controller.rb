class Api::V1::ProfessionsController < Api::V1::ApplicationController
  def index
    professions = Profession.active.order(title: :asc)
    render json: professions, each_serializer: ProfessionIndexSerializer
  end

  def show
    profession = Profession.active.find(params[:id])
    render json: profession, serializer: ProfessionShowSerializer
  end
end
