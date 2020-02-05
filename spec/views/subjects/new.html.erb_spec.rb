require 'rails_helper'

RSpec.describe "subjects/new", type: :view do
  before(:each) do
    assign(:subject, Subject.new(
      :name => "MyString",
      :status => 1
    ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", subjects_path, "post" do

      assert_select "input[name=?]", "subject[name]"

      assert_select "input[name=?]", "subject[status]"
    end
  end
end
