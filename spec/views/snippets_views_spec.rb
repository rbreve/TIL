describe "snippets/show.html.erb" do
  it "displays the snippet code tag" do
    assign(:snippet, stub_model(Snippet, :tags_list => "circle, svg, geo"))
    render 
    rendered.should contain("geo")
  end
end