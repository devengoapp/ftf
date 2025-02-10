# frozen_string_literal: true

module FTF
  module Mappings
    class Report
      attr_reader :products

      def initialize(data)
        @data = parse(data)
        @products = @data[:products].map { |product| Product.new(product, self) }
      end

      def parse(data)
        case data
        when Hash
          data
        when String
          JSON.parse(data, symbolize_names: true)
        else
          raise "Please provide a JSON string to parse or a symbol-keyed hash"
        end
      end

      def render_header(index)
        Records::Header.new(index, self).render
      end

      def render_footer(index)
        Records::Footer.new(index, self).render
      end

      def fiscal_id
        @data[:fiscal_id]
      end

      def period
        @data[:period]
      end

      def file_type
        @data[:file_type]
      end

      def request_id
        @data[:request_id]
      end

      def index
        index = @data[:index] || 1
        index.to_s.rjust(3, "0")
      end
    end
  end
end
