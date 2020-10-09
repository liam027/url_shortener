class Redirect < ApplicationRecord
  has_many :visits
  before_create :generate_token


  def generate_token
    # Generate a random token to use for the shortened URL. Verify it doesn't
    # already exist and if so generate a new token
    self.token = loop do
      token = SecureRandom.urlsafe_base64(nil, false)
      break token unless Redirect.exists?(token: token)
    end
  end

end
