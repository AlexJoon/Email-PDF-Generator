# Email-PDF-Generator

Ruby User Input Program that inputs in a person's information from their personal information, occupation and address.

The program then takes that data and sorts it into different categories based on: Personal, Household, Address & Occupation.

The inputs are saved onto a .pdf file for the User to see the data and the sorting of the categories. The program is able to create the .pdf by a ruby gem called 'prawn'. Prawn allows a ruby program to create a .pdf file and allows the developer to format, stylize, and sort data based on user data input.

The .pdf file is always initially created when the User has first run the program. Once the sorting of the data onto the .pdf file is done (when User declines to enter more data) it is then saved onto that .pdf file. Saving their input and that .pdf file is entirely optional based on another User Input. If they decline not to save it, the program exits.

On the bottom of each .pdf file, there is a count of how many persons, households, addresses & occupations there are along with the real-time and date of when the .pdf was created.

If the User decides to save that .pdf file that contains their new person data via input, the program will prompt to the User if they would like to send this .pdf to an email address.

The email sending is done by a ruby gem called 'mail', which allows a program to send an email by connecting the correct SMTP server of that email provider and the ports that the email provider runs on.

The email sending is also optional. If the User declines to send an email, they will still have the .pdf file saved onto their console to access at any time.


NOTE: The current localhost port of the program is for Gmail servers! Therefore, all .pdf email sending will only be to gmail accounts.
