require_relative 'environment'
require 'sp-boxer'

SPBoxer.configure do |config|
  config.shootlist_mapping        = File.join data_dir, 'MAPPING_ShootList2ShotConfig.txt'
  config.shot_details             = File.join data_dir, 'shot_details.yml'
  config.metadata_template        = File.join data_dir, 'metadata_template.json'
  config.illumination_details_dir = File.join data_dir, 'IlluminationDetails'
  config.camera_setups_dir        = File.join data_dir, 'CameraSetups'
end
