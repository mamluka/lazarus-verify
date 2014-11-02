require 'rack/cors'
require File.expand_path('../verify-api.rb', __FILE__)

use Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :options, :put, :post]
  end
end

run Verify
