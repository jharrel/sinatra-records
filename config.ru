require './config/environment'

# IMPORTANT FILE --- add controllers here
use Rack::MethodOverride
use SessionsController
use RecordsController
run ApplicationController
