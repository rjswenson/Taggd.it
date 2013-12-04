require "test_helper"

feature "On your own " do
  scenario "can visit OTHER people's profile pages" do
    sign_in(users(:admin))
    visit profile_path("en", users(:basic).id)

    page.text.must_include(users(:basic).username)
    page.text.wont_include(users(:admin).username)
  end
