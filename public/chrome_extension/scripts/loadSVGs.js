export function loadSVGs() {
  const bias = document.getElementById('bias-result').innerText.toLowerCase().replace("-", "_");

  document.getElementById('user-vector').src = chrome.runtime.getURL('assets/user.svg');
  document.getElementById('fact-vector').src = chrome.runtime.getURL('assets/fact_check.svg');
  document.getElementById('bias-vector').src = chrome.runtime.getURL(`assets/${bias}.svg`);
  document.getElementById('bulb-vector').src = chrome.runtime.getURL('assets/lightbulb.svg');
}
