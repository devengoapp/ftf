# frozen_string_literal: true

module FTF
  module Refinements
    refine Object do
      def blank?
        respond_to?(:empty?) ? !!empty? : !self
      end
    end
  end
end
