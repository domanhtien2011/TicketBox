class Category < ActiveRecord::Base
  validates_inclusion_of :name, in: ['Entertainment', 'Learning', 'Dating', 'Technology', 'Startup','Everything Else']
  validates_uniqueness_of :name
end
