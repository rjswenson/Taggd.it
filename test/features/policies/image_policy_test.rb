require "test_helper"

feature "An Admin logged in" do
  scenario "can upload pictures" do
    skip
    sign_in(users(:admin))
    visit new_image_path
    Image.new :photo => File.new(Rails.root + 'test/fixtures/small_test.gif')
  end

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

    # fill_in "Location", with: "New York"
    # click_on "Upload Image"

    # page.text.must_include "New York"
  end
end

feature "A Regular User logged in" do
  scenario "can delete THEIR pictures" do
   sign_in(users(:basic))
   visit profile_path("en", users(:basic).id)

   click_on "Destroy"
   page.text.must_include "successfully"
  end

  scenario "CANT delete OTHERs pictures" do
    skip
    sign_in(users(:basic))
    visit images_path
  end

  scenario "can edit THEIR pictures" do
    sign_in(users(:basic))
    visit profile_path("en", users(:basic).id)

    click_on "Edit"
    page.text.must_include "Edit your Image"
  end

  scenario "CANT edit OTHERs pictures" do
    skip
    sign_in(users(:basic))
    visit images_path
  end
end
