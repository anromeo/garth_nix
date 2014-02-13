require "spec_helper"

feature "view universes" do

  scenario "a user checks out the different universes", :js => true do
    visit '/'
    page.should_not have_content "Abhorsen is awesome!"
    page.should_not have_content "The Seventh Tower is awesome!"
    page.should_not have_content "The Keys to the Kingdom is awesome!"
    page.should_not have_content "Trouble Twisters is awesome!"
    find("#old-kingdom").click
    page.should have_content "Five Great Charters knit the land."
    find("#universe-exit").click
    page.should_not have_content "Abhorsen is awesome!"
    find("#seventh-tower").click
    page.should have_content "The Seventh Tower is awesome!"
    find("#universe-exit").click
    page.should_not have_content "The Seventh Tower is awesome!"
    find("#keys-kingdom").click
    page.should have_content "The Keys to the Kingdom is awesome!"
    find("#universe-exit").click
    page.should_not have_content "The Keys to the Kingdom is awesome!"
    find("#trouble-twisters").click
    page.should have_content "Trouble Twisters is awesome!"
    find("#universe-exit").click
    page.should_not have_content "Trouble Twisters is awesome!"
  end
end