class AdventureController < ApplicationController
  def combat
    @char_names = Sheet.all.pluck(:name, :id)
  end
end
