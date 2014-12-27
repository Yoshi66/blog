module ApplicationHelper
  def test(string)
    if string =~ /[A-Z]/
      puts "string contains uppercase characters"
    end
  end
end
