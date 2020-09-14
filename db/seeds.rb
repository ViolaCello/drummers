Drummer.delete_all
Goal.delete_all
Lesson.delete_all
 
mel = Drummer.create(username: "Melissa678", hometown: "Chicago, IL", password: "hello", favorite_drummer: "Cindy Blackman")
stick = Drummer.create(username: "MrSticks", hometown: "Houston, TX", password: "firefly", favorite_drummer: "Philly Joe Jones")
steve = Drummer.create(username: "SteveH66", hometown: "Coney Island, Brooklyn", password: "KingNeptune", favorite_drummer: "Tony Williams")
marlo = Drummer.create(username: "OU812", hometown: "New Orleans, LA", password: "123221", favorite_drummer: "Elvin Jones")
tooth = Drummer.create(username: "Marus9", hometown: "Philadelphia, PA", password: "Rayerre221", favorite_drummer: "Billy Higgins")

snare = Lesson.create(exercise: "Jazz: Comping Snare", description: "Swing Ride pattern with comping patterns on the snare drum.")
full = Lesson.create(exercise: "Jazz: Comping Full", description: "Swing Ride pattern with comping patterns on the snare, bass, and hi-hat.")
latin = Lesson.create(exercise: "Latin: Bossa Nova", description: "Standard Bossa Nova pattern with alternating clave.")
four = Lesson.create(exercise: "Four-limb Independence", description: "Non-musical exercise to challange muscle memory for complete independence of the hands and feet.")
rudi = Lesson.create(exercise: "Sticking: Rudiments", description: "The Vic Firth 40 Essential Rudiments")

goal1 = Goal.create(current: 60, aim: 120)
goal2 = Goal.create(current: 117, aim: 300)
goal3 = Goal.create(current: 42, aim: 80)
goal4 = Goal.create(current: 99, aim: 120)
goal5 = Goal.create(current: 221, aim: 350)

# goal1.drummer = mel
# goal2.drummer = stick   
# goal3.drummer = steve
# goal4.drummer = marlo
# goal5.drummer = tooth

mel.goals << goal1
stick.goals << goal2
steve.goals << goal3
marlo.goals << goal4
tooth.goals << goal5

snare.goals << goal1
full.goals << goal2
latin.goals << goal3
four.goals << goal4
rudi.goals << goal5
