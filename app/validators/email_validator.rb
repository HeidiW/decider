class User < ActiveRecord::Base
  validates :name, presence: true
  # Checks to see that TOS checkbox has been selected.
  validates :terms_of_service, acceptance: true
  # Checks that email and email_confirmation fields are a match.  Also validates on uniquenss of email address.
  validates :email, confirmation: true, uniqueness: true
  # checks that password length is within specified range
  validates :password, :length => {:within => 10..20, :wrong_length => "a custom wrong length message"} #can also specify :too_short and :too_long messages.

end