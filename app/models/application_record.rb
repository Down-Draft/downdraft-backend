class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  class << self
    def hot
      ['%Lager%', '%Pilsners%', '%Pale Lagers%', '%Sour%', '%Kolsch%', '%Summer%',
       '%Table%', '%Ice%', '%Tropical%']
    end

    def warm
      ['%German Pilsner%', '%Blonde Ale%', '%Cream Ale%', '%Weissbeir%', '%Weizen%',
       '%Weisse%', '%Wheat%', '%Belgian Wit%', '%Hefeweizen%', '%Red%', '%Amber%', '%IPA%',
       '%India Pale Ale%', '%Marzen%', '%American Pale Ale%', '%Gose%', '%Trippel%', '%Fruit%']
    end

    def cool
      ['%English Pale Ale%', '%Scotch Ale%', '%Scottish%', '%Belgian Ale%', '%Porter%',
       '%Brown Ale%', '%Bitter%', '%Altbier%', '%Pumpkin%']
    end

    def cold
      ['%Stout%', '%Dopplebock%', '%Barelywines Dubble%', '%Barrel-Aged%', '%Winter%',
       '%Chocolate%', '%Quadrupel%']
    end
  end
end
