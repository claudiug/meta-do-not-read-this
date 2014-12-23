class Greeting
  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end

obj = Greeting.new('foo')
puts obj.class
puts obj.class.instance_methods(false)
puts obj.class.instance_variables
