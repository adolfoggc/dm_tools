class Monster < ApplicationRecord

  def xp
    if %w[1/8 1/4 1/2 1].include?(challange_rating)
      group = challange_rating.split("/")
      value = 200 if group.size == 1
      value = 200/group[1].to_i
    else
      rating = challange_rating.to_i
      
      case rating
      when 2
        value = 450
      when 3
        value = 700 
      when 4
        value = 1100
      when 5
        value = 1800
      when 6
        value = 2300
      when 7
        value = 2900
      when 8
        value = 3900
      when 9
        value = 5000
      when 10
        value = 5900
      when 11
        value = 7200
      when 12
        value = 8400
      when 13
        value = 10000
      when 14
        value = 11500
      when 15
        value = 13000
      when 16
        value = 15000
      when 17
        value = 18000
      when 18
        value = 20000
      when 19
        value = 22000
      when 20
        value = 25000
      when 21
        value = 33000
      when 22
        value = 41000
      when 23
        value = 50000
      when 24
        value = 62000
      when 25
        value = 75000
      when 26
        value = 90000
      when 27
        value = 105000
      when 28
        value = 120000
      when 29
        value = 135000
      when 30
        value = 15500
      end
    end

    value
  end
end
