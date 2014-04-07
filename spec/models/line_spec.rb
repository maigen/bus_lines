require 'spec_helper'

describe Line do
  it { should validate_presence_of :name }
  it { should have_many :stations }
end
