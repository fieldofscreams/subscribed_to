SubscribedTo.setup do |config|
  config.service = :<%= options.service.to_sym %>

  <%- if options.service == "mail_chimp" -%>
  config.mail_chimp do |mail_chimp_config|
    # Your MailChimp API key.
    mail_chimp_config.api_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-us1"

    # A hash of mailing lists to subscribe users to.
    # List names can be any valid symbol.
    #
    # Required:
    #   :id - id of list
    #   :merge_vars - hash of merge vars on list, MUST at least include "EMAIL" (do not use "MERGE0")
    mail_chimp_config.lists = {
      :mailing_list => {
        :id => "xxxxxxxx",
        :merge_vars => {"FNAME" => :first_name, "LNAME" => :last_name, "EMAIL" => :email}}}

    # Include this key in your MailChimp webhook URL.
    # Keep it a secret!
    mail_chimp_config.secret_key = "my_secret_key_that_i_will_change"
  end
  <%- end -%>
end
