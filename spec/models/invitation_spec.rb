require 'spec_helper'
#require 'shared_examples'
#include_examples "tokenable"

describe Invitation do
  it { should validate_presence_of(:recipient_name) }
  it { should validate_presence_of(:recipient_email) }
  it { should validate_presence_of(:messages) }
  
  shared_examples_for "tokenable" do
  it_behaves_like "tokenable" do
    let(:object) { Fabricate(:invitation) }
  end
  end
end