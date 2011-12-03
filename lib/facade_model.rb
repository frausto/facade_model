class FacadeModel < ActiveRecord::Base
  self.abstract_class = true
  def self.columns; @columns ||= []; end
  has_many :items, :class_name => @association
  accepts_nested_attributes_for :items
  
  def initialize(association)
    @association = association.to_s
  end
  
  def save
    items.all?(&:save)
  end
  
  def items
    @items ||= @association.classify.constantize.all
  end
end