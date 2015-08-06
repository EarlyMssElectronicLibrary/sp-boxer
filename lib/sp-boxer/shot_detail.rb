require 'yaml'

module SPBoxer
  class ShotDetail

    class << self

      def shot_details
        @details ||= YAML.load(open(SPBoxer.config.shot_details))
      end

      def details_for_setup name
        ShotDetail.new shot_details[name]
      end
    end

    def initialize(details_hash)
      @details_hash = details_hash
    end

    def shot_symbol file
      ShotSymbol.new file
    end

    def has_metadata? filename
      symbol = ShotSymbol.new filename
      !!(@details_hash[symbol.long] || @details_hash[symbol.short])
    end

    def details_for_image filename
      symbol = shot_symbol filename
      details = (@details_hash[symbol.long] || @details_hash[symbol.short])
      raise "No shot details found for #{filename}" unless details

      details.dup
    end

    def shot_metadata filename
      details_for_image(filename).keep_if { |k| k =~ /\AIMG/ }
    end
  end
end
