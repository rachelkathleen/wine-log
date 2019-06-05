class ContentTypeValidator < ActiveModel::EachValidator
  #enables file type validations for active record
  def validate_each(record, attribute, value)
    return unless value.attached?
    return if value.content_type.in?(content_types)

    value.purge
    record.errors.add(attribute, :content_type, options)
  end

  private

  def content_types
    options.fetch(:in)
  end
end
