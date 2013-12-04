require "test_helper"

feature "a newly signed up visitor" do
  scenario "has a role of user" do
    visit root_path
    within(:css, "div#signupModal") do
      fill_in "Email", with: "new1@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Join us"
    end

    new_guy = User.last
    assert_equal new_guy.role, "user"
  end
end

feature "a regular user & profile pages" do
  scenario "can visit OTHER people's profile pages" do
    sign_in(users(:admin))
    visit profile_path("en", users(:basic).id)

    page.text.must_include(users(:basic).username)
    page.text.wont_include(users(:admin).username)
  end

  scenario "CANT edit or delete other's" do
    sign_in(users(:basic))
    visit profile_path("en", users(:admin).id)
    page.text.must_include(users(:admin).username)

    page.wont_have_content('td.btn-danger')
    assert has_content?('link#edit') == false
  end
end
