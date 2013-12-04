require "test_helper"

feature "On the index page, visitors" do
  scenario "see images" do
   visit images_path
   page.text.must_include(images(:smile).location)
  end

  scenario "see votes" do
    visit images_path
    page.text.must_include("votes")
    page.text.must_include("0")
  end

  scenario "cannot vote" do
    visit images_path
    find('.icon-thumbs-up').click
    page.text.must_include("You need to sign in")
  end

  scenario "cannot upload via modal" do
    visit images_path
    click_on "Upload"
    page.text.must_include("Sign up")
  end

  scenario "cannot upload via new page" do
    visit new_image_path
    page.text.must_include("You need to sign in")
  end
end

feature "On index page, user" do
  scenario "Can vote" do
    sign_in(users(:basic))
    visit images_path
    find('.icon-thumbs-down').click
    page.text.must_include("-1")
  end
  scenario "Can't Delete" do
    sign_in(users(:basic))
    visit images_path
    page.text.wont_include("Destroy")
  end

  scenario "see images" do
    sign_in(users(:basic))
    visit images_path
    page.text.must_include(images(:smile).location)
  end

  scenario "see votes" do
    sign_in(users(:basic))
    visit images_path
    page.text.must_include("votes")
    page.text.must_include("0")
  end
end

feature "On index page, admin" do
  scenario "Can vote" do
    sign_in(users(:admin))
    visit images_path
    find('.icon-thumbs-down').click
    page.text.must_include("-1")
  end

  scenario "Can delete" do
    sign_in(users(:admin))
    visit images_path
    page.text.must_include(images(:smile).location)
    click_on "Destroy"
    page.text.wont_include(images(:smile).location)
    page.text.must_include("successfully destroyed")
  end

  scenario "see images" do
    sign_in(users(:admin))
    visit images_path
    page.text.must_include(images(:smile).location)
  end

  scenario "see votes" do
    sign_in(users(:admin))
    visit images_path
    page.text.must_include("votes")
    page.text.must_include("0")
  end
end
