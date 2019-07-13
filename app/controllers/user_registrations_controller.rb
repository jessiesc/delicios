# frozen_string_literal: true

class UserRegistrationsController < Devise::RegistrationsController
  private

  def build_resource(hash = {})
    self.resource = select_model.new_with_session(hash, session)
  end

  def sign_up_params
    user_is_client? ? params[:client].permit! : params[:nutritionist].permit!
  end

  def user_is_client?
    params[:role]&.to_sym == :client
  end

  def select_model
    user_is_client? ? Client : Nutritionist
  end
end
