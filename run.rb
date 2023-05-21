#!/usr/bin/env ruby

# TODO: Add overwrite prevention

require_relative './lib/confluent_platform_composer.rb'
require_relative './lib/parser.rb'

args = Parser.parse

builder = ConfluentPlatformComposer.new(zookeeper_ensemble_size: args.zookeeper_ensemble_size, broker_cluster_size: args.broker_cluster_size)
File.write('docker-compose.yml', builder.compose)
