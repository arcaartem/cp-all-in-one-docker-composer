require 'yaml'
require_relative '../../lib/confluent_platform_composer.rb'

describe 'Docker Compose generation' do
  it 'generates correct docker compose file' do
    expected = File.read('spec/support/docker-compose.yml')

    builder = ConfluentPlatformComposer.new(zookeeper_ensemble_size: 1, broker_cluster_size: 5)
    expect(builder.compose.to_s).to eq(expected)
  end
end

