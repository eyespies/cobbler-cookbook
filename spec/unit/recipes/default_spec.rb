#
# Cookbook:: cobblerd
# Spec:: default
#
# Copyright:: 2017-2018, Phoenix Specialty Manufacturing Company, All Rights Reserved.

require 'spec_helper'

describe 'cobblerd::default' do
  let(:recipes) do
    %w[cobblerd::repos cobblerd::server]
  end

  platforms.each do |platform, details|
    versions = details['versions']
    versions.each do |version|
      context "On #{platform} #{version} with a default configuration" do
        before do
          recipes.each do |recipe|
            allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with(recipe)
          end
          allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cobblerd::nginx')
          allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cobblerd::uwsgi')
        end

        let(:chef_run) do
          runner = ChefSpec::SoloRunner.new(platform: platform, version: version)
          runner.node.override['environment'] = 'dev'
          runner.converge(described_recipe) do
            runner.resource_collection.insert(Chef::Resource::Service.new('nginx', runner.run_context))
          end
        end

        it 'should define the cobbler-sync command' do
          resource = chef_run.bash('cobbler-sync')
          expect(resource).to do_nothing
        end

        it 'should require the other recipes' do
          recipes.each do |recipe|
            expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with(recipe)
          end
          chef_run
        end

        it 'should require the Nginx recipe by default' do
          expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cobblerd::nginx')
          expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cobblerd::uwsgi')
          expect_any_instance_of(Chef::Recipe).to_not receive(:include_recipe).with('cobblerd::apache')
          chef_run
        end
      end

      context "On #{platform} #{version} with an Apache configuration" do
        before do
          recipes.each do |recipe|
            allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with(recipe)
          end
          allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cobblerd::apache')
        end

        let(:chef_run) do
          runner = ChefSpec::SoloRunner.new(platform: platform, version: version)
          runner.node.override['environment'] = 'dev'
          runner.node.override['cobblerd']['http_service_name'] = 'apache'
          runner.converge(described_recipe)
        end

        it 'should define the cobbler-sync command' do
          resource = chef_run.bash('cobbler-sync')
          expect(resource).to do_nothing
        end

        it 'should require the other recipes' do
          recipes.each do |recipe|
            expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with(recipe)
          end
          chef_run
        end

        it 'should require the Apache recipe when so configured' do
          expect_any_instance_of(Chef::Recipe).to_not receive(:include_recipe).with('cobblerd::nginx')
          expect_any_instance_of(Chef::Recipe).to_not receive(:include_recipe).with('cobblerd::uwsgi')
          expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('cobblerd::apache')
          chef_run
        end
      end
    end
  end
end
