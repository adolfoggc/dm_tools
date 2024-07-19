$(function(){
  stop_round();
})

function start_round(){
  $("#start-round").hide();
  $("#add-initiative").hide();
  $("#combat-initiative").show();
  $("#stop-round").show();
}

function stop_round(){
  $("#start-round").show();
  $("#add-initiative").show();
  $("#combat-initiative").hide();
  $("#stop-round").hide();
}