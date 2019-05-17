class WineTastingTerm < ApplicationRecord
  belongs_to :wine
  belongs_to :tasting_term
end
