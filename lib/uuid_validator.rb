# frozen_string_literal: true

class UuidValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/i.match?(value)
      msg = options[:message] || "não é um UUID válido"
      record.errors.add(attribute, msg)
    end
  end
end
