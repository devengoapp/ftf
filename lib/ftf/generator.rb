# frozen_string_literal: true

require "json"
module FTF
  # Generate
  class Generator
    using Refinements

    def initialize(data)
      @report = Mappings::Report.new(data)
      @record_index = 1
      validate!
    end

    def validate! # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
      if !@report.request_id.blank? && @report.file_type != ("C")
        raise "Files generated for a request id must be complementary (type C)"
      end
      if @report.products.empty? && @report.file_type != ("N")
        raise "Files generated without product records must be negative (type N)"
      end
      if !@report.products.empty? && !%w[M C].include?(@report.file_type)
        raise "Files generated with product records must be monthly or complementary (type M or C)"
      end
      raise "Please include your fiscal_id in the data" if @report.fiscal_id.blank?
      raise "Please include your period in the data" if @report.period.blank?
      raise "Please include your file_type in the data" if @report.file_type.blank?
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

    def generate! # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      @output = File.new(filename, "w", external_encoding: Encoding::ISO8859_1)

      write_record(@report.render_header(@record_index))

      @report.products.each do |product|
        write_record(product.render(@record_index))
        product.holders.each do |holder|
          write_record(holder(holder))
          write_record(relationship(holder.relationship))
        end
        write_record(product_footer(product))
      end

      write_record(@report.render_footer(@record_index))
      @output.close
    end

    def write_record(record)
      @output.puts(record)
      @record_index += 1
    end

    def holder(holder) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      fields = {
        record_type: "20",
        action: holder.action,
        fiscal_id: @report.fiscal_id,
        record_index: @record_index.to_s.rjust(10, "0"),
        name: holder.name.to_s.ljust(178, " "),
        id_type: holder.id_type.to_s.rjust(2, "0"),
        id: holder.id.to_s.rjust(30, " "),
        expedition_country: holder.country.to_s.rjust(2, " "),
        created_at: holder.created_at.ljust(8, " "),
        nationality_country: holder.country.to_s.rjust(2, " "),
        residence_country: holder.country.to_s.rjust(2, " "),
        reserved_field: " " * 4
      }
      fields.values.join
    end

    def relationship(relationship) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      fields = {
        record_type: "30",
        action: relationship.action,
        fiscal_id: @report.fiscal_id,
        record_index: @record_index.to_s.rjust(10, "0"),
        type: relationship.type.to_s.ljust(3, " "),
        created_at: relationship.created_at.ljust(8, " "),
        canceled_at: relationship.canceled_at.ljust(8, " "),
        previous_type: relationship.previous_type.to_s.ljust(3, " "),
        reserved_field: " " * 206
      }
      fields.values.join
    end

    def product_footer(product)
      fields = {
        record_type: "19",
        fiscal_id: @report.fiscal_id,
        record_index: @record_index.to_s.rjust(10, "0"),
        type: product.type.to_s.rjust(2, "0"),
        id_type: product.id_type.to_s.rjust(2, "0"),
        id: product.id.to_s.rjust(38, " "),
        reserved_field: " " * 187
      }
      fields.values.join
    end

    def filename
      "FTF_#{@report.fiscal_id}_#{@report.period}_#{@report.index}.txt"
    end

    def self.generate!(data)
      new(data).generate!
    end
  end
end
