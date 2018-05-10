class Import < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      @row_hash = row.to_hash
      if @row_hash['Estatus del pago'] == 'Pagada'
        @assistent = [
          :reservation_code => @row_hash['Número de reservación'],
          :name => @row_hash['Nombres'],
          :last_name => @row_hash['Apellidos'],
          :email => @row_hash['Correo electrónico'],
          # :pay_method => @row_hash['Forma de pago'],
          # :ticket_quantity => @row_hash['Número de boletos'],
          :reservation_date => @row_hash['Fecha de reservación']
        ]
        Assistant.create! @assistent
      end
    end
  end
end
