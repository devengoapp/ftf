# frozen_string_literal: true

module FTF
  module Mappings
    class Relationship
      attr_reader :holder

      def initialize(data, holder)
        @data = data
        @holder = holder
      end

      def action
        @data[:action]
      end

      def type
        @data[:type]
      end

      def created_at
        @data[:created_at]
      end

      def canceled_at
        @data[:canceled_at].to_s
      end

      def previous_type
        @data[:previous_type]
      end
    end
  end
end
