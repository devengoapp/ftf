# frozen_string_literal: true

module FTF
  module Records
    class Base
      attr_reader :index, :data

      def initialize(index, data)
        @index = index
        @data = data
      end

      def identifier
        raise "Please provide a record identifier"
      end

      def padding(data, size)
        case data
        when Integer
          data.to_s.rjust(size, "0")
        else
          data.to_s.ljust(size, " ")
        end
      end

      def render
        { identifier: identifier }.merge(fields).values.join
      end
    end
  end
end
