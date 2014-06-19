class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Publisher)
      publishers_tasks_path
    elsif resource_or_scope.is_a?(Editor)
      editors_tasks_path
    elsif resource_or_scope.is_a?(Writer)
      writers_articles_path
    elsif
      super
    end
  end

  def after_sign_out_path_for(resource_or_scope)
      new_devise_session_path
  end

end
