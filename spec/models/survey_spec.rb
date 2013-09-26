require 'spec_helper'
describe Survey do
  it { should have_many(:questions) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

end
