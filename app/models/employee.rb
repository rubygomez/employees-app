class Employee < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness:true, presence: true
    validates :phone, presence: true
    validates :title, presence: true
    validates :department_id, presence: true
    belongs_to :department
end
