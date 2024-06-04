class Sheet < ApplicationRecord

  enum alignment: {
    lg: 0,
    ln: 1,
    le: 2,
    ng: 3,
    nn: 4,
    ne: 5,
    cg: 6,
    cn: 7,
    ce: 8
  }

  enum race: {
    dragonborn: 0,
    dwarf_hill: 1,
    dwarf_mountain: 2,
    elf_drow: 3,
    elf_high: 4,
    elf_wood: 5,
    gnome_forest: 6,
    gnome_rock: 7,
    half_elf: 8,
    half_orc: 9,
    halfling_lightfoot: 10,
    halfling_stout: 11,
    human: 12,
    human_variant: 13,
    tiefling: 14
  }

  enum background: {
    acolyte: 0,
    charlatan: 1,
    criminal: 2,
    entretainer: 3,
    folk_hero: 4,
    guild_artisan: 5,
    hermit: 6,
    noble: 7,
    outlander: 8,
    sage: 9,
    sailor: 10,
    urchin: 11
  }

  enum initial_class: {
    barbarian: 0,
    bard: 1,
    cleric: 2,
    druid: 3,
    fighter: 4,
    monk: 5,
    paladin: 6,
    ranger: 7,
    rogue: 8,
    sorcerer: 9,
    warlock: 10,
    wizard: 11
  }

  def modifier(ability)
    (ability/2) - 5
  end
end
