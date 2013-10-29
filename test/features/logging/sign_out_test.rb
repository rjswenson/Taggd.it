require "test_helper"

feature "Sign out" do
  scenario "link should work" do
    sign_in(users(:basic))
    click_on "Sign out"

    page.text.must_include "Signed out successfully."
    page.text.must_include "Sign in"
    page.text.must_include "Sign up"
  end
end
