shared_examples_for "having class methods" do |model_class,method_names|
  # e.g.
  # it_behaves_like "having class methods", Report, [:method1, :method2]
  context model_class do
    subject { model_class }
    method_names.each do |method|
      it "should respond to #{method}" do
        should respond_to(method)
      end
    end
  end
end

shared_examples_for "having instance methods" do |model_class,method_names|
  # if model_class is a string, it tries to reference resource
  # if model_class is a class, it tests against model_class.new
  # e.g.
  # it_behaves_like "having instance methods", Report, [:method1, :method2]
  context "#{model_class} instance methods" do
    let(:model_instance) {
      if model_class.is_a?(String)
        resource
      elsif model_class.is_a?(Class)
        model_class.new
      else
        model_class
      end
    }
    subject { model_instance }
    method_names.each do |method|
      it "should respond to #{method}" do
        should respond_to(method)
      end
    end
  end
end
