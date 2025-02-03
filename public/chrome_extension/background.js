console.log("Chrome extension");

// Called when the user clicks on the browser action.
chrome.browserAction.onClicked.addListener((tab) => {
  chrome.tabs.executeScript({
    code: 'document.body.style.backgroundColor="#C3413B"'
  });

});
