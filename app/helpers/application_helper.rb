module ApplicationHelper
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "http://secure.gravata.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url,alt: user.username)
    end
end
