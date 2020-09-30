module ApplicationHelper

  def display_currency(value)
    number_to_currency(value, unit: "R$", separator: ",", delimiter: ".")
  end
end
