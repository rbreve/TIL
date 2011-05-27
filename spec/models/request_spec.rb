require File.dirname(__FILE__) + '/../spec_helper'

describe Request do
  it "should be valid" do
    Request.new.should be_valid
  end
end
