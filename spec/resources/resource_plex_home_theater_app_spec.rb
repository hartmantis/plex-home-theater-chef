# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/resource_plex_home_theater_app'

describe Chef::Resource::PlexHomeTheaterApp do
  let(:name) { 'default' }
  let(:resource) { described_class.new(name, nil) }

  describe '#initialize' do
    it 'sets the correct resource name' do
      exp = :plex_home_theater_app
      expect(resource.resource_name).to eq(exp)
    end

    it 'sets the correct supported actions' do
      expected = [:nothing, :install, :remove, :enable, :disable, :start]
      expect(resource.allowed_actions).to eq(expected)
    end

    it 'sets the correct default action' do
      expect(resource.action).to eq([:install])
    end

    it 'sets the installed status to nil' do
      expect(resource.installed).to eq(nil)
    end

    it 'sets the enabled status to nil' do
      expect(resource.enabled).to eq(nil)
    end

    it 'sets the running status to nil' do
      expect(resource.running).to eq(nil)
    end
  end

  [:installed, :installed?].each do |m|
    describe "##{m}" do
      context 'default unknown installed status' do
        it 'returns nil' do
          expect(resource.send(m)).to eq(nil)
        end
      end

      context 'app installed' do
        let(:resource) do
          r = super()
          r.instance_variable_set(:@installed, true)
          r
        end

        it 'returns true' do
          expect(resource.send(m)).to eq(true)
        end
      end

      context 'app not installed' do
        let(:resource) do
          r = super()
          r.instance_variable_set(:@installed, false)
          r
        end

        it 'returns false' do
          expect(resource.send(m)).to eq(false)
        end
      end
    end
  end

  [:enabled, :enabled?].each do |m|
    describe "##{m}" do
      context 'default unknown enabled status' do
        it 'returns nil' do
          expect(resource.send(m)).to eq(nil)
        end
      end

      context 'app enabled' do
        let(:resource) do
          r = super()
          r.instance_variable_set(:@enabled, true)
          r
        end

        it 'returns true' do
          expect(resource.send(m)).to eq(true)
        end
      end

      context 'app not enabled' do
        let(:resource) do
          r = super()
          r.instance_variable_set(:@enabled, false)
          r
        end

        it 'returns false' do
          expect(resource.send(m)).to eq(false)
        end
      end
    end
  end

  [:running, :running?].each do |m|
    describe "##{m}" do
      context 'default unknown running status' do
        it 'returns nil' do
          expect(resource.send(m)).to eq(nil)
        end
      end

      context 'app running' do
        let(:resource) do
          r = super()
          r.instance_variable_set(:@running, true)
          r
        end

        it 'returns true' do
          expect(resource.send(m)).to eq(true)
        end
      end

      context 'app not running' do
        let(:resource) do
          r = super()
          r.instance_variable_set(:@running, false)
          r
        end

        it 'returns false' do
          expect(resource.send(m)).to eq(false)
        end
      end
    end
  end
end