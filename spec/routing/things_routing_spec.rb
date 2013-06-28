require "spec_helper"

describe ThingsController do
  describe "routing" do

    it "routes to #index" do
      get("/things").should route_to("things#index")
    end

    it "routes to #new" do
      get("/things/new").should route_to("things#new")
    end

    it "routes to #show" do
      get("/things/1").should route_to("things#show", :id => "1")
    end

    it "routes to #edit" do
      get("/things/1/edit").should route_to("things#edit", :id => "1")
    end

    it "routes to #create" do
      post("/things").should route_to("things#create")
    end

    it "routes to #update" do
      put("/things/1").should route_to("things#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/things/1").should route_to("things#destroy", :id => "1")
    end

  end
end
