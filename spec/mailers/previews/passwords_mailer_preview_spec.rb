require "rails_helper"

RSpec.describe PasswordsMailer, type: :mailer do
  describe "reset" do
    let(:user) { create(:user) }

    it "renders the reset email" do
      mail = PasswordsMailer.reset(user)

      expect(mail.subject).to eq("Password Reset Instructions")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreply@yourdomain.com"])

      expect(mail.body.encoded).to match("Reset your password")
      # Add more specific expectations about the email content
    end
  end
end
