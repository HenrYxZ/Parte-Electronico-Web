class Admin < ActiveRecord::Base

	validates_presence_of :email 
    has_secure_password

    def self.authenticate(email, password)
  		Admin.find_by(email: email).try(:authenticate, password)
    end

  def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  AdminMailer.password_reset(self).deliver
  end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while Admin.exists?(column => self[column])
end
end
