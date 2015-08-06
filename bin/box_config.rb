require_relative 'environment'
require 'sp-boxer'

data_dir                 = File.expand_path '../../data', __FILE__

shot_details_config      = File.join data_dir, 'shot_details.yml'
shootlist_mapping_config = File.join data_dir, 'MAPPING_ShootList2ShotConfig.txt'
metadata_template_json   = File.join data_dir, 'metadata_template.json'

SPBoxer.configure do |config|
  config.shootlist_mapping = shootlist_mapping_config
  config.shot_details      = shot_details_config
  config.metadata_template = metadata_template_json
end
