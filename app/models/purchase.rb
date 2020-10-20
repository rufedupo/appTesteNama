class Purchase < ApplicationRecord
    has_one :buyer
    has_one :provider
    has_one :product
end
