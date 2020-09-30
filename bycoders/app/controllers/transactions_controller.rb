class TransactionsController < ApplicationController

  def new_import
    
  end

  def import
    cnab_file = params[:import_file]
    file_reader = CnabReader.new(cnab_file).process_file

    redirect_to stores_path
  end
end