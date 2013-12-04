require "test_helper"

feature "An Admin logged in" do
  scenario "can delete pictures" do
    sign_in(users(:admin))
    visit images_path

    click_on "Destroy"
    page.text.must_include "successfully"
  end

  scenario "can edit pictures" do
    sign_in(users(:admin))
    visit images_path
    click_on "Edit"

    page.text.must_include "Edit your Image"
  end
end

feature "A Regular User logged in" do
  scenario "can delete THEIR pictures" do
   sign_in(users(:basic))
   visit profile_path("en", users(:basic).id)

   click_on "Destroy"
   page.text.must_include "successfully"
  end

  scenario "can edit THEIR pictures" do
    sign_in(users(:basic))
    visit profile_path("en", users(:basic).id)

    click_on "Edit"
    page.text.must_include "Edit your Image"
  end
end
