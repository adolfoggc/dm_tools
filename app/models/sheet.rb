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
    dwarf: 1,
    elf: 2,
    half_elf: 3,
    human: 4,
    half_orc: 5,
    halfling: 6,
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

  def modifier(ability)
    (ability/2) - 5
  end
end
