class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable


  has_many :images, foreign_key: "user_id"

  def admin?
    role == 'admin'
  end

  def password_required?
    super && provider.blank?
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.name == auth.info.nickname
      user.provider == auth.provider
      user.uid == auth.uid
      user.email == auth.email
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes == params
        user.valid?
      end
    else
      super
    end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end

