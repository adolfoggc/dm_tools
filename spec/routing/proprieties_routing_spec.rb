require "rails_helper"

RSpec.describe ProprietiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/proprieties").to route_to("proprieties#index")
    end

    it "routes to #new" do
      expect(get: "/proprieties/new").to route_to("proprieties#new")
    end

    it "routes to #show" do
      expect(get: "/proprieties/1").to route_to("proprieties#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/proprieties/1/edit").to route_to("proprieties#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/proprieties").to route_to("proprieties#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/proprieties/1").to route_to("proprieties#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/proprieties/1").to route_to("proprieties#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/proprieties/1").to route_to("proprieties#destroy", id: "1")
    end
  end
end
