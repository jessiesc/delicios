# frozen_string_literal: true

class UserProfilesController < ApplicationController
  before_action :load_profile, only: %i[show edit update destroy]

  def edit
  end

  def update
    @profile.update(profile_params)
  end

  private

  def load_profile
    @profile = current_user.profile || current_user.build_profile
  end

  def profile_params
    params.require(:profile).permit(:name, :description, :first_name, :last_name, :nickname,
                                    :how_heard, :birthday, :experience_years)
  end
end
