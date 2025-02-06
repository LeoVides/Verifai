export function resetForm(form, button) {
  form.reset();
  button.classList.add("disabled");
  setTimeout(() => {
    button.classList.remove("disabled");
  }, 5000); // Enable button after 5 seconds
}
