require 'spec_helper'

describe "apis/new.html.erb" do
  before(:each) do
    assign(:api, stub_model(Api,
      :tag => "MyString",
      :text => "MyText"
    ).as_new_record)
  end

  it "renders new api form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apis_path, :method => "post" do
      assert_select "input#api_tag", :name => "api[tag]"
      assert_select "textarea#api_text", :name => "api[text]"
    end
  end
end
