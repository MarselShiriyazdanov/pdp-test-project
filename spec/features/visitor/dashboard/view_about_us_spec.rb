require "rails_helper"

feature "View About Us" do
  scenario "Visitor views about us page" do
    visit about_us_path

    expect(page).to have_content("Some text about this project and it's authors")
  end
end
