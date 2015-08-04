module SPBoxer
  module CLIMessages
    def print_message cmd, type, msg
      puts sprintf("%-23s  %-12s  %s", "[#{cmd}]", type, msg)
    end # def print_message cmd, type, msg

    def message cmd, msg
      print_message cmd, 'INFO', msg
    end # def message cmd,

    def warning cmd, msg
      print_message cmd, 'WARNING', msg
    end

    def error_no_exit cmd, msg
      print_message cmd, 'ERROR', msg
    end

    def error cmd, msg
      usage if defined? :usage
      puts
      print_message cmd, 'ERROR', msg
      exit 1
    end # def message cmd,
  end
end
