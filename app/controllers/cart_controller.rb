class CartController < ApplicationController

  def add
    puts params[:sizing]
    @thissize = Rails.cache.write("thissize", params[:sizing])
    id = params[:id]
        if session[:cart] then
            cart = session[:cart]
        else
            session[:cart] = {}
            cart = session[:cart]
        end
        if cart[id] then
            cart[id] += 1
        else
            cart[id] = 1
        end
        redirect_to :action => :index
    end

  def clearCart
    session[:cart] = nil
    redirect_to products_path
  end

  def index
    @thissize = Rails.cache.read("thissize")
    if session[:cart] then
        @cart = session[:cart]
    else
        @cart = {}
    end
  end

end
