# Encapsulates cohort support for Users model
module Cufflinks::User::ActsAsCohort
  extend ActiveSupport::Concern

  included do
    # Returns the cohort grouping
    field :cohort, type: String
    attr_accessible :cohort
  end

  module ClassMethods

    # Returns a freshly calculated cohort value
    def current_cohort_value
      Time.now.utc.strftime('%Y-%m')
    end

  end

  # Command: sets the cohort
  def set_cohort
    self.cohort ||= self.class.current_cohort_value
  end


end
