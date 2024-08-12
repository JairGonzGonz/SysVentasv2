function updateTime() {
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    var day = now.getDate();
    var month = now.getMonth() + 1;
    var year = now.getFullYear();

    if (hours < 10) hours = '0' + hours;
    if (minutes < 10) minutes = '0' + minutes;
    if (seconds < 10) seconds = '0' + seconds;
    if (day < 10) day = '0' + day;
    if (month < 10) month = '0' + month;

    var timeString = hours + ':' + minutes + ':' + seconds;
    var dateString = day + '/' + month + '/' + year;

    document.getElementById('time').innerHTML = timeString;
    document.getElementById('date').innerHTML = dateString;
}

setInterval(updateTime, 1000);
window.onload = updateTime;
