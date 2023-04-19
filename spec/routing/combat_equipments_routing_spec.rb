require "rails_helper"

RSpec.describe CombatEquipmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/combat_equipments").to route_to("combat_equipments#index")
    end

    it "routes to #new" do
      expect(get: "/combat_equipments/new").to route_to("combat_equipments#new")
    end

    it "routes to #show" do
      expect(get: "/combat_equipments/1").to route_to("combat_equipments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/combat_equipments/1/edit").to route_to("combat_equipments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/combat_equipments").to route_to("combat_equipments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/combat_equipments/1").to route_to("combat_equipments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/combat_equipments/1").to route_to("combat_equipments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/combat_equipments/1").to route_to("combat_equipments#destroy", id: "1")
    end
  end
end
