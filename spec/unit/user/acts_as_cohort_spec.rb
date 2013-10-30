require "spec_helper"

class ActAsCohortTestHarness
  include Mongoid::Document
  include Cufflinks::User::ActsAsCohort
end

describe Cufflinks::User::ActsAsCohort do
  let(:harness_class) { ActAsCohortTestHarness }
  let(:resource)      { harness_class.new }

  it_behaves_like "having class methods", ActAsCohortTestHarness, [
    :current_cohort_value
  ]

  it_behaves_like "having instance methods", ActAsCohortTestHarness, [
    :cohort, :cohort=,
    :set_cohort
  ]

  describe "##current_cohort_value" do
    subject { harness_class.current_cohort_value }
    it { should eql(Time.now.utc.strftime('%Y-%m')) }
  end

  describe "#set_cohort" do
    it "should assign freshly calculated cohort value" do
      harness_class.stub(:current_cohort_value).and_return('new cohort value')
      expect { resource.set_cohort }.to change { resource.cohort }.from(nil).to('new cohort value')
    end
  end

end
