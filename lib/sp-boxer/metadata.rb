module SPBoxer
  class Metadata
    def find_imaging_setup filename
      shootlist_mapping = ShootListMapping.new
      setup_name        = shootlist_mapping.setup_name filename

      setup = ImagingSetup.setup setup_name
      raise "No setup found for #{filename}" unless setup
      setup
    end

    def has_metadata? filename
      setup = find_imaging_setup filename
      setup.has_metadata? filename
    end

    def shot_details filename
      setup = find_imaging_setup filename
      setup.shot_details filename
    end

    def shot_metadata filename
      setup = find_imaging_setup filename
      setup.shot_metadata filename
    end
  end
end
