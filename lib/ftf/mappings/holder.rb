# frozen_string_literal: true

module FTF
  module Mappings
    class Holder
      attr_reader :product, :relationship

      def initialize(data, product)
        @data = data
        @product = product
        @relationship = Relationship.new(@data[:relationship], self)
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
