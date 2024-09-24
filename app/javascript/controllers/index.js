// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"

import TennisSchoolsController from "./tennis_schools_controller";

application.register("tennis-schools", TennisSchoolsController);
