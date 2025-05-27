# validations, database, and any custom logic.
class Brand < ApplicationRecord
    validates :name, presence: true
    validates :slug, presence: true, uniqueness: true
    validates :logo_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
    validates :description, length: { maximum: 500 }
end
