import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

eagerLoadControllersFrom("controllers", application);

// Import Chart.js
// import { Chart } from "chart.js";
// import BarChartController from "./bar_chart_controller.js";

// // Register the controller
// application.register("bar-chart", BarChartController);
