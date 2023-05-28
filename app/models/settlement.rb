class Settlement < ApplicationRecord
  before_save :generate_description

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

  def generate_description
    return unless self.size_changed?
    pop_size = generate_population_size
    self.description = I18n.translate('population') + ': ' + pop_size.to_s + "\n"
    self.description += I18n.translate('guards') + ': ' +  (pop_size/10).to_s
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
end
