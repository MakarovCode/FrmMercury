require "frm_mercury/version"
require "frm_mercury/Configuration"
require "frm_mercury/sender"

module FrmMercury
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
