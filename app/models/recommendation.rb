class Recommendation < ApplicationRecord
  belongs_to :reception
  after_create { self.reception.update(open: false) }
end
