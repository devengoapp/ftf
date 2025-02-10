# frozen_string_literal: true

module FTF
  module Records
    class Product < Base
      def identifier
        "10"
      end

      def fields
        {
          action: data.action,
          fiscal_id: data.file.fiscal_id,
          record_index: padding(index, 10),
          type: data.type.to_s.rjust(2, "0"),
          id_type: data.id_type.to_s.rjust(2, "0"),
          id: data.id.to_s.rjust(38, " "),
          created_at: data.created_at.ljust(8, " "),
          canceled_at: data.canceled_at.to_s.ljust(8, " "),
          transfered_at: data.transfered_at.to_s.ljust(8, " "),
          transfered_entity_id: data.transfered_entity_id.to_s.ljust(20, " "),
          lease_type: data.lease_type.to_s.ljust(1, " "),
          lease_period: data.lease_period.to_s.ljust(4, " "),
          reserved_field: " " * 137
        }
      end
    end
  end
end
