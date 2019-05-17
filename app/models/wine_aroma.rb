class WineAroma < ApplicationRecord
  belongs_to :wine
  belongs_to :aroma
end
