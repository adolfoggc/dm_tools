$(function(){
  get_all_mods();
  $("#translations").hide();
  update_race();
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

function get_all_mods(){
  get_mod('strength');
  get_mod('dexterity');
  get_mod('constitution');
  get_mod('intelligence');
  get_mod('wisdom');
  get_mod('charisma');
}