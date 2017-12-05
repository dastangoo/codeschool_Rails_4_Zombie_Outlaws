class Comment < ApplicationRecord
  belongs_to :document, touch: true
end
