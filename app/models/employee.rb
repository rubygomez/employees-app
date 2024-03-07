class Employee < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name_name, presence: true
    validates :email, uniqueness: presence: true
    validates :phone, presence: true
    validates :title, presence: true
    validates :department_id, presence: true
    belongs_to :department
end
