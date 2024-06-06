$(function(){
  get_all_mods();
  resize_all();
  $("#translations").hide();
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

function resize_mod(id){
  height = $('.real_row').height();
  console.log(height);
  $(id).height(height);
  $(id).css('line-height', height + 'px');
  $(id).css('font-size', Math.floor(height/3) + 'px');
}

function resize_all(){
  resize_mod('#strength_mod');
  resize_mod('#dexterity_mod');
  resize_mod('#constitution_mod');
  resize_mod('#intelligence_mod');
  resize_mod('#wisdom_mod');
  resize_mod('#charisma_mod');
}

function get_all_mods(){
  get_mod('strength');
  get_mod('dexterity');
  get_mod('constitution');
  get_mod('intelligence');
  get_mod('wisdom');
  get_mod('charisma');
}