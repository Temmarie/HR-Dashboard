// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import "bootstrap/js/dist/modal";

// document.addEventListener("DOMContentLoaded", function () {
//   var completeModal = document.getElementById("completeModal");
//   if (completeModal) {
//     completeModal.addEventListener("show.bs.modal", function (event) {
//       var button = event.relatedTarget;
//       var taskId = button.getAttribute("data-task-id");
//       var modalForm = completeModal.querySelector("form");
//       modalForm.action = "/onboarding_tasks/" + taskId;
//       var taskIdInput = modalForm.querySelector("#task-id");
//       taskIdInput.value = taskId;
//     });
//   }
// });
