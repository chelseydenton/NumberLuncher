class User < ActiveRecord::Base
  has_secure_password
  has_many :observations # keep the data if user is deleted
  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :followed_restaurants, through: :relationships, source: :restaurant

  before_save { email.downcase! }
  before_create :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def following?(some_resto)
    self.relationships.find_by(restaurant_id: some_resto.id)
  end

  def follow!(some_resto)
    self.relationships.create!(restaurant_id: some_resto.id)
  end

  def unfollow!(some_resto)
    self.relationships.find_by(restaurant_id: some_resto.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end


end