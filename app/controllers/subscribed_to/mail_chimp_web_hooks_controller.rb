module SubscribedTo
  class MailChimpWebHooksController < ApplicationController
    # Handle MailChimp webhooks
    # Requires a secret key be set in the SubscribedTo initializer.
    # Include the secret key in the post URL for the webhook in your MailChimp account.
    def create
      key = params.delete("key")
      unless key.blank? || key != SubscribedTo.mail_chimp_config.secret_key
        SubscribedTo::MailChimp::WebHook.process(params)
        head :ok
      else
        head :not_found
      end
    end
  end
end
