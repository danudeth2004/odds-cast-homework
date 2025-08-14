class Article < ApplicationRecord
  enum :status, [ :draft, :waiting_for_review, :published ]
end
