module Spree
  class Calculator::FreeShipping < Calculator
    def self.description
      Spree.t(:free_shipping)
    end

    def compute(object)
      if object.is_a?(Array)
        return if object.empty?
        order = object.first.order
      else
        order = object
      end
      
      (order.ship_total + ship_taxes(order))
    end

    def ship_taxes(order)
      tax_total = 0
      order.adjustments.tax.each do |adjustment|
        tax_rate = adjustment.originator
        return false unless tax_rate.tax_category && tax_rate.tax_category.is_default
        order.adjustments.shipping.each do |shipping_adjustment|
          shipping_calculator = shipping_adjustment.originator.calculator
          shipping_fee = shipping_calculator.compute(order)
          if(shipping_calculator.preferred_taxable)
            tax_amount = shipping_fee * tax_rate.amount
            if tax_rate.zone.contains? order.tax_zone
              tax_total += tax_amount
            end
          end
        end
      end
      tax_total
    end
  end
end