class UploadsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def import
        errors = []

        file = params["txt"].tempfile.path
        
        File.open(file).each do |row|
            begin
                row = row.split("\t")

                next if row[0] == "Comprador"

                buyerName = row[0].strip rescue row[0]
                productDescription = row[1].strip rescue row[1]
                productPrice = row[2].strip rescue row[2]
                purchaseQuantity = row[3].strip rescue row[3]
                providerAddress = row[4].strip rescue row[4]
                providerName = row[5].strip rescue row[5]

                buyer = Buyer.find_by(name: buyerName)

                if buyer.nil?
                    buyer = Buyer.create(name: buyerName)
                end

                provider = Provider.find_by(name: providerName)

                if provider.nil?
                    provider = Provider.create(name: providerName, address: providerAddress) 
                end

                product = Product.find_by(description: productDescription)
                
                if product.nil?
                    product = Product.create(description: productDescription, price: productPrice.to_f) 
                end

                Purchase.create(buyer: buyer, provider: provider, product: product, quantity: purchaseQuantity.to_i)
            rescue Exception => err 
                errors << err.message
            end
        end

        if errors.blank?
            flash[:success] = "Importado com sucesso"
        else
            flash[:error] = errors.join(", ")
        end

        redirect_to root_path
    end
end
