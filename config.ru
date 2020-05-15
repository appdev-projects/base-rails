# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

if Rails.env.development?
  map '/git' do
    run WebGit::Server
  end
end

map '/' do
  run Rails.application
end

