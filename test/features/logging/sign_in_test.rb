require "test_helper"

feature "Sign in" do
  @javascript
  scenario "with valid information" do
    visit root_path
    within(".modal-signin-box") do
     click_link("Sign in")
     fill_in "Email", with: users(:basic).email
     fill_in "Password", with: "password"
     save_and_open_page
     click_button "Sign in"
    end

    page.text.must_include "Signed in successfully."
    page.text.must_include "Sign out"
    page.text.wont_include "Sign in"
  end

  scenario "fails with invalid info" do
    visit root_path
    within(".modal-signin-box") do
     click_link("Sign in")
     fill_in "Email", with: users(:basic).email
     fill_in "Password", with: "NotThePassword"
     click_button "Sign in"
    end

    page.text.wont_include "Signed in successfully."
    page.text.must_include "Sign in"
    page.text.wont_include "Sign out"
    page.text.must_include "Invalid"
  end
end
