class WelcomeController < ApplicationController

  def index
    @search = AnimalProfile.search(params[:q])
    @animal_profiles = @search.result.page(params[:page])
  end

  def about
  end
end
