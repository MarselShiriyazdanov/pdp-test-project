require "rails_helper"

feature "Sign Up" do
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by_email(user_attributes[:email]) }

  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_form(:user, user_attributes)
    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(page).to have_text(registered_user.email)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your account was successfully confirmed.")
    expect(page).to have_text(registered_user.email)
  end
end
