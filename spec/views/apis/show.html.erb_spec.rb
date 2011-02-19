require 'spec_helper'

describe "apis/show.html.erb" do
  before(:each) do
    @api = assign(:api, stub_model(Api,
      :tag => "Tag",
      :text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tag/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
