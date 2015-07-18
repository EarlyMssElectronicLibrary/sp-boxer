require 'yaml'

module SPBoxer
  class ImagingSetup

    class << self

      def imaging_setups
        @setups ||= YAML.load(open(SPBoxer.config.imaging_setups))
      end

      def setup name
        ImagingSetup.new imaging_setups[name]
      end
    end

    def initialize(setup_hash)
      @setup_hash = setup_hash
    end

    def shot_symbol file
      ShotSymbol.new file
    end

    def has_metadata? filename
      symbol = ShotSymbol.new filename
      !!(@setup_hash[symbol.long] || @setup_hash[symbol.short])
    end

    def shot_details filename
      symbol = shot_symbol filename
      details = (@setup_hash[symbol.long] || @setup_hash[symbol.short])
      raise "No shot details found for #{filename}" unless details

      details.dup
    end

    def shot_metadata filename
      shot_details(filename).keep_if { |k| k =~ /\AIMG/ }
    end
  end
end
