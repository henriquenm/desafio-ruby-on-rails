class TransactionsController < ApplicationController

  def new_import
    
  end

  def import
    cnab_file = params[:import_file]
    file_reader = Transaction.read_cnab(cnab_file)
  end
end