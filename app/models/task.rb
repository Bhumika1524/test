class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :type, class_name: 'TaskType', foreign_key: 'type_id'
  belongs_to :status, class_name: 'TaskStatus', foreign_key: 'status_id'
  belongs_to :fromUser, class_name: 'User', foreign_key: 'fromUser_id'
  belongs_to :toUser, class_name: 'User', foreign_key: 'toUser_id'
  accepts_nested_attributes_for :comments, reject_if: blank?, allow_destroy: true
end
