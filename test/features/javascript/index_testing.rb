require "test_helper"

feature "clicking on the upload" do
  scenario "it should pop up", :js => true do
    sign_in users(:admin)
    visit root_path
    click_button("Upload")
    page.text.must_include("Location")
    page.text.must_include("Upload Image")
  end
end

