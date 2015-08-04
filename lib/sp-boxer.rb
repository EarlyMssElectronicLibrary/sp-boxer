require 'sp-boxer/configuration'
require 'sp-boxer/shoot_list_mapping'
require 'sp-boxer/imaging_setup'
require 'sp-boxer/shot_symbol'
require 'sp-boxer/metadata'
require 'sp-boxer/cli_messages'

module SPBoxer
  CAPTURE_REGEX = /\+[A-Z].+(_F\.tiff?|\.jpe?g|dng)$/i
  class << self
    attr_writer :configuration

    def shootlist file
      file =~ /\A[[:alpha:]]?\d{4}/ and "#{$2}"
    end

    def capture_image? filename
      filename =~ CAPTURE_REGEX
    end
  end

  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(config)
  end
end
