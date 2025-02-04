import { Controller } from "@hotwired/stimulus";
import { Chart, BarController, BarElement, CategoryScale, LinearScale, Title, Tooltip, Legend } from "chart.js";

// Register required Chart.js components
Chart.register(BarController, BarElement, CategoryScale, LinearScale, Title, Tooltip, Legend);

// Connects to data-controller="bar-chart"
export default class extends Controller {
  connect() {
    // Ensure we don't duplicate charts
    if (this.chart) {
      this.chart.destroy();
    }

    // Get the data from the HTML element (Rails passes it as a JSON string)
    const chartData = JSON.parse(this.element.dataset.chart);

    const labels = Object.keys(chartData);
    const data = Object.values(chartData);

    const chartLabel = this.element.dataset.chartLabel || "Distribution";

    const config = {
      type: "bar",
      data: {
        labels: labels,
        datasets: [
          {
            label: chartLabel,
            data: data,
            backgroundColor: [
              "#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0", "#9966FF"
            ],
            borderWidth: 1
          }
        ]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    this.chart = new Chart(this.element, config);
  }

  disconnect() {
    // Destroy the chart when leaving the page to prevent memory leaks
    if (this.chart) {
      this.chart.destroy();
    }
  }
}
