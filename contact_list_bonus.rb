# Jace P. Gold
# November 6th, 2017
# Bonus version!

puts "--- Contact List Menu ---"

contacts = [] # Create the initial array with placeholder values


def view_contacts(contacts) # run this function to view the contacts int he array
    contacts = contacts
    count = 0
    # While count is less than the length of the elements in the contacts array
    # keep looping this while loop
    count = 0
    while count < contacts.length
        #puts contacts[count] # Display the current element in position (count) of the contacts array - Debugging
        # Set the first object in the array, which is a hash from create_contact,
        # as the value of theHash
        theHash = contacts[count]
        # puts "The hash is: #{theHash}"
        puts "\n\tContact #{count}"
        # Select the Hash pair using the method getHash targeting the "Name" pair
        theName = theHash["Name"]
        puts "Name: #{theName}"

        # Select the Hash pair using the method getHash targeting the "Phone" pair
        theNumber = theHash["Phone"]
        puts "Phone: #{theNumber}"

        # Select the Hash pair using the method getHash targeting the "Email" pair
        theEmail = theHash["Email"]
        puts "Email: #{theEmail}"

        # Select the Hash pair using the method getHash targeting the "Address"
        theAddress = theHash["Address"]
        puts "Address: #{theAddress}"

        count += 1 # Add one to the count
    end
end


def create_contact # Run this function to create a contact & add it to the array
    puts "Enter contact name"
    print "> " # Add a symbol to prompt the user to enter something
    newName = $stdin.gets.chomp # Get input from the user and store in new_contact

    puts "Enter contact phone number"
    print "> "
    newPhone = $stdin.gets.chomp

    puts "Enter contact email"
    print "> "
    newEmail = $stdin.gets.chomp

    puts "Enter contact address"
    print "> "
    newAddress = $stdin.gets.chomp

    # Create the hash
    new_contact = Hash["Name", newName, "Phone", newPhone, "Email", newEmail, "Address", newAddress]
    # puts new_contact # View the hash to make sure it is created properly
    return new_contact # Return the value of the new contact to be saved in the array
end


def edit_contact(contacts)
    contacts = contacts

    puts "Which contact would you like to edit?"
    view_contacts(contacts)
    print "> "
    toEdit = $stdin.gets.chomp

    theHash = contacts[toEdit.to_i] # Store the hash from the selected position in the array
    print "The hash is "# Make sure I have the right hash for the selected user
    puts theHash
    
    # Select the Hash pair using the method getHash targeting the "Name" pair
    theName = theHash["Name"]
    puts "Name: #{theName}"

    # Select the Hash pair using the method getHash targeting the "Phone" pair
    theNumber = theHash["Phone"]
    puts "Phone: #{theNumber}"

    # Select the Hash pair using the method getHash targeting the "Email" pair
    theEmail = theHash["Email"]
    puts "Email: #{theEmail}"

    # Select the Hash pair using the method getHash targeting the "Address"
    theAddress = theHash["Address"]
    puts "Address: #{theAddress}"

    puts "Which field would you like to edit?"
    puts "Name, Phone, Email, or Address?"
    print "> "
    choice = $stdin.gets.chomp

    # make the string entered lowercase for better 
    #stability in the if statement
    choice.downcase!

    if choice == "name"
        puts "New name: "
        print "> "
        newName = $stdin.gets.chomp
        theName = newName
    elsif choice == "phone"
        puts "New number: "
        print "> "
        newNumber = $stdin.gets.chomp
        theNumber = newNumber
    elsif choice == "email"
        puts "New email: "
        print "> "
        newEmail = $stdin.gets.chomp
        theEmail = newEmail
    elsif choice == "address"
        puts "New email: "
        print "> "
        newAddress = $stdin.gets.chomp
        theAddress = newAddress
    else
        "Your choice does not exist. Please try again."
        edit_contact(contacts)
    end
    updatedContact = Hash["Name", theName, "Phone", theNumber, "Email", theEmail, "Address", theAddress]
    puts "\nContacted updated."
    return updatedContact
end


def del_ontact(contacts) ## Put in if statement to see if contact exists
    contacts = contacts
    puts "Which contact would you like to delete?"
    view_contacts(contacts)
    print "> "
    toDelete = $stdin.gets.chomp
    toDelete.to_i

    # If contact is real, delete
    #if toDelete <

    puts "Are you sure you want to delete this contact? (Y/N)"
    print "> "
    delete = $stdin.gets.chomp
    if delete == "y" || delete == "Y"
        contacts.delete_at(toDelete.to_i)
        puts "Contact deleted."
    elsif delete == "n" || delete == "N"
        start_contact(contacts)
    else
        puts "I'm sorry, please choose (Y/N)"
        del_contact(contact) # Restart this function
    end
   # else
        # If contact is not real, alert that it's not real
     #   puts "Error: Contact does not exist. There are only " + contacts.length + " Contacts to choose from."
      #  del_contact
    #end
end

def start_contact(contacts) # Home menu
    contacts = contacts
    puts "\n"
    puts "1.) 'View' All Contacts"
    puts "2.) 'Add' a new contact"
    puts "3.) 'Edit' a contact"
    puts "4.) 'Delete' a contact"
    puts "5.) 'Finish' to exit"
    print "> " # Add a prompt symbol for the user
    choice = $stdin.gets.chomp # Prompt the user to enter something
    choice.downcase!

    if choice == '1'
        view_contacts(contacts) # If the user enters 1, call the function to view the contacts in the array
        start_contact(contacts)
    elsif choice == '2' || choice == 'add'
        new_contact = create_contact # If the user enters 2, call the function to add a contact. 
        # Save value as new_contact as a string
        contacts.push(new_contact) # Put the new contact at the end of the contact array
        start_contact(contacts)
    elsif choice == "3" || choice == 'edit'
        editedContact = edit_contact(contacts)
        contacts.push(editedContact)
        start_contact(contacts)
    elsif choice == "4" || choice == 'delete' || choice == 'remove'
        del_contact(contacts)
        start_contact(contacts)
    elsif choice == "5" || choice = "finish" || choice == "done"
        puts "Closing Program..."
        puts "Goodbye!"
        exit 0
    else
        puts "Bad User Input, Please Try Again.\n" # If the user enters anything other than or 2, kill the program.
    end   
end


start_contact(contacts) # Start for the first time