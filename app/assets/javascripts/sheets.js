$(function(){
  get_all_mods();
  $("#translations").hide();
  update_race();
  update_class();
  update_background_skills();
})

function get_mod(id){
  val = $('#sheet_' + id).val();
  mod = modifier(val)
  $('#'+ id + '_mod').html(mod);
}

function modifier(ability){
  mod = (Math.floor((ability/2) - 5)).toString();
  if(mod.length == 1 && mod.substring(0) != "0"){
    mod = '+' + mod;
  }

  return mod;
}

function update_race(){
  val = $('#sheet_race').val();
  msg = $('#race_modifier_' + val).html()
  $('#race_modifiers').html(msg)
}

function update_class(){
  val = $('#sheet_initial_class').val();
  msg = $('#hit_die').html()
  
  if(['1', '2', '3', '5', '8', '10'].includes(val)){
    msg += 'd8';
  } else if(['4', '6', '7'].includes(val)){
    msg += 'd10';
  } else if(['9', '11'].includes(val)){
    msg += 'd6';
  } else {
    msg += 'd12';
  }

  $('#class_modifiers').html(msg)
}

function update_background_skills(){
  val = $('#sheet_background').val();
  msg = $('#background_' + val).html()
  $('#background_modifiers').html(msg)
}

function get_all_mods(){
  get_mod('strength');
  get_mod('dexterity');
  get_mod('constitution');
  get_mod('intelligence');
  get_mod('wisdom');
  get_mod('charisma');
}