class Task < ActiveRecord::Base
  # layout 'landing'
  belongs_to :users
end