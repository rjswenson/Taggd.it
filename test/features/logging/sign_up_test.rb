require "test_helper"

feature "a new visitor" do
  scenario "can sign up with valid info" do
    visit root_path
    within(:css, "div#signupModal") do
      fill_in "Email", with: "new1@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Join us"
    end

    page.text.must_include "Welcome! You have signed up successfully."
    page.text.must_include "Sign out"
  end

  scenario "can't sign up with invalid info" do
    visit root_path
    within(:css, "div#signupModal") do
      fill_in "Email", with: "new1@example.com"
      fill_in "Password", with: " "
      fill_in "Password confirmation", with: "pasword"
      click_on "Join us"
    end

    page.text.must_include "error"
    page.text.wont_include "Sign out"
    page.text.must_include "Sign in"
    page.text.must_include "Sign up"
  end
end
