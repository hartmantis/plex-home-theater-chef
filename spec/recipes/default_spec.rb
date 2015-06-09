# Encoding: UTF-8

require_relative '../spec_helper'

describe 'plex-home-theater::default' do
  let(:runner) { ChefSpec::SoloRunner.new }
  let(:chef_run) { runner.converge(described_recipe) }

  it 'installs the Plex Home Theater app' do
    expect(chef_run).to install_plex_home_theater_app('default')
  end
end
