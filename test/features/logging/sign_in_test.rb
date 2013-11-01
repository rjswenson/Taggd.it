require "test_helper"

feature "Sign in" do
  scenario "with valid information" do
    visit new_user_session_path
    within(:css, "div.modal-signin-box") do
      fill_in "Email", with: users(:basic).email
      fill_in "Password", with: "password"
      click_on "Sign in"
    end
    page.text.must_include "Signed in successfully."
    page.text.must_include "Sign out"
  end

  scenario "fails with invalid info" do
    visit root_path
    within(:css, "div.modal-signin-box") do
      fill_in "Email", with: users(:basic).email
      fill_in "Password", with: "NOTPASSWORD"
      click_on "Sign in"
    end

    page.text.wont_include "Signed in successfully."
    page.text.must_include "Sign in"
    page.text.wont_include "Sign out"
    page.text.must_include "Invalid"
  end
end
