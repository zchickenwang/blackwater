class ChargesController < ApplicationController

    def new
    end

    def create
      # Amount in cents
      @amount = params[:prix]

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
      
    end

    def success
      redirect_to cart_clear_path and return
end
