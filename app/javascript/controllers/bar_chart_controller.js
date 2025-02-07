import { Controller } from "@hotwired/stimulus";
import { Chart, BarController, BarElement, CategoryScale, LinearScale, Title, Tooltip, Legend } from "chart.js";
import ChartDataLabels from "chartjs-plugin-datalabels";

Chart.register(BarController, BarElement, CategoryScale, LinearScale, Title, Tooltip, Legend, ChartDataLabels);

// Define custom colors for political bias and credibility scores
const politicalBiasColors = {
  "Far-left": "#991B1B",
  "Left": "#991B1B",
  "Center": "#475569",
  "Right": "#1E40AF",
  "Far-right": "#1E40AF"
};

const credibilityColors = {
  "Very high": "#0F172A",
  "High": "#334155",
  "Medium": "#475569",
  "Low": "#94A3B8",
  "Very low": "#CBD5E1"
};

// Define the desired order of labels for political bias and credibility
const desiredOrder = [
  "Far-left", "Left", "Center", "Right", "Far-right", // Political bias
  "Very high", "High", "Medium", "Low", "Very low"   // Credibility scores
];

export default class extends Controller {
  connect() {
    // Ensure we don't duplicate charts
    if (this.chart) {
      this.chart.destroy();
    }

    const chartData = JSON.parse(this.element.dataset.chart);
    const chartLabel = this.element.dataset.chartLabel || "Distribution";

    // Sort the data based on the desired order while keeping others intact
    const sortedLabels = desiredOrder.filter(label => chartData.hasOwnProperty(label))
      .concat(
        Object.keys(chartData).filter(label => !desiredOrder.includes(label)) // Add remaining labels
      );

    const sortedData = sortedLabels.map(label => chartData[label]);

    // Map colors for both political bias and credibility
    const backgroundColors = sortedLabels.map(label => {
      return politicalBiasColors[label] || credibilityColors[label] || "#999999"; // Default gray if unknown
    });

    const config = {
      type: "bar",
      data: {
        labels: sortedLabels, // Use sorted labels
        datasets: [
          {
            label: chartLabel,
            data: sortedData, // Use sorted data
            backgroundColor: backgroundColors,
            borderWidth: 1,
            borderRadius: 10,
          }
        ]
      },
      options: {
        indexAxis: 'y', // Horizontal bar chart
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
            font: { size: 14 },
            formatter: (value) => value,
            clip: false,
            overflow: "fit"
          }
        },
        scales: {
          x: {
            display: false,
            suggestedMax: Math.max(...sortedData) * 1.1 // Adjust maximum based on sorted data
          },
          y: {
            ticks: {
              color: "#18181B",
              font: { size: 14 }
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
