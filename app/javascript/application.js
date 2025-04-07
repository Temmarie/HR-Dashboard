// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "bootstrap";

document.addEventListener("DOMContentLoaded", () => {
  const completeModal = document.getElementById("completeModal");
  completeModal.addEventListener("show.bs.modal", (event) => {
    const button = event.relatedTarget;
    const taskId = button.getAttribute("data-task-id");
    const form = document.getElementById("completeTaskForm");
    form.setAttribute("action", `/onboarding_tasks/${taskId}`);
  });
});

var completeModal = document.getElementById("completeModal");
completeModal.addEventListener("show.bs.modal", function (event) {
  var button = event.relatedTarget;
  var taskId = button.getAttribute("data-task-id");
  var form = completeModal.querySelector("form");
  form.action = "/onboarding_tasks/" + taskId;
  document.getElementById("taskId").value = taskId;
});
