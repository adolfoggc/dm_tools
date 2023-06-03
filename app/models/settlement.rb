class Settlement < ApplicationRecord
  before_save :generate_settlement

  enum size: {
    thorp: 1,
    hamlet: 2,
    village: 3,
    small_town: 4,
    large_town: 5,
    small_city: 6,
    large_city: 7,
    metropolis: 8
  }

  enum kind: {
    human: 0,
    elven: 1,
    half_elven: 2,
    dwarvish: 3,
    gnomish: 4,
    halfling: 5,
    half_orcish: 6,
    draconian: 7,
    tiefling: 8,
    miscegenated: 9,
    diverse: 10
  }

  def generate_settlement
    self.tap do |s|
      s.population = generate_population_size
    end
    return unless self.size_changed?
    self.description = I18n.translate('population') + ': ' + population.to_s + "\n"
    self.description += I18n.translate('guards') + ': ' +  (population/10).to_s + "\n"
  end

  def racial_distribution
    #human: 0,
    #elven: 1,
    #dwarvish: 3,
    #gnomish: 4,
    #halfling: 5,
    #half_orcish: 6,
    #draconian: 7,
    #tiefling: 8
    #total = 100
    #arithmetic_average = 12.5
    #standard_deviation = 

  end

  def generate_population_size
    case size
    when 'thorp'
      die(20, 80)
    when 'hamlet'
      die(81, 400)
    when 'village'
      die(401, 900)
    when 'small_town'
      die(901, 2000)
    when 'large_town'
      die(2001, 5000)
    when 'small_city'
      die(5001, 12000)
    when 'large_city'
      die(12001, 25000)
    when 'metropolis'
      die(25001, 50000)
    end
  end

  def guards
    percentage = die(9, 11)
    one_percent = population * 0.01
    variation = die(0, one_percent)
    add_variation = die(0,1) == 1 ? true : false
    total = percentage * (percentage / 100)

    if add_variation
      total += variation
    else
      total -= variation
    end

    total
  end

  def max_gp_amount
    case size
    when 'thorp'
      40
    when 'hamlet'
      100
    when 'village'
      200
    when 'small_town'
      800
    when 'large_town'
      3000
    when 'small_city'
      15000
    when 'large_city'
      40000
    when 'metropolis'
      100000
    end
  end

  def rulers_list
    rulers = []
    case size
    when 'thorp'
      rulers << ruler_kind(die(1,20) - 1)
    when 'hamlet'
      rulers << ruler_kind(die(1,20))
    when 'village'
      rulers << ruler_kind(die(1,20) + 1)
    when 'small_town'
      rulers << ruler_kind(die(1,20) + 2)
    when 'large_town'
      rulers << ruler_kind(die(1,20) + 3)
    when 'small_city'
      rulers << ruler_kind(die(1,20) + 4)
      rulers << ruler_kind(die(1,20) + 4)
    when 'large_city'
      rulers << ruler_kind(die(1,20) + 5)
      rulers << ruler_kind(die(1,20) + 5)
      rulers << ruler_kind(die(1,20) + 5)
    when 'metropolis'
      rulers << ruler_kind(die(1,20) + 6)
      rulers << ruler_kind(die(1,20) + 6)
      rulers << ruler_kind(die(1,20) + 6)
      rulers << ruler_kind(die(1,20) + 6)
    end

    rulers.flatten
  end

  def ruler_kind(val)
    if(val <= 13)
      percentage = die(1, 100)
      if percentage <= 5
        [I18n.translate('ordinary'), I18n.translate('monstrous')]
      else
        I18n.translate('ordinary')
      end
    elsif(val <= 18)
      I18n.translate('uncommon')
    else
      I18n.translate('magical')
    end
  end

  #fields to add
  #references to settlement_information guards
end
