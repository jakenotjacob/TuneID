require "spec_helper"

describe TunesController do
  describe "routing" do

    it "routes to #index" do
      get("/tunes").should route_to("tunes#index")
    end

    it "routes to #new" do
      get("/tunes/new").should route_to("tunes#new")
    end

    it "routes to #show" do
      get("/tunes/1").should route_to("tunes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tunes/1/edit").should route_to("tunes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tunes").should route_to("tunes#create")
    end

    it "routes to #update" do
      put("/tunes/1").should route_to("tunes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tunes/1").should route_to("tunes#destroy", :id => "1")
    end

  end
end
