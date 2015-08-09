require 'fattr'

module SPBoxer
  class FileContext
    fattr :config_type
    fattr :setup_name
    fattr :shoot_list
    fattr format: :csv

    def initialize(atributes)
      atributes.each do |k,v|
        public_send "#{k}=", v
      end
    end

  end
end
