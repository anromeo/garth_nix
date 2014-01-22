require "spec_helper"

feature "ask author a question" do
  let!(:user){Factory(:user)}

  scenario "ask garth a question" do
    visit "/"
    click_link "Questions"
    fill_in "question[name]", with: "Drew Smith"
    fill_in "question[email]", with: "Drew@theguardians.com"
    fill_in "question[q]", with: "Are you going to write more?"
    click_button "Ask Garth"
  end

  scenario "garth answers a question" do
    visit "/users/sign_in"
    fill_in "Email", with: "user@email.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content "Hey Garth!"
    page.should have_content "Are you going to write more?"
  end
end