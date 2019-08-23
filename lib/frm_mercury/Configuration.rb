module FrmMercury
  class Configuration
    attr_accessor :api_key

    def initialize
      # For production
      @api_key = nil
    end

    def get_api_key
      @api_key
    end
  end
end
