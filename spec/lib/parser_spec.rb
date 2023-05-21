require_relative '../../lib/parser.rb'

describe Parser do
  context 'when no arguments are given' do
    subject { described_class.parse(%w[]) }

    it 'uses default values' do
      expect(subject.zookeeper_ensemble_size).to be(1)
      expect(subject.broker_cluster_size).to be(5)
    end
  end

  context 'when short arguments are given' do
    subject { described_class.parse(%w[-z 3 -b 7]) }

    it 'uses provided values' do
      expect(subject.zookeeper_ensemble_size).to be(3)
      expect(subject.broker_cluster_size).to be(7)
    end
  end

  context 'when long arguments are given' do
    subject { described_class.parse(%w[--zookeeper_ensemble_size 2 --broker_cluster_size 4]) }

    it 'uses provided values' do
      expect(subject.zookeeper_ensemble_size).to be(2)
      expect(subject.broker_cluster_size).to be(4)
    end
  end
end


