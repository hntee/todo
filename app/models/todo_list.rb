class TodoList < ActiveRecord::Base
  validates :content, presence: true
end
