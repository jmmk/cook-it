module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(page).to have_link('Sign Out')
  end

  def sign_up_as(user)
    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_on 'Sign up'
  end
end