class StoresController < ApplicationController
  before_action :find_store, only: :show

  def index
    @stores = Store.all
  end

  def show
    @transactions = @store.transactions
  end

  private

    def find_store
      @store = Store.find(params[:id]) if params[:id]
    end
end