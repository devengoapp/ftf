# frozen_string_literal: true

module FTF
  module Mappings
    class Holder
      attr_reader :product, :relationships

      def initialize(data, product)
        @data = data
        @product = product
        @relationships = @data[:relationships].map { |relationship| Relationship.new(relationship, self) }
      end

      def action
        @data[:action]
      end

      def name
        @data[:name]
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

      def country
        @data[:country]
      end
    end
  end
end
