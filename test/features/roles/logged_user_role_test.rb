require "test_helper"

feature "a newly signed up visitor" do
  scenario "has a role of user" do
    visit new_user_registration_path
    fill_in "Email", with: "random123@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button("Join Us!")

    new_guy = User.last
    assert_equal new_guy.role, "user"
  end
end

feature "a regular user & profile pages" do
  scenario "can visit OTHER people's profile pages" do
    skip
  end

  scenario "CANT edit or delete other's" do
    skip
  end
end
