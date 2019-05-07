
#This .pdf file query list starts out with 5 hard-coded entries that I made, then the user can input up to 100 more entries through questions about their characterisitcs, the queries gets saved to a .pdf file (using prawn gem) to view all of the person's attributes, addresses and occupation.

#This Project is a work in progress and will not look this later down the road

#After the PDF is created, an input is asked if the user would like to send this pdf to their email. Purpose of this program is to demonstrate making a pdf file using a simple understanding of classes, with some information about peoples characteristics, addresses and occupations and giving the user the option to send it to a email of their choosing.

require "Prawn" #Prawn gem module.
require 'mail' #Mail gem module.

$VERBOSE = nil #Free my class variables from their chains

class Generalization 
  
  $pdf = Prawn::Document.new
  $pdf.font "Courier"
  $pdf.text "**** PDF QUERY LIST ****\n\n", :align => :center , :size => 15
  
  def initialize(input, input_2, input_3, input_4, input_5)
    @@input = input
    @@input_2 = input_2
    @@input_3 = input_3
    @@input_4 = input_4
    @@input_5 = input_5
        
  end
  puts "Would you like to make a PDF Query List? 'Yes' or 'No'?"
  $data = gets.chomp
  $data.downcase!
  
  if $data == "no"
    puts "Bye!"
    Kernel.exit
  end
  
  if $data == "yes"
   #For the first input array.
    puts "What is your First Name?\n"
    @input = gets.to_s.chomp
    @input.capitalize!
   
    puts "What is your Last Name?\n"
    @input_2 = gets.to_s.chomp
    @input_2.capitalize!

    puts "What is your Gender?\n"
    @input_3 = gets.to_s.chomp
    @input_3.capitalize!
    
    puts "What is your Height?\n"
    @input_4 = gets.to_s.chomp

    puts "What is your Eye Color?\n"
    @input_5 = gets.to_s.chomp
    @input_5.capitalize!
    ##
    
    #For the second input array.
    puts "What is your Address?\n"
    @input_6 = gets.to_s.chomp
    
    puts "What is your City?\n"
    @input_7 = gets.to_s.chomp
    @input_7.capitalize!
    
    puts "What is your State?(Two Letters)\n"
    @input_8 = gets.to_s.chomp
    @input_8.upcase!
    ##
    
    #For the third input array.
    puts "What is your Occupation?\n"
    @input_9 = gets.to_s.chomp
    @input_9.capitalize!
    ##
    
    puts "What is your Workplace Address?\n"
    @input_10 = gets.to_s.chomp
    @input_10.capitalize!
    
    #These input arrays populate the pdf in the different classes they are being assigned to.
    @@input_array = [@input,@input_2,@input_3,@input_4,@input_5].join(' , ')
    @@input_array_2 =[@input_6,@input_7,@input_8].join(' , ')
    @@input_array_3 = [@input_9,@input_10]
 
  else
    puts "Invalid Answer. Launch the program again."
    Kernel.exit
    end
    
    def self.user_input
      return @@input_array
    end
    
    def self.user_input_2
      return @@input_array_2
    end
    
    def self.user_input_3
      return @@input_array_3
    end
end


#Household Class.
class Household < Generalization
  
    @@people_count = 0
    $pdf.text "** PEOPLE **", :align => :left
    $pdf.text "(First Name , Last Name, Gender, Height, Eye Color)", :align => :left
    
    def initialize(first_name , last_name , gender , height , eyecolor)
      
        @first_name = first_name
        @last_name = last_name
        @gender = gender
        @height = height
        @eyecolor = eyecolor        
        @@people_count += 1
      
        @boundary = "\nPerson: ----------------"
        puts @boundary
        
        @person_array = [first_name, last_name ,gender, height, eyecolor].join(' , ')
        puts @person_array

                
        $pdf.font "Courier"
        $pdf.text "#{@boundary}", :align => :left
        $pdf.text "#{@person_array}\n" , :align => :left

    end
    
    def self.number_of_people
      return @@people_count  
    end 
