let geoBtn = null

function getLocation() {
  if (navigator.geolocation) {
    geoBtn.textContent = 'Loading...'
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    console.log("Geolocation is not supported by this browser.")
    return
  }
}

function showPosition(position) {
  let lat = position.coords.latitude;
  let long = position.coords.longitude;

  if(document.querySelector('.latitude')){
    document.querySelector('.latitude').value = Number(Math.floor(lat))
  }
  if(document.querySelector('.longitude')){
    document.querySelector('.longitude').value = Number(Math.floor(long))
  }
  geoBtn.textContent = 'Current Location'
}
if(document.querySelector('.geolocation-btn')){
  geoBtn = document.querySelector('.geolocation-btn')
} else {
  geoBtn = document.querySelector('.mydetails-div')
}
geoBtn.addEventListener('click',getLocation)