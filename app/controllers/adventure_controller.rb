class AdventureController < ApplicationController
  def combat
    @char_names = Sheet.all.pluck(:name, :id).to_h
    @char_names2 = Sheet.all.pluck(:name, :id)
  end
end
