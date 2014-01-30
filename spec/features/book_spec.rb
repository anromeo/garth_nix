require 'spec_helper'

feature "garth messes with his books" do
  let!(:user){Factory(:user)}

  before do
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_link "Books"
    click_link "+ Book"
    fill_in "book[title]", with: "This Cool Book"
    fill_in "book[description]", with: "This really cool description"
    click_button "+ Book"
    page.should have_content "This Cool Book"
  end

  scenario "an unauthenticated user attempts to add a book" do
    click_link "Sign Out"
    click_link "Books"
    page.should_not have_content "+ Book"
    visit "/books/new"
    page.should have_content "You are not authorized to access that page."
  end

  scenario "garth edits a book" do
    click_link "Sign Out"
    click_link "This Cool Book"
    page.should_not have_content "+ Book"
    visit "/books/new"
    page.should have_content "You are not authorized to access that page."
 
  end

  scenario "an unauthenticated user attempts to edit a book" do
  end

  scenario "garth deletes a book" do
  end

  scenario "an unauthenticated user attempts to delete a book" do
  end
end