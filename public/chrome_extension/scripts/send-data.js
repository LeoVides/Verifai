console.log("inside send-data.js");


function fetchData() {
  const url = window.location.href;

  return {
    url: url
  }
}

function sendData(data) {
  console.log(`I've found something cool: ${data.url}`);
}

sendData(fetchData());
