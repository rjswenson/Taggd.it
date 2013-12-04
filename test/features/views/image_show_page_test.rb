require "test_helper"

feature "The Image Show Page" do
  scenario "regular user logged in sees image show page but can't destroy" do
    sign_in(users(:basic))
    visit image_path("en", images(:smile).id)
    page.text.must_include("Uploaded By")
    page.text.wont_include("Destroy")
  end

  scenario "regular user logged in has option to edit image" do
    sign_in(users(:basic))
    visit image_path("en", images(:smile).id)
    page.text.must_include("Uploaded By")
    page.text.must_include("Edit your Picture")
  end

  scenario "logged in user who isn't image owner can't edit image" do
    sign_in(users(:admin))
    visit image_path("en", images(:smile).id)
    page.text.must_include("Uploaded By")
    page.text.wont_include("Edit your Picture")
  end

  scenario "logged in user who isn't image owner clicks on profile link and can't edit or destroy" do
    sign_in(users(:admin))
    visit image_path("en", images(:smile).id)
    page.text.must_include("Uploaded By")
    click_on(users(:basic).username)
    page.text.wont_include("Edit")
  end
end
