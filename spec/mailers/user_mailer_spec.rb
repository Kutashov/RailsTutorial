require 'rails_helper'

describe UserMailer do
  describe "password_reset" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      user.send(:create_remember_token, :password_reset_token)
      user.update_attribute :password_reset_sent_at, Time.zone.now
      user.save
    end

    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      mail.subject.should eq("Password reset")
      mail.to.should eq([user.email])
      mail.from.should eq(["admin@testapp.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("click the URL below")
    end
  end

end
