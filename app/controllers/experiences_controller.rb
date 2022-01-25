class ExperiencesController < ApplicationController
    before_action :logged_in_user, only: [:new]
    before_action :correct_experience,   only: [:update]

    def new
        current_user.profile.experiences.create
        flash[:success] = "Experiences added."
        redirect_to edit_url
    end

end