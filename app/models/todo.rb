class Todo < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :content,  presence: true, length: { maximum: 500 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150 }
  validates :cost, numericality: { only_integer: true }
  validates :completed, inclusion: { in: [true, false] }
  validates_date :completion_date, on: :update
end