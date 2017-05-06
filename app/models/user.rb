# frozen_string_literal: true

class User < ApplicationRecord
  include Settings::Extend

  devise :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable,
         :two_factor_authenticatable, :two_factor_backupable,
         otp_secret_encryption_key: ENV['OTP_SECRET'],
         otp_number_of_backup_codes: 10
  devise :omniauthable, { omniauth_providers: [:facebook , :github] }

  belongs_to :account, inverse_of: :user, required: true
  accepts_nested_attributes_for :account

  validates :locale, inclusion: I18n.available_locales.map(&:to_s), unless: 'locale.nil?'
  validates :email, email: true

  scope :recent,    -> { order('id desc') }
  scope :admins,    -> { where(admin: true) }
  scope :confirmed, -> { where.not(confirmed_at: nil) }

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def setting_default_privacy
    settings.default_privacy || (account.locked? ? 'private' : 'public')
  end

  def setting_boost_modal
    settings.boost_modal
  end

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first
    unless user.present?
      email = auth.info.email
      password = Devise.friendly_token[0,20]
      user = User.new(email: email, password: password, password_confirmation: password)
      user.provider = auth.provider
      user.uid = auth.uid
      user.build_account if user.account.nil?
      user.account.username = "fb#{auth.uid}" # assuming the user model has a name
      user.account.display_name = auth.info.name
      user.skip_confirmation!
      unless user.save
        return nil
      end
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def setting_auto_play_gif
    settings.auto_play_gif
  end
end
