class TestParent < ActiveRecord::Base
  has_many :items, :class_name => "TestChild"
  accepts_nested_attributes_for :items
end