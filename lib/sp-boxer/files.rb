module SPBoxer
  class Files
    def find_file file_ctx
      case file_ctx.config_type
      when :shots
        shot_config_csv file_ctx.setup_name
      when :geometry
        system_geometry_csv file_ctx.setup_name
      else
        raise "Sorry don't know config_type: #{config_type}'"
      end
    end

    def format file_ctx
      file = find_file file_ctx
      case file_ctx.format
      when :csv
        puts open(file).read
      when :html
        puts format_html file_ctx
      else
        raise "Unknown format type: #{format}"
      end
    end

    def format_html file_ctx

    end

    def shot_config_csv setup_name
      path = csv_path SPBoxer.config.illumination_details_dir, setup_name
    end

    def system_geometry_csv setup_name
      path = csv_path SPBoxer.config.system_geometries_dir, setup_name
    end

    def csv_path dir, setup_name
      path = File.join dir, "#{setup_name}.csv"
      if File.exists? path
        path
      else
        raise "Could not find file for setup '#{setup_name}': path"
      end
    end
  end
end
