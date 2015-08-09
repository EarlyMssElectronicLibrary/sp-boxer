require_relative 'environment'
require 'sp-boxer'


SPBoxer.configure do |config|
  config.data_dir                 = File.expand_path '../../data', __FILE__
  config.shootlist_mapping        = File.join config.data_dir, 'MAPPING_ShootList2ShotConfig.txt'
  config.shot_details             = File.join config.data_dir, 'shot_details.yml'
  config.metadata_template        = File.join config.data_dir, 'metadata_template.json'
  config.illumination_details_dir = File.join config.data_dir, 'IlluminationDetails'
  config.system_geometries_dir      = File.join config.data_dir, 'SystemGeometries'
end
