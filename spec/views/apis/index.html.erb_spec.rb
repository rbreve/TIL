require 'spec_helper'

describe "apis/index.html.erb" do
  before(:each) do
    assign(:apis, [
      stub_model(Api,
        :tag => "Tag",
        :text => "MyText"
      ),
      stub_model(Api,
        :tag => "Tag",
        :text => "MyText"
      )
    ])
  end

  it "renders a list of apis" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
