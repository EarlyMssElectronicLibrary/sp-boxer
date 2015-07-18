#!/usr/bin/env ruby

require 'yaml'

mappings = File.expand_path '../../data/MAPPING_ShootList2ShotConfig.txt', __FILE__
config_file = File.expand_path '../../data/config_metadata.yml', __FILE__

config = YAML.load(open(config_file))

IO.foreach mappings do |line|
  shoot_list, setup = line.strip.split /\t/
  # puts "Looking for #{setup}"
  if config[setup]
    # puts "   -- Size #{config[setup].size}"
  else
    puts "   -- Can't find #{setup}"
  end

end
