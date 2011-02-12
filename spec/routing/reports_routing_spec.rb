require "spec_helper"

describe ReportsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/reports" }.should route_to(:controller => "reports", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/reports/new" }.should route_to(:controller => "reports", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/reports/1" }.should route_to(:controller => "reports", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/reports/1/edit" }.should route_to(:controller => "reports", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/reports" }.should route_to(:controller => "reports", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/reports/1" }.should route_to(:controller => "reports", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/reports/1" }.should route_to(:controller => "reports", :action => "destroy", :id => "1")
    end

  end
end
