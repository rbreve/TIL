require 'spec_helper'

describe "reports/new.html.erb" do
  before(:each) do
    assign(:report, stub_model(Report,
      :snippet_id => 1,
      :user_id => 1,
      :reason => "MyText"
    ).as_new_record)
  end

  it "renders new report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reports_path, :method => "post" do
      assert_select "input#report_snippet_id", :name => "report[snippet_id]"
      assert_select "input#report_user_id", :name => "report[user_id]"
      assert_select "textarea#report_reason", :name => "report[reason]"
    end
  end
end
