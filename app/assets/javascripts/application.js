// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .
//= require foundation
// $(document).foundation();
// $function(){ $(document).foundation();


var form = document.forms[0];
form.addEventListener("submit",validate,false);

function validate(event) {
  var f1 = form.elements.project_title.value;
  var f2 = form.elements.project_subtitle.value;
  var f3 = form.elements.project_description.value;
  var f4 = form.elements.project_compensation.value;
  var f5 = form.elements.project_hours_per_week.value;
  var f6 = form.elements.project_startdate.value;	
  var f7 = form.elements.project_enddate.value;
  var f8 = form.elements.project_app_deadline.value;

  if (f1 == null || f1 == "" || f2 == null || f2 == "" || f3 == null || f3 == "" || f4 == null || f4 == "" || f5 == null || f5 == "" || 
    f6 == null || f6 == "" || f7 == null || f7 == "" || f8 == null || f8 == "" ) {
    event.preventDefault();
    alert("Must fill required fields.");
  } 
}
