class JsonWebToken
  def self.encode(payload)
    JWT.encode payload, Rails.application.secrets.secret_key_base
  end

  def self.decode(token)
    return nil if token.nil? || token.empty?
    JWT.decode(token, Rails.application.secrets.secret_key_base).first
  end
end