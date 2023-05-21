class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def die(min, max)
    Random.new.rand(min..max)
  end
end
