module SPBoxer
  class ShootListMapping
    def initialize
      @mapping = {}
      IO.foreach(SPBoxer.config.shootlist_mapping) do |line|
        list, setup = line.strip.split(/\s+/,2)
        @mapping[list] = setup
      end
    end

    def setup_name shoot_list
      @mapping[shoot_list] or raise "Unknown shootlist: #{shoot}"
    end
  end
end
