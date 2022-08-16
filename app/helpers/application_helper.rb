module ApplicationHelper

    def gravatar_for(user, options = { size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "img-fluid rounded shadow mx-auto d-block")
      end

      def bootstrap_class_for flash_type
        { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
      end

      def flash_messages(opts = {})
        flash.each do |msg_type, message|
          concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show", role: "alert") do
            concat content_tag(:button, '', class: "btn-close", data: { bs_dismiss: 'alert' })
            concat message
          end)
        end
          nil
      end
end


