

function listenClick() {
  const form = document.getElementById('search-form');
  const textArea = document.getElementById('user_input');


  form.addEventListener('submit', (event) => {
    event.preventDefault();
    console.log('Button clicked in popup.js');
    const userInput = textArea.value;
    console.log(textArea);
    console.log(userInput);


  })
}

listenClick();
