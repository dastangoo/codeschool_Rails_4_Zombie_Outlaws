// $(document).ready(initialize);
// function initialize() {
//   var source = new EventSource('/items/events');
//   source.addEventListener('message', update);
// }
// $(document).ready(function () {
//   $('#owner_active').click(function () {
//     alert(this.checked);
//   });
// });
// function update(event) {
//   var item = $('<li>').text(event.data);
//   $('#items').append(item);
// }


function initialize() {
  $('#owner_active').click(function () {
    alert(this.checked);
  });
}

$(document).ready(initialize);
$(doucment).on('page:load', initialize);


function checkAlert() {
  alert(this.checked);
}

$(document).on('click', '#owner_active', checkAlert)