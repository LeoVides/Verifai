import { Controller } from "@hotwired/stimulus";
import { Chart, BarController, BarElement, CategoryScale, LinearScale, Title, Tooltip, Legend } from "chart.js";
import ChartDataLabels from "chartjs-plugin-datalabels";

Chart.register(BarController, BarElement, CategoryScale, LinearScale, Title, Tooltip, Legend, ChartDataLabels);

// Define custom colors for political bias and credibility scores
const politicalBiasColors = {
  "Far-left": "#7F1D1D",
  "Left": "#FCA5A5",
  "Center": "#CBD5E1",
  "Right": "#93C5FD",
  "Far-right": "#1E3A8A"
};

const credibilityColors = {
  "Very high": "#0F172A",
  "High": "#334155",
  "Medium": "#475569",
  "Low": "#94A3B8",
  "Very low": "#CBD5E1"
};

export default class extends Controller {
  connect() {
    // Ensure we don't duplicate charts
    if (this.chart) {
      this.chart.destroy();
    }

    const chartData = JSON.parse(this.element.dataset.chart);
    const chartLabel = this.element.dataset.chartLabel || "Distribution";

    const labels = Object.keys(chartData);
    const data = Object.values(chartData);

    const backgroundColors = labels.map(label => {
      return politicalBiasColors[label] || credibilityColors[label] || "#999999"; // Default gray if unknown
    });

    const config = {
      type: "bar",
      data: {
        labels: labels,
        datasets: [
          {
            label: chartLabel,
            data: data,
            backgroundColor: backgroundColors,
            borderWidth: 1,
            borderRadius: 10,
          }
        ]
      },
      options: {
        indexAxis: 'y',
        responsive: true,
        layout: {
          padding: {
            left: 20,
            right: 20,
          }
        },
        plugins: {
          legend: { display: false },
          title: { display: false },
          datalabels: {
            anchor: "end",
            align: "end",
            color: "#18181B",
            font: {size: 14 },
            formatter: (value) => value,
            clip: false,
            overflow: "fit"
          }
        },
        scales: {
          x: {
            display: false,
            suggestedMax: Math.max(...data) * 1.1
           },
          y: {
            ticks: {
              color: "#18181B",
              font: {size: 14 }
            },
            grid: {
              display: false // Removes the grid lines on the y-axis
            }
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
