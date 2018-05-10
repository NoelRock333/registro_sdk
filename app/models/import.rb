class Import < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      @row_hash = row.to_hash
      if @row_hash['Estado del pago'] == 'Pagada'
        @assistent = [
          :reservation_code => @row_hash['Código de la reservación'],
          :name => @row_hash['Nombres'],
          :last_name => @row_hash['Apellidos'],
          :email => @row_hash['Correo electrónico'],
          :payment_status => @row_hash['Estado del pago'],
          :pay_method => @row_hash['Forma de pago'],
          :tiket_quantity => @row_hash['Número de boletos'],
          :reservation_date => @row_hash['Fecha de creación dd/mm/aaaa']
        ]
        puts @assistent
      end
      #Assistant.create()
      #Import.create! row.to_hash
    end
  end
end
