require 'spec_helper'

describe "FacadeModel" do
  it "retrieves all created items by default" do
    child1 = TestChild.create(:name => "oh hai")
    child2 = TestChild.create(:name => "oh hai again")
    
    facade = FacadeModel.new(:test_child)
    facade.items.map(&:name).should =~ [child1.name, child2.name]
  end
end
