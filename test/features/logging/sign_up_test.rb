require "test_helper"

feature "a new visitor" do
  scenario "can sign up with valid info" do
    visit new_user_registration_path
    fill_in "Email", with: "random123@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button("Join Us!")

    page.text.must_include "Welcome! You have signed up successfully."
    page.text.must_include "Sign out"
    page.text.wont_include "Sign in"
    page.text.wont_include "Sign up"
  end

  scenario "can't sign up with invalid info" do
    visit new_user_registration_path
    fill_in "Email", with: " "
    click_button("Join Us!")

    page.text.must_include "errors"
    page.text.wont_include "Sign out"
    page.text.must_include "Sign in"
    page.text.must_include "Sign up"
  end
end
