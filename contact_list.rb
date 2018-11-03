# Jace P. Gold
# November 6th, 2017

puts "--- Contact List Menu ---"

contacts = [] # Create the initial array with placeholder values


def viewContacts(contacts) # run this function to view the contacts int he array
    contacts = contacts
    count = 0
    # While count is less than the length of the elements in the contacts array
    # keep looping this while loop

    while count < contacts.length
        puts contacts[count] # Display the current element in position (count) of the contacts array
        count += 1 # Add one to the count
    end
end


def createContact # Run this function to create a contact & add it to the array
    puts "Enter contact name"
    print "> " # Add a symbol to prompt the user to enter something
    newContact = $stdin.gets.chomp # Get input from the user and store in newContact
    puts "#{newContact} added to contacts."
    return newContact # Return the value of the new contact to be saved in the array
end


def startContact(contacts) # Home menu
    contacts = contacts
    puts "\n"
    puts "1.) View All Contacts"
    puts "2.) Add new contact"
    puts "3.) Finish"
    print "> " # Add a prompt symbol for the user
    choice = $stdin.gets.chomp # Prompt the user to enter something

    if choice == '1'
        viewContacts(contacts) # If the user enters 1, call the function to view the contacts in the array
        startContact(contacts)
    elsif choice == '2'
        newContact = createContact # If the user enters 2, call the function to add a contact.
        # Save value as newContact as a string
        contacts.push(newContact) # Put the new contact at the end of the contact array
        startContact(contacts)
    elsif choice == "3" || choice = "finish" || choice == "done"
        puts "Closing Program..."
        puts "Goodbye!"
    else
        puts "Bad User Input, Please Try Again.\n" # If the user enters anything other than or 2, kill the program.
    end
end


startContact(contacts) # Start for the first time