end
    #Hard coded a few entries to populate the Class with some preset values. Person 1 - 5.
    $first_person = Household.new("John","Preston","Male","6'3","Brown")
    $second_person = Household.new("Michelle","Rivers","Female","5'1","Emerald")
    $third_person = Household.new("Rockland","Smith","Male","5'6","Brown")
    $fourth_person = Household.new("Susan","Hecter","Female","5'1","Brown")
    $fifth_person = Household.new("Kayla","Anderson","Female","5'2","Blue")
    $sixth_person = Household.new(Generalization.user_input,"","","","")
   
    
    for a in 1..1000
      puts "\nWant more 'Person' user entries? 'Yes' or 'No'?"
      @user_retrieval = gets.chomp
      @user_retrieval.downcase!
      break if @user_retrieval == "no"
      
      if @user_retrieval == "yes"
        
        puts "What is your First Name?\n"
        @input = gets.to_s.chomp
        @input.capitalize!
   
        puts "What is your Last Name?\n"
        @input_2 = gets.to_s.chomp
        @input_2.capitalize!

        puts "What is your Gender?\n"
        @input_3 = gets.to_s.chomp
    
        puts "What is your Height?\n"
        @input_4 = gets.to_s.chomp
        @input_4.capitalize!

        puts "What is your Eye Color?\n"
        @input_5 = gets.to_s.chomp
        @input_5.capitalize!  
        @@input_array = [@input,@input_2,@input_3,@input_4,@input_5].join(' , ')
        
        @@additional_person = Household.new(Generalization.user_input,"","","","")
      
      else
        puts "Invalid Answer."
      end
    end
      
    @current_time = Time.now
    puts "File was accessed on #{@current_time}"
    
    def self.household_person
      return @@additional_person
    end
    
#Address Class. 
class Address < Generalization
  
    @@address_count = 0
    $pdf.text "\n\n** ADDRESSES **", :align => :right
    $pdf.text "(Address, City, State)", :align => :right
    
    def initialize(address, city, state)
        @address = address
        @city = city
        @state = state
        @@address_count += 1
        
        @boundary_2 = "\nAddress: ----------------"
        puts @boundary_2
      
        @area_array = [address,city,state].join(' , ')
        puts @area_array 
     
          
        $pdf.font "Courier"
        $pdf.text "#{@boundary_2}", :align => :right
        $pdf.text "#{@area_array}\n", :align => :right
       
    end
    
    def self.number_of_addresses
        return @@address_count     
    end
end 
    #Hard coded a few entries to populate the Class with some preset values. Person 1 - 5.
    $first_person_2 = Address.new("1558 East 19th","Brooklyn","NY")
    $second_person_2 = Address.new("65 Court Street", "Los Angeles", "CA")
    $third_person_2 = Address.new("North Avenue","Jersey City","NJ")
    $fourth_person_2 = Address.new("800 Lisa Ln","Austin","TX")
    $fifth_person_2 = Address.new("7542 Ave South","Bronx","NY")
    @sixth_person_2 = Address.new(Generalization.user_input_2,"","")
    
    
    for b in 1..1000
      puts "\nWant more 'Addresses' user entries? 'Yes' or 'No'?"
      @user_retrieval = gets.chomp
      @user_retrieval.downcase!
      break if @user_retrieval == "no"
    
      #For the second input array.
      if @user_retrieval == "yes"
        puts "What is your Address?\n"
        @input_6 = gets.to_s.chomp
    
        puts "What is your City?\n"
        @input_7 = gets.to_s.chomp
        @input_7.capitalize!
    
        puts "What is your State?(Two Letters)\n"
        @input_8 = gets.to_s.chomp
        @input_8.upcase!
  
        @@input_array_2 =[@input_6,@input_7,@input_8].join(' , ') 
        @@additional_person_2 = Address.new(Generalization.user_input_2,"","")
        
      else
        puts "Invalid Answer. Try again."
      end
    end
    
    @current_time = Time.now
    puts "File was accessed at #{@current_time}"
    
     
#Occupation Class.
class Occupation < Generalization
  
  @@occupation_count = 0
  $pdf.text "\n\n** OCCUPATION **", :align => :left
  $pdf.text "(Jobs, Workplace Address)", :align => :left
  
  def initialize(jobs, workplace_address)
    @jobs = jobs
    @workplace_address = workplace_address
    @@occupation_count += 1
    
    @boundary_3 = "\nOccupation: ----------------" 
    puts @boundary_3
   
    @jobs_array = [ jobs , workplace_address ].join(' , ')
    puts @jobs_array
       
    $pdf.font "Courier"
    $pdf.text "#{@boundary_3}", :align => :left
    $pdf.text "#{@jobs_array}\n", :align => :left
    
