require 'spec_helper'

describe Business do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:region) }
  it { should validate_presence_of(:country) }
end