require File.dirname(__FILE__) + '/../spec_helper'

describe Save do
  it "should be valid" do
    Save.new.should be_valid
  end
end
