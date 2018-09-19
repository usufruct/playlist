// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
console.log('playlists javascript');

// this should add a new track form element
function trackMaker(cssClass, trackContainerID) {
  console.log(trackContainerID);
  const found = document.querySelectorAll(cssClass);
  const trackCount = found.length;
  const lastTrack = found[found.length - 1];
  const regex = new RegExp(`${trackCount - 1}`, 'g');
  const newHTML = lastTrack.outerHTML.replace(regex, `${trackCount}`);
  const range = document.createRange();
  range.selectNode(lastTrack)
  const newInput = range.createContextualFragment(newHTML);
  document.getElementById(trackContainerID).append(newInput)
}

