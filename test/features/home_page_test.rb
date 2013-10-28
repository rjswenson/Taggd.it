require "test_helper"

feature "The Home Page" do
  scenario "exists" do
    visit root_path
    page.text.must_include("Home Page")
  end

  scenario "has a title" do
    visit root_path
    page.title.must_include("Taggd.it")
  end

  scenario "prompts visitor for beta code" do
    pending
  end

  scenario "responds to beta code" do
    pending
  end

  scenario "has a sign in link" do
    visit root_path
    find_link('sign in').visible?
  end

  scenario "has a sign out link" do
    visit root_path
    find_link("sign up").visible?
  end
end
