module SPBoxer
  module ShootUtil
    def shootlist file
      File.basename(file).split(/_/).first
    end
  end
end
