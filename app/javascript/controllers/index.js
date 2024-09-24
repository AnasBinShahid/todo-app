// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"

import HellloController from "./hello_controller";

application.register("hello", HellloController);
