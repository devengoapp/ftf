# frozen_string_literal: true

module FTF
  module Records
    class Footer < Base
      def identifier
        "99"
      end

      def fields
        {
          fiscal_id: data.fiscal_id,
          record_index: padding(index, 10),
          product_count: padding(data.products.count, 10),
          total_records_count: padding(index, 10),
          reserved_field: padding("", 209)
        }
      end
    end
  end
end
