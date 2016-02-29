# You can either import the data from RAW sql
# or
# You can use `rake db:seed` and this file will populate the database.

User.delete_all
Contest.delete_all
Animal.delete_all
ScoreCard.delete_all

(1..1000).each do |user_id|
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

(1..365).each do |contest_day|
  contest = Contest.create(day: contest_day, prize: Faker::Beer.name)
  contest.register_users!
end

["Aardvark", "Albatross", "Alligator", "Alpaca", "Ant", "Anteater", "Antelope", "Ape", "Armadillo", "Ass/Donkey", "Baboon", "Badger", "Barracuda", "Bat", "Bear", "Beaver", "Bee", "Bison", "Wild", "Boar", "Buffalo", "Galago", "Butterfly", "Camel", "Caribou", "Cat", "Caterpillar", "Cattle", "Chamois", "Cheetah", "Chicken", "Chimpanzee", "Chinchilla", "Clam", "Cobra", "Cockroach", "Cod", "Cormorant", "Coyote", "Crab", "Crane", "Crocodile", "Crow", "Curlew", "Deer", "Dinosaur", "Dog", "Dogfish", "Dolphin", "Donkey", "Dotterel", "Dove", "Dragonfly", "Duck", "Dugong", "Dunlin", "Eagle", "Echidna", "Eel", "Eland", "Elephant", "Elephant", "seal", "Elk", "(wapiti)", "Emu", "Falcon", "Ferret", "Finch", "Fish", "Flamingo", "Fly", "Fox", "Frog", "Gaur", "Gazelle", "Gerbil", "Giant", "Panda", "Giraffe", "Gnat", "Gnu", "Goat", "Goose", "Goldfinch", "Goldfish", "Gorilla", "Goshawk", "Grasshopper", "Grouse", "Guanaco", "Guinea", "fowl", "Guinea", "pig", "Gull", "Hamster", "Hare", "Hawk", "Hedgehog", "Heron", "Herring", "Hippopotamus", "Hornet", "Horse", "Human", "Hummingbird", "Hyena", "Jackal", "Jaguar", "Jay", "Blue Jay", "Jellyfish", "Kangaroo", "Koala", "Komodo", "dragon", "Kouprey", "Kudu", "Lapwing", "Lark", "Lemur", "Leopard", "Lion", "Llama", "Lobster", "Locust", "Loris", "Louse", "Lyrebird", "Magpie", "Mallard", "Also", "see", "Duck", "Manatee", "Marten", "Meerkat", "Mink", "Mole", "Monkey", "Moose", "Mouse", "Mosquito", "Mule", "Narwhal", "Newt", "Nightingale", "Octopus", "Okapi", "Opossum", "Oryx", "Ostrich", "Otter", "Owl", "Ox", "Oyster", "Panther", "Parrot", "Partridge", "Peafowl", "Pelican", "Penguin", "Pheasant", "Pig", "Also", "see", "Boar", "Pigeon", "Pony-", "See", "Horse", "Porcupine", "Porpoise", "Prairie", "Dog", "Quail", "Quelea", "Rabbit", "Raccoon", "Rail", "Ram", "Also", "see", "Sheep", "Rat", "Raven", "Red", "deer", "Red", "panda", "Reindeer", "(caribou)", "Rhinoceros", "Rook", "Ruff", "Salamander", "Salmon", "Sand", "Dollar", "Sandpiper", "Sardine", "Scorpion", "Sea", "lion", "Sea", "Urchin", "Seahorse", "Seal", "Shark", "Sheep", "Also", "see", "Ram", "Shrew", "Shrimp", "Skunk", "Snail", "Snake", "Spider", "Squid", "Squirrel", "Starling", "Stingray", "Stinkbug", "Stork", "Swallow", "Swan", "Tapir", "Tarsier", "Termite", "Tiger", "Toad", "Trout", "Turkey", "Turtle", "Vicua", "Viper", "Vulture", "Wallaby", "Walrus", "Wasp", "Water", "buffalo", "Weasel", "Whale", "Wolf", "Wolverine", "Wombat", "Woodcock", "Woodpecker", "Worm", "Wren", "Yak", "Zebra"].each do |name|
  Animal.create(name: name, value: rand(1000))
end

