require 'spec_helper'

describe "apis/edit.html.erb" do
  before(:each) do
    @api = assign(:api, stub_model(Api,
      :tag => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit api form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => api_path(@api), :method => "post" do
      assert_select "input#api_tag", :name => "api[tag]"
      assert_select "textarea#api_text", :name => "api[text]"
    end
  end
end
