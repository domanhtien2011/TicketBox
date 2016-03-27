class AddTicketTypeIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :ticket_type, :integer
  end
end
