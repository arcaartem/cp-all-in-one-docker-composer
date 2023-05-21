#!/usr/bin/env ruby
require_relative './lib/confluent_platform_composer.rb'

builder = ConfluentPlatformComposer.new(zookeeper_ensemble_size: 3, broker_cluster_size: 3)
File.write('docker-compose.yml', builder.compose)