end
  
  def self.number_of_occupation
     return @@occupation_count
  end
  
end

  #Hard coded a few entries to populate the Class with some preset values. Person 1 - 5.
  $first_person_3 = Occupation.new("Student","900 Court St")
  $second_person_3 = Occupation.new("Art Teacher","Groughon Avenue")
  $third_person_3 = Occupation.new("Real Estate Broker","3301 122nd Street")
  $fourth_person_3 = Occupation.new("Nursing Home Coordinator", "Home-Employed")
  $fifth_person_3 = Occupation.new("Student","Queens College")
  $sixth_person_3 = Occupation.new(Generalization.user_input_3,"")
  
  
  for c in 1..1000
     puts "\nWant more 'Occupation' user entries? 'Yes' or 'No'?"
     @user_retrieval = gets.chomp
     @user_retrieval.downcase!
     break if @user_retrieval == "no"
     
     if @user_retrieval == "yes"
       puts "What is your Occupation?\n"
       @input_9 = gets.to_s.chomp
       @input_9.capitalize!
       
       puts "What is your Workplace Address?\n"
       @input_10 = gets.to_s.chomp
       @input_10.capitalize!
       
       @@input_array_3 = [@input_9,@input_10]
       @@additional_person_3 = Occupation.new(Generalization.user_input_3,"")
       
     else
       puts "Invalid Answer. Try again."
     end
   end
  
  #Increments how many people, addresses, and occupations are and prints it to the terminal.
  puts "Number of People are: #{Household.number_of_people}\n\n"
  puts "Number of Addresses are: #{Address.number_of_addresses}\n\n"
  puts "Number of Occupations are: #{Occupation.number_of_occupation}\n\n"
  
  @current_time = Time.now
  puts "File was accessed at #{@current_time}\n\n"
  
  #Increments how many people, addresses, and occupations are and prints it on the pdf.
  $pdf.text "\n\n", :align => :center
  $pdf.text "Number of People are: #{Household.number_of_people}\n\n", :align => :center
  $pdf.text "Number of Addresses are: #{Address.number_of_addresses}\n\n", :align => :center
  $pdf.text "Number of Occupations are: #{Occupation.number_of_occupation}\n\n", :align => :center
  $pdf.text "This PDF was generated on #{@current_time}", :align => :center
  
  #Render the name of the pdf file you want it saved under as. I saved it as 'explicit.pdf'.
  $pdf.render_file "explicit.pdf"
  
  puts "Would you like to send this PDF to an email? 'Yes' or 'No'?"
  $email_input = gets.chomp
  $email_input.downcase!
  
  if $email_input == 'no'
      puts "Bye!"
      Kernel.exit
    end
  
  if $email_input == 'yes'
    puts "Which email would you like to send it to? Example format: 'your-email@email.com'."
    $email_sending = gets.chomp
    
    #If you want to send an automated email through this project, you have to turn on IMAP and POP server access through Gmail settings. This allows access of your gmail account to send out emails through this project to other emails when the program stops running.
    $options_email = {
      :address    => "smtp.gmail.com",
      :port       => 587, #THE SMTP localhost port that Gmail is on.
      :domain     => 'gmail.com',
      :user_name  => 'youremail@gmail.com', ##Your gmail username!
      :password   => 'yourpassword', ##Your gmail password!
      :authentication => 'plain',
      :enable_starttls_auto => true
       }
  
    #Sets your email account default configurations of SMTP.
    Mail.defaults do
      delivery_method :smtp, $options_email
    end
  
    #This is where you specify attachments, if you want to send any, to other emails. The 'from' is your email and the 'to' is the email you are going to send to. 
    Mail.deliver do
      from 'youremail@gmail.com'
      to "#{$email_sending}"
      subject 'This is a test email'
      body    'body'
      add_file :filename => 'explicit.pdf', :content => File.read('explicit.pdf') #You can change the name of the .pdf in the render_file
    end   
end
