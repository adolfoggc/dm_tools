class Sheet < ApplicationRecord
  validates :background, :initial_class, presence: true
  before_save :initial_hp

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
    dragonborn_black: 0,
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
    tiefling: 14,
    dragonborn_blue: 15,
    dragonborn_brass: 16,
    dragonborn_bronze: 17,
    dragonborn_copper: 18,
    dragonborn_gold: 19,
    dragonborn_green: 20,
    dragonborn_red: 21,
    dragonborn_silver: 22,
    dragonborn_white: 23
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

  private
  def initial_hp
    self.hp = modifier(constitution)

    case initial_class
    when ['1', '2', '3', '5', '8', '10']
      self.hp += 8
    when ['4', '6', '7']
      self.hp += 10
    when ['9', '11']
      self.hp += 6
    else
      self.hp += 12
    end
  end
end
