require "spec_helper"

describe ApisController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/apis" }.should route_to(:controller => "apis", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/apis/new" }.should route_to(:controller => "apis", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/apis/1" }.should route_to(:controller => "apis", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/apis/1/edit" }.should route_to(:controller => "apis", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/apis" }.should route_to(:controller => "apis", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/apis/1" }.should route_to(:controller => "apis", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/apis/1" }.should route_to(:controller => "apis", :action => "destroy", :id => "1")
    end

  end
end
