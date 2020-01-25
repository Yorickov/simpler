require_relative 'config/environment'

use Rack::Reloader
use Simpler::AppLogger

run Simpler.application
