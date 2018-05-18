class Assistant < ApplicationRecord
  require 'csv'

  def self.to_csv
    attributes = %w{reservation_code name last_name email notes pay_method ticket_quantity reservation_date attended}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |assistant|
        csv << attributes.map{ |attr| assistant.send(attr) }
      end
    end
  end
end
