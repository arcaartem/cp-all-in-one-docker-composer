#!/usr/bin/env ruby


require 'erb'


class ConfluentPlatformComposer
  def initialize(zookeeper_ensemble_size:, broker_cluster_size:)

    @zookeeper_ensemble = zookeeper_ensemble_size.times.map do |counter|
      {
        name: "zookeeper#{zookeeper_ensemble_size > 1 ? counter + 1 : ''}",
        port: 2181 + counter
      }
    end

    @broker_cluster = broker_cluster_size.times.map do |counter|
      {
        id: counter + 1,
        name: "broker#{broker_cluster_size > 1 ? counter + 1 : ''}",
        port: 9092 + counter,
        jmx_port: 9101 + counter
      }
    end
  end

  def compose
    template = ERB.new(File.read('./lib/docker-compose.yml.erb'), trim_mode: '-<>')
    template.result(binding)
  end
end
