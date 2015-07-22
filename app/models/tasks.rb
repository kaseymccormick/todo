class Task < ActiveRecord::base
   has_and_belongs_to_many :users
end