class Task < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6 }
    belongs_to :user

end
