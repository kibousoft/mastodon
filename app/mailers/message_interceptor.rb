# frozen_string_literal: true

class MessageInterceptor

  class << self
    def delivering_email(message)
      encrypted_message = Mail.new(sign(message.encoded))
      overwrite_body(message, encrypted_message)
      overwrite_headers(message, encrypted_message)
    end

    private

    require 'openssl'
    include OpenSSL
    def sign(data)
      PKCS7.write_smime(PKCS7.sign(certificate, private_key, data, [], PKCS7::DETACHED))
    end

    def certificate
      path = Mastodon::Application.config.smime_sign_certificate_path
      @certificate ||= X509::Certificate.new(File.read(path))
    end

    def private_key
      path = Mastodon::Application.config.smime_sign_private_key_path
      pass_phrase = Mastodon::Application.config.smime_sign_private_key_phrase
      @private_key ||= PKey::RSA.new(File.read(path), pass_phrase)
    end

    def overwrite_body(message, encrypted_message)
      message.body = nil
      message.body = encrypted_message.body.encoded
    end

    def overwrite_headers(message, encrypted_message)
      message.content_disposition = encrypted_message.content_disposition
      message.content_transfer_encoding = encrypted_message.content_transfer_encoding
      message.content_type = encrypted_message.content_type
    end
  end
end
