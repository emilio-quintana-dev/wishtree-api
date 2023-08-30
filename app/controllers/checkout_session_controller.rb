class CheckoutSessionController < ApplicationController
  def create
    session = Stripe::Checkout::Session.create(
      {
        line_items: [{
          price_data: {
            currency: "usd",
            product_data: {
              name: "Test Product",
            },
            tax_behavior: "exclusive",
            unit_amount: 1000,
          },
          quantity: 1,
        }],
        mode: "payment",
        success_url: "#{ENV['FRONTEND_DOMAIN']}/checkout?success=true",
        cancel_url: "#{ENV['FRONTEND_DOMAIN']}/checkout?canceled=true",
        automatic_tax: { enabled: true },
      },
    )

    redirect_to(session.url, allow_other_host: true)
  end
end
