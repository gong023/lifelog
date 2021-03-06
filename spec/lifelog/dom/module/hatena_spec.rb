require 'spec_helper'

describe Everlog::Dom::Module::Hatena do
  describe '.fetch_since' do
    subject { described_class.fetch_since (DateTime.now - 1).to_time }
    before { allow_any_instance_of(Everlog::Inf::Api::Hatena).to receive(:feed_entry).and_return(response) }

    let(:valid_date_feed) do
      { 'title' => 'hello', 'link' => [{'href' => 'link'}], 'issued' => DateTime.now.to_time }
    end
    let(:invalid_date_feed) { { 'issued' => (DateTime.now - 2).to_time } }

    shared_examples_for 'valid result' do
      it { expect(subject).to be_instance_of Array }
      it { expect(subject.size).to be 2 }
      it { expect(subject[0].title).to eq 'hello' }
      it { expect(subject[0].link).to eq 'link' }
    end

    context 'normal case' do
      let(:response) { [valid_date_feed, valid_date_feed] }
      it_behaves_like 'valid result'
    end

    context 'with too old feed existing' do
      let(:response) { [valid_date_feed, valid_date_feed, invalid_date_feed] }
      it_behaves_like 'valid result'
    end

    context 'with no response data' do
      let(:response) { [] }
      it { expect(subject).to eq [] }
    end
  end
end
