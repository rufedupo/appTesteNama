class PurchasesController < ApplicationController
    def index
        @purchases = Purchase.all

        @purchaseTotal = 0.00

        @purchases.each do |purchase|
            total = purchase.quantity * purchase.product.price
            @purchaseTotal += total
        end
    end
end
