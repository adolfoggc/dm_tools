require "rails_helper"

RSpec.describe ClocksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/clocks").to route_to("clocks#index")
    end

    it "routes to #new" do
      expect(get: "/clocks/new").to route_to("clocks#new")
    end

    it "routes to #show" do
      expect(get: "/clocks/1").to route_to("clocks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/clocks/1/edit").to route_to("clocks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/clocks").to route_to("clocks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/clocks/1").to route_to("clocks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/clocks/1").to route_to("clocks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/clocks/1").to route_to("clocks#destroy", id: "1")
    end
  end
end
