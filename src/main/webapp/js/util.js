/**
 * 
 */

 function clock() {
  const date = new Date();
  let hours = date.getHours();
  let minutes = date.getMinutes();
  let seconds = date.getSeconds();
  let meridiem = "AM";

  
  if (hours > 12) {
    hours -= 12;
    meridiem = "PM";
  }

  
  hours = hours < 10 ? "0" + hours : hours;
  minutes = minutes < 10 ? "0" + minutes : minutes;
  seconds = seconds < 10 ? "0" + seconds : seconds;

  
  const time = hours + ":" + minutes + ":" + seconds + " " + meridiem;
  document.getElementById("clock").innerHTML = time;
}


setInterval(clock, 1000);