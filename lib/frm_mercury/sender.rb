module FrmMercury
  class Sender
    def self.send(to=nil, title=nil, body=nil, subtitle=nil, icon=nil, sound=nil, data=nil, extra={})
      config = FrmMercury.configuration

      require 'uri'
      require 'net/http'
      require 'net/https'
      require 'json'

      key = to.kind_of?(Array) ? "registration_ids" : "to"

      params = {
        "#{key}": to,
        "notification": {
          "title": title.nil? ? "Testing notification" : title,
          "body": body.nil? ? "This is a test push notification, liking it?" : body,
          "mutable_content": true,
          "sound": sound.nil? ? "enabled" : sound
        },
        "android": {
          "ttl": "86400s",
          "notification": {
            "click_action": "android.intent.action.MAIN"
          }
        },
        "data": data
      }

      if !subtitle.nil? 
        params["notification"]["subtitle"] = subtitle
      end

      if !icon.nil? 
        params["notification"]["icon"] = icon
      end

      params = params.merge(extra).to_json

      uri = URI.parse("https://fcm.googleapis.com/fcm/send")
      https = Net::HTTP.new(uri.host,uri.port)
      https.use_ssl = true
      req = Net::HTTP::Post.new(uri.path, initheader = {"Content-Type" => "application/json", "Authorization" => "key=#{config.get_api_key}"})
      req.body = params
      res = https.request(req)
      puts "Response #{res.code} #{res.message}: #{res.body}"
      return "Response #{res.code} #{res.message}: #{res.body}"
    end
  end
end
