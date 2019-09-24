
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"

var taskCompleteButtons = document.querySelectorAll('.task_complete_button')
var acc1 = document.querySelector(".accordionOne");
var acc2 = document.querySelector(".accordionTwo");
var panelOne = document.querySelector('.panelOne');
var panelTwo = document.querySelector('.panelTwo');
var weatherIcon = document.querySelector('.weather-icon')
var weatherText = document.querySelector('.weather-text')

var completeTodos = null;
var incompleteTodos = null;

var collectAndPopulateCompleteTodos = () => {
  $.ajax({
    dataType: 'json',
    url: "/api/todos/complete"
  }).done((responses)=>{
    // Delete all children
    while (panelTwo.firstChild != null && panelTwo.childElementCount != 1){
      panelTwo.lastChild.remove();
    }

    // Add new children from AJAX query
    responses.forEach((responseElement)=>{
      var div =  document.createElement('div');
      div.classList.add('to-do-item');
      var h1 =  document.createElement('h1');
      h1.textContent = `${responseElement.due_date_month}: ${responseElement.task_name}`
      var h2 =  document.createElement('h2');
      h2.textContent = responseElement.plant_common_name
      var p =  document.createElement('p');
      p.classList.add('task_complete_button');
      p.setAttribute('name','todo_id');
      p.setAttribute('value',responseElement.todo_id);
      p.textContent = '🌳'

      div.appendChild(h1);
      div.appendChild(h2);
      div.appendChild(p);

      panelTwo.appendChild(div);
    });
  }).always(resetEventListeners);
}
var collectAndPopulateIncompleteTodos = () => {
  $.ajax({
    dataType: 'json',
    url: "/api/todos/incomplete"
  }).done((responses)=>{
    // Delete all children
    while (panelOne.firstChild != null && panelOne.childElementCount != 1){
      panelOne.lastChild.remove();
    }

    // Add new children from AJAX query
    responses.forEach((responseElement)=>{
      var div =  document.createElement('div');
      div.classList.add('to-do-item');
      var h1 =  document.createElement('h1');
      h1.textContent = `${responseElement.due_date_month}: ${responseElement.task_name}`
      var h2 =  document.createElement('h2');
      h2.textContent = responseElement.plant_common_name
      var p =  document.createElement('p');
      p.classList.add('task_complete_button');
      p.setAttribute('name','todo_id');
      p.setAttribute('value',responseElement.todo_id);
      p.textContent = '☑'

      div.appendChild(h1);
      div.appendChild(h2);
      div.appendChild(p);

      panelOne.appendChild(div);
    });
  }).always(resetEventListeners);
}

// var setDefaultWeatherIcon = () => {
//   $.ajax({
//     dataType: 'json',
//     url: "https://api.openweathermap.org/data/2.5/weather?q=Melbourne,aus&APPID=65d2c718348e35c15481b8dbf08c238d"
//   }).done(function (res) {
//     weatherIcon.setAttribute('src',`https://openweathermap.org/img/wn/${res.weather[0].icon}@2x.png`)
//   })
// }

var setWeatherIcon = () => {
  // weatherIcon.longitude
  // console.log(givenLocation);
  weatherIcon = document.querySelector('.weather-icon')
  $.ajax({
    dataType: 'json',
    url: `https://api.openweathermap.org/data/2.5/weather?lat=${weatherIcon.getAttribute('latitude')}&lon=${weatherIcon.getAttribute('longitude')}&APPID=65d2c718348e35c15481b8dbf08c238d`
  }).done(function (res) {
    weatherIcon.setAttribute('src',`https://openweathermap.org/img/wn/${res.weather[0].icon}@2x.png`)
  })
}

var changeCompleteValue = (event) => {
  var toDoItem = event.target
  // debugger;
  $.ajax({
    method: 'post',
    url: '/api/todos',
    data: { todo_id: event.target.getAttribute('value') }
  }).done(function(res) {
      toDoItem.closest('.to-do-item').classList.add('zero-width')
      setTimeout(()=>{
        toDoItem.closest('.to-do-item').classList.add('collapse_height')
        setTimeout(()=>{
          toDoItem.closest('.to-do-item').classList.add('zero_height')
        },250);
      }, 500);
  })
}

acc1.addEventListener("click", function() {
  this.classList.toggle("closed");
  if (panelOne.classList.contains('closed')){
    collectAndPopulateIncompleteTodos();
    panelOne.classList.remove('closed');
    panelTwo.classList.add('closed');
  } else {
    panelOne.classList.add('closed');
  }
});

acc2.addEventListener("click", function() {
  this.classList.toggle("closed");
  if (panelTwo.classList.contains('closed')){
    collectAndPopulateCompleteTodos();
    panelTwo.classList.remove('closed');
    panelOne.classList.add('closed');
  } else {
    panelTwo.classList.add('closed');
  }
});

var resetEventListeners = () => {
  var taskCompleteButtons = document.querySelectorAll('.task_complete_button')
  taskCompleteButtons.forEach(taskCompleteButton => {
    taskCompleteButton.addEventListener('click', changeCompleteValue)
  })  
}

resetEventListeners();
// setDefaultWeatherIcon();