# frozen_string_literal: true

module FTF
  module Records
    class Header < Base
      def identifier
        "00"
      end

      def fields
        {
          fiscal_id: data.fiscal_id,
          record_index: padding(index, 10),
          period: data.period,
          index: data.index,
          file_type: data.file_type,
          reserved_field1: padding("", 18),
          request_id: padding(data.request_id, 15),
          reserved_field2: padding("", 186)
        }
      end
    end
  end
end
