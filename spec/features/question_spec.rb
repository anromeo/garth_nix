require "spec_helper"

feature "ask author a question" do
  let!(:user){Factory(:user)}

  scenario "a user asks garth a question and garth answers" do
    visit "/"
    click_link "Questions"
    fill_in "question[name]", with: "Phillip Jackson"
    fill_in "question[email]", with: "Phillip@theguardians.com"
    fill_in "question[q]", with: "Are you going to write more?"
    click_button "Ask Garth"
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    page.should have_content "Hey Garth!"
    page.should have_content "Phillip Jackson"
    page.should have_content "Are you going to write more?"
    click_link "Answer"
    fill_in "question[a]", with: "Of course, I will!"
    click_button "Answer"
    click_link "Questions"
    page.should have_content "Phillip Jackson"
    page.should have_content "Are you going to write more?"
    page.should have_content "Of course, I will!"
  end

  scenario "a user cannot access the user index" do
    visit "/users"
    page.should_not have_content "Hey Garth!"
    page.should have_content "Sign in"
    page.should have_content "Email"
    page.should have_content "Password"
  end

  scenario "garth logs out" do
    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    page.should have_content "Hey Garth!"
    click_link "Sign Out"
    page.should have_content "The Old Kingdom"
  end

end