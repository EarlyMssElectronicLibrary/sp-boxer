#!/usr/bin/env ruby

require 'csv'
require 'yaml'

symbols = %w(
  MB365UV
  MB455RB
  MB470LB
  MB505Cy
  MB535Gr
  MB570Am
  MB625Rd
  MB700IR
  MB735IR
  MB780IR
  MB870IR
  MB940IR
  MBUV-RB
  MBUVRB
  RE455RB
  RE870IR
  RS455RB
  RS870IR
  TX450RB
  TX535Gr
  TX570Am
  TX635Rd
  TX700IR
  TX780IR
  TX870IR
  TX940IR
  WBRBB47
  WBRBG58
  WBRBG61
  WBRBO22
  WBRBR25
  WBUVB47
  WBUVG58
  WBUVG61
  WBUVO22
  WBUVR25
  WBUVUVP
  WBUVUVb)

symbol                     = 'Symbol'
alt_symbol                 = 'Alternate Symbol'
imaging_device_make        = 'IMG_Imaging_Device_Make'
imaging_device_model       = 'IMG_Imaging_Device_Model'
sensor                     = 'IMG_Sensor'
lens_brand                 = 'IMG_Lens_Brand'
lens_model                 = 'IMG_Lens_model'
lens_size                  = 'IMG_Lens_Size_mm'
img_spectral_range         = 'IMG_Spectral_Range'
sensor_spectral_range      = 'IMG_Sensor_Spectral_Range'
illumination_source_number = 'IMG_Illumination_Source_Number'
illumination_wavelength    = 'IMG_Illumination_Wavelength'
illumination_wattage       = 'IMG_Illumination_Source_Wattage'
illumination_aux_wattage   = 'IMG_Illumination_Aux_Wattage'
acquisition_filters        = 'IMG_Acquisition_Filters'
filter_density             = 'Filter Density '
filter_center_wavelength   = 'IMG_Filter_Nominal_Pass_Center_Wavelength'
filter_fwhm                = 'IMG_Filter_Nominal_Pass_FWHM'


COMMAND = File.basename __FILE__
metadata_glob = File.expand_path File.expand_path '../../data/IlluminationDetails/*.csv', __FILE__
metadata_csvs = Dir[metadata_glob]

unless metadata_csvs && metadata_csvs.size > 0
  raise "No CSV files found in: #{File.dirname metadata_glob}"
end

def usage
  $stderr.puts "Usage: #{COMMAND} CSV_FILES"
end

def exit_with_error msg
  usage
  $stderr.puts
  $stderr.puts "[#{COMMAND}] #{msg}"
  exit 1
end

symbol_map = {}

class Shot
  def initialize(data_hash)
    @data_hash = data_hash
    cleanup
  end

  def cleanup
    keys = @data_hash.keys
    keys.each do |key|
      v = @data_hash[key]
      if v.nil? or v.to_s.strip == '' or key !~ /symbol|img_/i
        @data_hash.delete(key)
      else
        @data_hash[key] = v.strip if v && v.is_a?(String)
      end
    end
  end

  def alt_code
    @data_hash['Alternate Symbol']
  end

  def code
    @data_hash['Symbol']
  end

  def empty?
    %w(IMG_Imaging_Device_Make
       IMG_Imaging_Device_Model
       IMG_Sensor
       IMG_Lens_Brand
       IMG_Lens_model
       IMG_Lens_Size_mm
       IMG_Spectral_Range
    ).all? { |field|
      @data_hash[field].nil? || @data_hash[field].strip.empty?
    }
  end

  def to_hash
    @data_hash.dup
  end
end


metadata_csvs.each do |csv|

  csv_hash = {}

  CSV.foreach(csv, headers: true) do |row|
    shot = Shot.new row.to_hash
    if symbols.include?(shot.code)
      csv_hash[shot.code]     = shot.to_hash unless shot.empty?
      csv_hash[shot.alt_code] = shot.to_hash if shot.alt_code
    else
      $stderr.puts "WARNING: code not found: #{shot.code}"
    end
  end
  config_name = File.basename(csv, '.csv').strip
  symbol_map[config_name] = csv_hash
end
puts YAML.dump symbol_map
