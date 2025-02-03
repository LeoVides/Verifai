function listenClick() {
  const form = document.getElementById('search-form');
  const textArea = document.getElementById('user_input');
  const results = document.getElementById('results');


  form.addEventListener('submit', (event) => {
    event.preventDefault();
    // console.log('Button clicked in popup.js');
    const userInput = textArea.value;
    console.log(userInput);

    fetch(form.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(form)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        results.innerHTML = data.partial;
      })

  })
}


listenClick();
