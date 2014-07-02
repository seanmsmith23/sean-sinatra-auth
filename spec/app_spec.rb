require "spec_helper"


feature "Homepage" do
  scenario "should have a register button" do
    visit '/'

    expect(page).to have_button("Register")
  end

  scenario "User should be taken to a registration form when clicking the registration button" do
  visit '/'

  click_link("Register")

  expect(page).to have_content("Register Below")
  end
end

feature "Signup Page" do
  scenario "Should display a message upon submit. Message should clear on refresh" do
  visit '/registration'

  fill_in "username", :with => "sean"
  fill_in "password", :with => "blah"
  click_button "Sign Up"

  expect(page).to have_content("Thank you for registering.")

  visit '/registration'

  expect(page).to_not have_content("Thank you for registering.")

  end
end

