Mongoid::Config.connect_to("cufflinks_test")

class User
  include Mongoid::Document
  include Cufflinks::User::ActsAsCohort
end
