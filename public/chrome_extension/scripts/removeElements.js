export function removeElements() {
  const alert = document.querySelector('.alert');
  if (alert) alert.remove();

  const header = document.querySelector('.fact-check-header');
  if (header) header.remove();
}
