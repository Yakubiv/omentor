class Language < ApplicationRecord
    belongs_to :country

    def to_s
        name
    end
end
