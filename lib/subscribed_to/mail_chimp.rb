require 'subscribed_to/mail_chimp/config'
require 'subscribed_to/mail_chimp/web_hook'
require 'gibbon'

module SubscribedTo
  # Module for MailChimp subscription interaction
  module MailChimp
    module ClassMethods
      # Returns the list id for the class as defined in mail_chimp
      def list_id
        SubscribedTo.mail_chimp_config.lists[@list_key][:id]
      end

      # Returns the hash of merge vars for the class as defined in mail_chimp
      def merge_vars
        SubscribedTo.mail_chimp_config.lists[@list_key][:merge_vars]
      end
    end

    module InstanceMethods
      private

      # Subscribe the user to the mailing list
      def subscribe_to_list  #:doc:
        merge_vars = self.class.merge_vars.dup

        if subscribed_to_list
          
          subscribed_email = self.email
          lower_case_md5_hashed_email_address = Digest::MD5.hexdigest(subscribed_email.downcase)
          list_id          = self.class.list_id
          g                = Gibbon::Request.new(api_key: SubscribedTo.mail_chimp_config.api_key)
          
          if !self.first_name.nil? && !self.last_name.nil?
            begin
              g.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: subscribed_email, status: "subscribed", merge_fields: {FNAME: self.first_name, LNAME: self.last_name}})
            rescue Gibbon::MailChimpError => ex
              if ex.title.to_s.include? "Compliance" # This user unsubscribed from us in the past, but wants to resubscribe
                g.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: subscribed_email, status: "pending", merge_fields: {FNAME: self.first_name, LNAME: self.last_name}})
              end
            end
          else
            begin
              g.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: subscribed_email, status: "subscribed"})
            rescue Gibbon::MailChimpError => ex
              if ex.title.to_s.include? "Compliance" # This user unsubscribed from us in the past, but wants to resubscribe
                g.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: subscribed_email, status: "pending"})
              end
            end
             
          end
          
        end
      end

      # Update attributes of existing member
      def update_list_member  #:doc:
        config     = SubscribedTo.mail_chimp_config
        merge_vars = self.class.merge_vars.dup

        # only do the update if either the subscription preference has changed (the user wants to be (un)subscribed),
        # or if one of the attributes in mail_chimp_config.merge_vars has changed
        if !(self.changed & merge_vars.collect { |key, method| method.to_s }.push("subscribed_to_list")).empty?
          api_key          = config.api_key
          list_id          = self.class.list_id
          subscribed_email = self.email
          g                = Gibbon::Request.new(api_key: api_key)

          if self.changed.include?("subscribed_to_list")
            lower_case_md5_hashed_email_address = Digest::MD5.hexdigest(subscribed_email.downcase)
            
            if !subscribed_to_list
              g.lists(list_id).members(lower_case_md5_hashed_email_address).update(body: { status: "unsubscribed" })
            else
            
              if !self.first_name.nil? && !self.last_name.nil?
                begin
                g.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: subscribed_email, status: "subscribed", merge_fields: {FNAME: self.first_name, LNAME: self.last_name}})
                rescue Gibbon::MailChimpError => ex
                  if ex.title.to_s.include? "Compliance" # This user unsubscribed from us in the past, but wants to resubscribe
                    g.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: subscribed_email, status: "pending", merge_fields: {FNAME: self.first_name, LNAME: self.last_name}})
                  end
                end
              else
                begin
                  g.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: subscribed_email, status: "subscribed"})
                rescue Gibbon::MailChimpError => ex
                  if ex.title.to_s.include? "Compliance" # This user unsubscribed from us in the past, but wants to resubscribe
                    g.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(body: {email_address: subscribed_email, status: "pending"})
                  end
                end
              end
              
            end

            end
          end
        end
    end
  end
end
