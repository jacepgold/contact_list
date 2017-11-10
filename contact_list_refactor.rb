# Jace P. Gold
# November 6th, 2017
# Bonus version!

contacts = [] # Create the initial array with placeholder values


def view_contacts(contacts) # run this function to view the contacts int he array
    contacts = contacts
    puts "--- View Contacts ---"
    count = 0
    # While count is less than the length of the elements in the contacts array
    # keep looping this while loop
    count = 0
    if contacts.empty?
        puts "Contact list is empty\n\n"
    else
        while count < contacts.length
            #puts contacts[count] # Display the current element in position (count) of the contacts array - Debugging
            # Set the first object in the array, which is a hash from create_contact,
            # as the value of theHash
            theHash = contacts[count]
            # puts "The hash is: #{theHash}"
            puts "\n\tContact #{count + 1}"
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
end


def create_contact # Run this function to create a contact & add it to the array
    puts "--- Create A Contact ---"
    puts "Enter contact name"
    print "> " # Add a symbol to prompt the user to enter something
    newName = $stdin.gets.strip # Get input from the user and store in new_contact
    if newName.empty?
        puts "Name is required."
        create_contact
    else
        puts "\n"
    end

    puts "Enter contact phone number"
    print "> "
    newPhone = $stdin.gets.strip
    puts "\n"

    puts "Enter contact email"
    print "> "
    newEmail = $stdin.gets.strip
    puts "\n"

    puts "Enter contact address"
    print "> "
    newAddress = $stdin.gets.strip
    puts "\n"

    # Create the hash
    new_contact = Hash["Name", newName, "Phone", newPhone, "Email", newEmail, "Address", newAddress]
    # puts new_contact # View the hash to make sure it is created properly
    return new_contact # Return the value of the new contact to be saved in the array
end


def edit_contact(contacts)
    contacts = contacts
    puts "--- Edit A Contact ---"
    puts "Which contact would you like to edit?"
    view_contacts(contacts)
    print "\n> "
    toEdit = $stdin.gets.strip
    theHash = contacts[toEdit.to_i - 1] # Store the hash from the selected position in the array
    #print "The hash is "# Make sure I have the right hash for the selected user
    #puts theHash

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
    puts "Address: #{theAddress}\n\n"

    puts "Which field would you like to edit?"
    puts "Name, Phone, Email, or Address?"
    print "> "
    choice = $stdin.gets.strip

    # make the string entered lowercase for better 
    #stability in the if statement
    choice.downcase!

    if choice.include?("name")
        puts "New name: "
        print "> "
        newName = $stdin.gets.strip
        if newName.empty?
            puts "\n\n\n\nName is required."
            edit_contact(contacts)
        else
            puts "\n"
        end
        theName = newName
        puts "\n"

    elsif choice.include?("phone")
        puts "New number: "
        print "> "
        newNumber = $stdin.gets.strip
        theNumber = newNumber
        puts "\n"

    elsif choice.include?("email")
        puts "New email: "
        print "> "
        newEmail = $stdin.gets.strip
        theEmail = newEmail
        puts "\n"

    elsif choice.include?("address")
        puts "New email: "
        print "> "
        newAddress = $stdin.gets.strip
        theAddress = newAddress
        
        puts "\n"
    else
        "Your choice does not exist. Please try again."
        edit_contact(contacts)
    end
    updatedContact = Hash["Name", theName, "Phone", theNumber, "Email", theEmail, "Address", theAddress]
    contacts.delete_at(toEdit.to_i - 1)
    puts contacts
    contacts.push(updatedContact)
    puts "\nContacted updated."
    puts updatedContact
    return updatedContact
end


def del_contact(contacts) ## Put in if statement to see if contact exists
    contacts = contacts
    puts "--- Delete A Contact ---"
    puts "Which contact would you like to delete?"
    view_contacts(contacts)
    print "> "
    toDelete = $stdin.gets.strip
    toDelete.to_i

    puts "Are you sure you want to delete this contact? (Y/N)"
    print "> "
    delete = $stdin.gets.strip
    if delete == "y" || delete == "Y"
        contacts.delete_at(toDelete.to_i)
        puts "Contact deleted."
    elsif delete == "n" || delete == "N"
        start_contact(contacts)
    else
        puts "I'm sorry, please choose (Y/N)"
        del_contact(contact) # Restart this function
    end
end

def continue
    print "Press any key to continue..."
    $stdin.gets
end

def start_contact(contacts) # Home menu
    system("clear")
    contacts = contacts
    puts "\n"
    puts "--- Contact List Menu ---"
    puts "1.) 'View' All Contacts"
    puts "2.) 'Add' new contact"
    puts "3.) 'Edit' a contact"
    puts "4.) 'Delete' a contact"
    puts "5.) 'Finish'\n\n"
    puts "Choose an option..."
    print "> " # Add a prompt symbol for the user
    choice = $stdin.gets.strip # Prompt the user to enter something
    puts "\n\n"

    # .inclued? " " - Try to see if string has "View", "Add", "Edit", "Delete", or "Finish"
    if choice == '1' || choice.include?('one') || choice.include?('view')
        view_contacts(contacts) # If the user enters 1, call the function to view the contacts in the array
        continue
        start_contact(contacts)
    elsif choice == '2' || choice.include?('two') || choice.include?('add')
        new_contact = create_contact # If the user enters 2, call the function to add a contact. 
        # Save value as new_contact as a string
        contacts.push(new_contact) # Put the new contact at the end of the contact array
        continue
        start_contact(contacts)
    elsif choice == "3" || choice.include?('three') || choice.include?('edit')
        editedContact = edit_contact(contacts)
        continue
        contacts.reject!
        contacts = editedContact
        start_contact(contacts)
    elsif choice == "4" || choice.include?('four') || choice.include?('delete') || choice.include?('remove')
        del_contact(contacts)
       continue
        start_contact(contacts)
    elsif choice == "5" || choice.include?('one') || choice.include?('view')
        puts "Closing Program..."
        puts "Goodbye!"
        exit 0
    else
        puts "Bad User Input, Please Try Again.\n" # If the user enters anything other than or 2, kill the program.
    end   
end

start_contact(contacts) # Start for the first time