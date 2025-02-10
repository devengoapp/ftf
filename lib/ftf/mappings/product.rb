# frozen_string_literal: true

module FTF
  module Mappings
    class Product
      attr_reader :file, :holders

      def initialize(data, file)
        @data = data
        @file = file
        @holders = @data[:holders].map { |holder| Holder.new(holder, self) }
      end

      def render(index)
        Records::Product.new(index, self).render
      end

      def action
        @data[:action]
      end

      def type
        @data[:type]
      end

      def id_type
        @data[:id_type]
      end

      def id
        @data[:id]
      end

      def created_at
        @data[:created_at]
      end

      def canceled_at
        @data[:canceled_at]
      end

      def transfered_at
        @data[:transfered_at]
      end

      def transfered_entity_id
        @data[:transfered_entity_id]
      end

      def lease_type
        @data[:lease_type]
      end

      def lease_period
        @data[:lease_period]
      end
    end
  end
end
