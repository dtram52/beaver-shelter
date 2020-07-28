require "rails_helper"

RSpec.describe AnimalProfilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/animal_profiles").to route_to("animal_profiles#index")
    end

    it "routes to #new" do
      expect(get: "/animal_profiles/new").to route_to("animal_profiles#new")
    end

    it "routes to #show" do
      expect(get: "/animal_profiles/1").to route_to("animal_profiles#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/animal_profiles/1/edit").to route_to("animal_profiles#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/animal_profiles").to route_to("animal_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/animal_profiles/1").to route_to("animal_profiles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/animal_profiles/1").to route_to("animal_profiles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/animal_profiles/1").to route_to("animal_profiles#destroy", id: "1")
    end
  end
end
