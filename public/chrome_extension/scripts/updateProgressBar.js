// updateProgressBar.js
export function updateProgressBar() {
  const progressBar = document.querySelector(".progress-bar");
  const factScore = document.querySelector('.progress-bar');
  const factScoreValue = factScore.getAttribute("aria-valuenow");

  // Set the progress bar to 0 initially
  progressBar.style.width = "0%";

  // Allow for the animation to be visible
  setTimeout(() => {
    progressBar.style.transition = "width 1.5s ease-out";
    progressBar.style.width = factScoreValue + "%";
  }, 200);
}
