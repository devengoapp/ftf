# frozen_string_literal: true

module FTF
  module Records
    class Product < Base
      def identifier
        "10"
      end

      def fields # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
        {
          action: data.action,
          fiscal_id: data.file.fiscal_id,
          record_index: padding(index, 10),
          type: padding(data.type, 2),
          id_type: padding(data.id_type, 2),
          id: padding(data.id, 38),
          created_at: padding(data.created_at, 8),
          canceled_at: padding(data.canceled_at, 8),
          transfered_at: padding(data.transfered_at, 8),
          transfered_entity_id: padding(data.transfered_entity_id, 20),
          lease_type: padding(data.lease_type, 1),
          lease_period: padding(data.lease_period, 4),
          reserved_field: " " * 137
        }
      end
    end
  end
end
