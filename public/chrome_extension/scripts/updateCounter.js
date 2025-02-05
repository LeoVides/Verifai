export function updateCounter(textArea, counter, checkIcon) {
  const userInputLength = textArea.value.length;
  counter.textContent = userInputLength;

  if (userInputLength > 50 && userInputLength < 5000) {
    checkIcon.classList.remove('d-none');
  } else {
    checkIcon.classList.add('d-none');
  }
}
