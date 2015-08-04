module SPBoxer
  class Metadata
    def find_imaging_setup shoot_list
      shootlist_mapping = ShootListMapping.new
      setup_name        = shootlist_mapping.setup_name shoot_list

      setup = ImagingSetup.setup setup_name
      raise "No setup found for #{filename}" unless setup
      setup
    end

    def has_metadata? shoot_list, filename
      setup = find_imaging_setup shoot_list
      setup.has_metadata? filename
    end

    def shot_details shoot_list, filename
      setup = find_imaging_setup shoot_list
      setup.shot_details filename
    end

    def shot_metadata shoot_list, filename
      setup = find_imaging_setup shoot_list
      setup.shot_metadata filename
    end
  end
end
