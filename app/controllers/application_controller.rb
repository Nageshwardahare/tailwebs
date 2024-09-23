class ApplicationController < ActionController::Base
  before_action :authenticate_teacher!

  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    if resource.is_a?(Teacher)
      students_path
    else
      super
    end
  end
end
