class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, :omniauthable


  has_many :images, foreign_key: "user_id"
  has_many :comments, foreign_key: "user_id"

  has_reputation :karma, :source => { :reputation => :votes,
                                      :of => :images }
  def admin?
    role == 'admin'
  end

  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.name = auth.info.name || auth.info.nickname
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email if auth.info.email
      user.save
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new session["devise.user_attributes"] do |user|
        user.attributes = params
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

