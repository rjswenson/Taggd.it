require "test_helper"

feature "a newly created user" do
  scenario "will have role user" do
    visit new_user_registration_path
    within(:css, "div#signupModal") do
      fill_in "Email", with: "new1@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Join us"
    end
    dude = User.last
    dude.role == "user"
  end
end
