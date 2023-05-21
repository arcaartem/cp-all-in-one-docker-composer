require 'optparse'

Options = Struct.new(:zookeeper_ensemble_size, :broker_cluster_size)

class Parser
  def self.parse(options=ARGV)

    args = Options.new(1, 5) # Defaults (Zookeeper: 1, Broker: 5)

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: cp_compose.rb [options]"

      opts.on('-z', '--zookeeper-ensemble-size SIZE', Integer, "Desired SIZE of Zookeeper ensemble in the generated docker compose file. Default is 1") do |s|
        args.zookeeper_ensemble_size = s
      end

      opts.on('-b', '--broker-cluster-size SIZE', Integer, "Desired SIZE of Broker cluster in the generated docker compose file. Default is 5") do |s|
        args.broker_cluster_size = s
      end

      opts.on('-h', '--help', 'Prints this help') do
        puts opts
        exit
      end
    end

    if args.broker_cluster_size.nil? || args.zookeeper_ensemble_size.nil?
      puts opt_parser.help
      exit 1
    end

    opt_parser.parse!(options)
    args
  end
end
