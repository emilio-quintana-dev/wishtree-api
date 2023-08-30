class CheckoutSessionController < ApplicationController
  require "stripe"

  FRONTEND_DOMAIN = "http://localhost:3000/checkout"

  def create
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

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
        success_url: FRONTEND_DOMAIN + "?success=true",
        cancel_url: FRONTEND_DOMAIN + "?canceled=true",
        automatic_tax: { enabled: true },
      },
    )

    redirect_to(session.url, allow_other_host: true)
  end
end
