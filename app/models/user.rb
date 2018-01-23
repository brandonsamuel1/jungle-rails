class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      return user
    else
      return nil
    end
  end

  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
  end
end
