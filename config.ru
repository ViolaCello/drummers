require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
 # raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use Rack::MethodOverride 
use LessonController
use PracticesController
use DataviewsController
use SessionController 
use DrummerController
run ApplicationController
