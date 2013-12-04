require "test_helper"

feature "On your own page" do
  scenario "you can edit your profile" do
    sign_in(users(:basic))
    visit profile_path("en", users(:basic).id)

    page.has_button?("My Settings")
    click_on("My Settings")
  end

  scenario "you can delete a picture" do
    sign_in(users(:basic))
    visit profile_path("en", users(:basic).id)
    page.text.must_include("SillyTestSmile")

    click_on("Destroy")
    page.text.wont_include("SillyTestSmile")
  end

  scenario "you can edit a picture" do
    sign_in(users(:basic))
    visit profile_path("en", users(:basic).id)
    page.text.must_include("Seattle, WA, USA")

    click_on("Edit")
    within("div.edit_image_box") do
      fill_in "Location", with: "Denver CO"
      click_on "Upload Image"
    end
    page.text.must_include("Denver CO")
    page.text.wont_include ("Seattle, WA, USA")
  end

end

feature "On someone else's page" do
  scenario "You cannot delete their pictures" do
    sign_in(users(:basic))
    visit profile_path("en", users(:admin).id)

    page.text.wont_include("Destroy")
  end

  scenario "You cannot edit their pictures" do
    sign_in(users(:basic))
    visit profile_path("en", users(:admin).id)
    page.text.wont_include("Edit")
  end
end
