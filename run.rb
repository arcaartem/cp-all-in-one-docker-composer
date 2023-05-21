#!/usr/bin/env ruby

require_relative './lib/confluent_platform_composer.rb'
require_relative './lib/parser.rb'

DOCKER_COMPOSE_FILE='docker-compose.yml'

args = Parser.parse

if (!args.overwrite && File.exist?(DOCKER_COMPOSE_FILE))
  puts "ERROR: File '#{DOCKER_COMPOSE_FILE}' already exists. (Use -f to overwrite)"
  exit 1
end

builder = ConfluentPlatformComposer.new(zookeeper_ensemble_size: args.zookeeper_ensemble_size, broker_cluster_size: args.broker_cluster_size)
File.write(DOCKER_COMPOSE_FILE, builder.compose)
