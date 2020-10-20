class Purchase < ApplicationRecord
    belongs_to :buyer
    belongs_to :provider
    belongs_to :product
end
