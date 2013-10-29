require "test_helper"

feature "An Admin logged in" do
  scenario "can upload pictures" do
    skip
    sign_in(users(:admin))
    visit new_image_path
  end

  scenario "can delete pictures" do
    sign_in(users(:admin))
    visit images_path
    click_on "delete"
    assert_empty @images
    page.text.must_include "successfully"
  end

  scenario "can edit pictures" do
    sign_in(users(:admin))
    visit images_path
    click_on "edit"

    fill_in "Location", with: "New York"
    click_on "edit"

    page.text.must_include "New York"
  end
end

feature "A Regular User logged in" do
  scenario "can upload pictures" do
    skip
    sign_in(users(:basic))
    visit new_image_path
  end

  scenario "can delete THEIR pictures" do
   skip
   sign_in(users(:basic))
  end

  scenario "CANT delete OTHERs pictures" do
    skip
    sign_in(users(:basic))
    visit images_path
  end

  scenario "can edit THEIR pictures" do
    skip
    sign_in(users(:basic))
  end

  scenario "CANT edit OTHERs pictures" do
    skip
    sign_in(users(:basic))
    visit images_path
  end
end
