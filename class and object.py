class clock:
    def getdetails(self):
        self.clock_type = input("enter clock type :")
        self.price = int(input("enter the clock price :"))
        self.rating = float(input("Enter your rating out of 5 :"))
        print()
                          
    def displaydetails(self):
        print("Clock_type", self.clock_type,"\n")
        print("Clock price", self.price,"\n")
        print("Rating", self.rating,"\n")
        print()

clock1 = clock()
clock2 = clock()
clock3 = clock()
clock4 = clock()

clock1.getdetails()
clock2.getdetails()
clock3.getdetails()
clock4.getdetails()

clock1.displaydetails()
clock2.displaydetails()
clock3.displaydetails()
clock4.displaydetails()
