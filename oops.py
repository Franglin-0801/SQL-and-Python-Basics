class sport:
    def fav_sport(self):
        self.sport_name = input ("enter the sport name :\n")
        self.fav_player = input("enter your fav player name :\n")

    def display(self):
        print("Enter your fav sport :",self.sport_name,"\n")
        print("Enter your fav player name :",self.fav_player,"\n")

class game(sport):
    def goat_sport(self):
        print("Enter your fav sport :",self.sport_name,"\n")

    def fav_athelete(self):
        print("Enter your fav player  :",self.fav_player,"\n")

futbol1 = game()
futbol1.fav_sport()
futbol1.display()
futbol1.goat_sport()
futbol1.fav_athelete()
