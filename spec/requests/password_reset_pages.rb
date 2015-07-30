require 'rails_helper'

describe "PasswordReset" do

  subject { page }

  describe "creating new forgot pass request" do

    before { visit new_password_reset_path }

    describe "visit reset password page" do
      it { should have_field('Email') }
      it { should have_button('Reset Password') }
    end

    describe "click reset password button" do

      target_email = 'example@app.com'

      before do
        fill_in "email", with: target_email
        click_button 'Reset Password'
      end
      specify { response.should be_success }
      specify { response.should redirect_to(root_path) }
    end
  end
end