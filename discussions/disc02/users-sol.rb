class Person
  attr_accessor :id, :first_name, :last_name, :phone, :email

  # Add an initializer to create a person using id, name, phone, and email
  def initialize(id,fname,lname,phone,email)
    @id = id
    @first_name = fname
    @last_name = lname
    @phone = phone
    @email = email
  end
end

class Users
  attr_accessor :users, :corrupted

  # Add initializer to store all users and the id of all corrupted users
  def initialize
    @users = Hash.new
    @corrupted = Array.new
  end

  # Parse the file to find all valid and corrupted users
  def load(file)
    File.foreach(file) do |line|
      user = line.split(',')
      valid = true

      # Match id
      if user[0] =~ /\d+/ then
        id = user[0].to_i
      else
        valid = false
      end

      # Match Name
      if user[1] =~ /([a-zA-Z]+) ([a-zA-Z]+)/ then
        fname = $1
        lname = $2
      else
        valid = false
      end

      # Match Phone
      if user[2] =~ /(\d{3}) (\d{3}) (\d{4})/ then
        phone = "(#{$1}) #{$2}-#{$3}"
      else
        valid = false
      end

      # Match Email
      if user[3] =~ /\w{3,}@\w{3,}\.[a-zA-Z]{2,}/ then
        email = user[3].chomp
      else
        valid = false
      end

      # Add to Data Structure
      if valid then
        @users[id] = Person.new(id,fname,lname,phone,email)
      else
        @corrupted << id
      end
    end
    return true
  end

end
