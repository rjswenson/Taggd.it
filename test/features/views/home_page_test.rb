require "test_helper"

feature "The Home Page" do
  scenario "exists" do
    visit root_path
    page.text.must_include("Copyright 2013")
  end

  scenario "has a title" do
    visit root_path
    page.title.must_include("Taggd.it")
  end

  scenario "has a sign in link" do
    visit root_path
    page.text.must_include("Sign in")
  end

  scenario "has a sign out link" do
    visit root_path
    page.text.must_include("Sign up")
  end
end
