require 'spec_helper'

feature "garth messes with his books" do
  let!(:user){Factory(:user)}

  before do
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
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
    page.should have_content "Sign in", "Password"
  end

  scenario "garth edits a book" do
    visit "/books"
    click_link "This Cool Book"
    page.should have_content "Edit"
    click_link "Edit"
    page.should have_content "This Cool Book"
    fill_in "book[title]", with: "Different Book"
    fill_in "book[description]", with: "New description"
    click_button "+ Book"
    page.should have_content "Different Book", "New Description"
  end

  scenario "garth adds an image to a book" do
    visit "/books"
    click_link "This Cool Book"
    click_link "Edit"
    attach_file "book[cover]", File.expand_path("spec/fixtures/abhorsen.jpeg")
    click_button "+ Book"
    page.should have_content("image.jpeg")
  end
  scenario "an unauthenticated user attempts to edit a book" do
    click_link "Sign Out"
    click_link "Books"
    click_link "This Cool Book"
    page.should_not have_content "Edit"
    visit "/books/1/edit"
    page.should have_content "Sign in", "Password"    
  end

  scenario "garth deletes a book" do
    click_link "Books"
    click_link "This Cool Book"
    click_link "Delete"
    page.should have_content "The book has been deleted."
  end

  scenario "an unauthenticated user attempts to delete a book" do
    click_link "Sign Out"
    click_link "Books"
    click_link "This Cool Book"
    page.should_not have_content "Delete"
  end
end