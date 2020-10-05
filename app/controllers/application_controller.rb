class ApplicationController < ActionController::Base

  private

  def after_sign_in_path_for(resource)
    Treinador.find_by(user: current_user) ? "/treinadors" : "/treinadors/new"
  end

  def after_sign_out_path_for(resource)
    "/treinadors"
  end
end
