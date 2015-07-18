module SPBoxer
  class ShotSymbol
    attr_reader :base

    def initialize file
      @base = File.basename file
      @symbol, @serial_num = @base.scan(/\+([^_]+)_(\d{3})/).flatten
    end

    def parts
      @base.scan(/\+([^_]+)_(\d{3})/).flatten
    end

    # For defective file names like `0024_000146_017_F.tif` (i.e., that
    # don't have `+WBRBB47_017`); just return the serial number.
    def dig_for_serial_number
      # Chomp extension and _F of the end of the file name leaving shot
      # seq and descriptor:
      #
      # 0024_000146_017_F.tif  => 0024_000146_017
      # 0024_000146_017.jpg    => 0024_000146_017
      # 0024_000146_017.dng    => 0024_000146_017
      #
      s = @base.gsub /(_F)?\.(tiff?|jpe?g|dng)$/i, ''
      # now grab and return the serial number (last three digits) or ''
      s =~ /\d{3}$/ && $& || ''
    end

    def symbol
      parts[0]
    end

    def serial_num
      parts[1]
    end

    def long
      [ @symbol, @serial_num ].flat_map { |x| x || [] }.join '_'
    end

    def short
      symbol
    end

    def to_s
      long
    end
  end
end
