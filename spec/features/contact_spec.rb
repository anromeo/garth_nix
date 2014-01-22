require 'spec_helper'

feature "email author" do
  
  scenario "user fills out contact form" do
    visit '/'
    click_link "Contact"
    fill_in "name", with: "Phillip Jackson"
    fill_in "email", with: "flip@awesome.com"
    fill_in "message", with: "What's up?"
    click_button "Send Message"
    page.should have_content("Thanks for Reaching Out!")
    page.should have_content("Garth has received your message!")
    open_email "garth@garthnix.com", with_subject: "A Message from Phillip Jackson"
    current_email.should have_content("Hey Garth,")
    current_email.should have_content("A message has arrived from Phillip Jackson.")
    current_email.should have_content("Here's the message:")
    current_email.should have_content("What's up?")
  end
end