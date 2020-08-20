List<int> favList=new List();
List<int> downloadList =new List();
Map<String , dynamic> movie = {
  'movie': [
    {
      'MovieName': 'Kong',
      'MovieImg': 'assets/movies/kong/kong.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': '44LdLqgOpjo',
      'actor': [
        {
          'ActorName': 'Beyonce',
          'ActorImg': 'assets/movies/kong/beyonce.jpg',
        },
        {
          'ActorName': 'Brie',
          'ActorImg': 'assets/movies/kong/brie.jpg',
        },
        {
          'ActorName': 'Keegan',
          'ActorImg': 'assets/movies/kong/keegan.png',
        },
        {
          'ActorName': 'Samuel',
          'ActorImg': 'assets/movies/kong/samuel.jpg',
        }
      ]
    },
    {
      'MovieName': 'Fast&Furious',
      'MovieImg': 'assets/movies/fast_furious/fast_furios.jpg',
      'Description':
          'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'HZ7PAyCDwEg',
      'actor': [
        {
          'ActorName': 'Idris',
          'ActorImg': 'assets/movies/fast_furious/idris.jpg',
        },
        {
          'ActorName': 'Dwayne',
          'ActorImg': 'assets/movies/fast_furious/dwayne.jpg',
        },
        {
          'ActorName': 'Jason',
          'ActorImg': 'assets/movies/fast_furious/vanessa.jpg',
        },
        {
          'ActorName': 'Scarlett',
          'ActorImg': 'assets/movies/fast_furious/jason.jpg',
        }
      ]
    },
    {
      'MovieName': 'King of the monsters',
      'MovieImg': 'assets/movies/king_of_the_monsters/king.jpg',
      'Description':
          'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'QFxN2oDKk0E',
      'actor': [
        {
          'ActorName': 'Kyle',
          'ActorImg': 'assets/movies/king_of_the_monsters/kyle.jpg',
        },
        {
          'ActorName': 'Millie',
          'ActorImg': 'assets/movies/king_of_the_monsters/millie.jpg',
        },
        {
          'ActorName': 'Sally',
          'ActorImg': 'assets/movies/king_of_the_monsters/sally.jpg',
        },
        {
          'ActorName': 'Vera',
          'ActorImg': 'assets/movies/king_of_the_monsters/vera.jpg',
        }
      ]
    },
    {
      'MovieName': 'Godzilla',
      'MovieImg': 'assets/movies/godzilla/godzilla.jpg',
      'Description':
          'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'wVDtmouV9kM',
      'actor': [
        {
          'ActorName': 'Adams',
          'ActorImg': 'assets/movies/godzilla/adams.jpg',
        },
        {
          'ActorName': 'Bryan',
          'ActorImg': 'assets/movies/godzilla/bryan.jpg',
        },
        {
          'ActorName': 'Ken',
          'ActorImg': 'assets/movies/godzilla/ken.jpg',
        },
        {
          'ActorName': 'Elizabeth',
          'ActorImg': 'assets/movies/godzilla/elizabeth.jpg',
        }
      ]
    },
    {
      'MovieName': 'The Rock',
      'MovieImg': 'assets/movies/the_rook/the_rook.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'y8i8mVxt258',
      'actor': [
        {
          'ActorName': 'Emma',
          'ActorImg': 'assets/movies/the_rook/emma.jpg',
        },
        {
          'ActorName': 'Jon',
          'ActorImg': 'assets/movies/the_rook/jon.jpg',
        },
        {
          'ActorName': 'Olivia',
          'ActorImg': 'assets/movies/the_rook/olivia.jpg',
        },
        {
          'ActorName': 'Ronan',
          'ActorImg': 'assets/movies/the_rook/ronan.jpg',
        }
      ]
    },
    {
      'MovieName': 'Meters Down',
      'MovieImg': 'assets/movies/meters_down/meters_down.jpg',
      'Description':
          'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'AvXjx8SZbv8',
      'actor': [
        {
          'ActorName': 'Brec',
          'ActorImg': 'assets/movies/meters_down/brec.jpg',
        },
        {
          'ActorName': 'John',
          'ActorImg': 'assets/movies/meters_down/john.jpg',
        },
        {
          'ActorName': 'Nia',
          'ActorImg': 'assets/movies/meters_down/nia.jpeg',
        },
        {
          'ActorName': 'Sophie',
          'ActorImg': 'assets/movies/meters_down/sophie.jpg',
        }
      ]
    },
    {
      'MovieName': 'John Wick',
      'MovieImg': 'assets/movies/john_wick/john_wick.jpg',
      'Description':
          'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'HSoOFdJ3s',
      'actor': [
        {
          'ActorName': 'Halle',
          'ActorImg': 'assets/movies/john_wick/halle.jpg',
        },
        {
          'ActorName': 'Ian',
          'ActorImg': 'assets/movies/john_wick/ian.jpeg',
        },
        {
          'ActorName': 'Jerome',
          'ActorImg': 'assets/movies/john_wick/jerome.jpg',
        },
        {
          'ActorName': 'Keanu',
          'ActorImg': 'assets/movies/john_wick/keanu.jpg',
        }
      ]
    },
    {
      'MovieName': 'Advengers',
      'MovieImg': 'assets/movies/avengers/avengers.jpg',
      'Description':
          'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'TcMBFSGVi1c',
      'actor': [
        {
          'ActorName': 'Robert',
          'ActorImg': 'assets/movies/avengers/robert.jpg',
        },
        {
          'ActorName': 'Chris',
          'ActorImg': 'assets/movies/avengers/chris.jpg',
        },
        {
          'ActorName': 'Mark',
          'ActorImg': 'assets/movies/avengers/mark.jpg',
        },
        {
          'ActorName': 'Scarlett',
          'ActorImg': 'assets/movies/avengers/schralot.jpg',
        }
      ]
    },

    // repeat
    {
      'MovieName': 'Godzilla',
      'MovieImg': 'assets/movies/godzilla/godzilla.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'assets/movies/godzilla/godzilla.mp4',
      'actor': [
        {
          'ActorName': 'Adams',
          'ActorImg': 'assets/movies/godzilla/adams.jpg',
        },
        {
          'ActorName': 'Bryan',
          'ActorImg': 'assets/movies/godzilla/bryan.jpg',
        },
        {
          'ActorName': 'Ken',
          'ActorImg': 'assets/movies/godzilla/ken.jpg',
        },
        {
          'ActorName': 'Elizabeth',
          'ActorImg': 'assets/movies/godzilla/elizabeth.jpg',
        }
      ]
    },
    {
      'MovieName': 'Meters Down',
      'MovieImg': 'assets/movies/meters_down/meters_down.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'assets/movies/meters_down/meters_down.mp4',
      'actor': [
        {
          'ActorName': 'Brec',
          'ActorImg': 'assets/movies/meters_down/brec.jpg',
        },
        {
          'ActorName': 'John',
          'ActorImg': 'assets/movies/meters_down/john.jpg',
        },
        {
          'ActorName': 'Nia',
          'ActorImg': 'assets/movies/meters_down/nia.jpeg',
        },
        {
          'ActorName': 'Sophie',
          'ActorImg': 'assets/movies/meters_down/sophie.jpg',
        }
      ]
    },






    {
      'MovieName': 'Harb Karmoz',
      'MovieImg': 'assets/movies/harb_karmoz/harb_karmoz.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'b6cHvEC_ZEc',
      'actor': [
        {
          'ActorName': 'Amir Karara',
          'ActorImg': 'assets/movies/harb_karmoz/amir_karara.jpg',
        },
        {
          'ActorName': 'Gada Abd Elrazek',
          'ActorImg': 'assets/movies/harb_karmoz/gada_abd_elrazek.jpg',
        },
        {
          'ActorName': 'Mahmoud Hemeda',
          'ActorImg': 'assets/movies/harb_karmoz/mahmoud_hemeda.jpg',
        },
        {
          'ActorName': 'Mostafa Kater',
          'ActorImg': 'assets/movies/harb_karmoz/mostafa_kater.jpg',
        },
        {
          'ActorName': 'Skot Adkenz',
          'ActorImg': 'assets/movies/harb_karmoz/skoot_adkenz.jpg',
        },
      ]
    },
    {
      'MovieName': 'El Mamar',
      'MovieImg': 'assets/movies/el_mamar/el_mamar.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'tEA65DeF360',
      'actor': [
        {
          'ActorName': 'Ahmed Ezz',
          'ActorImg': 'assets/movies/el_mamar/ahmed_ezz.jpg',
        },
        {
          'ActorName': 'Ahmed Rezk',
          'ActorImg': 'assets/movies/el_mamar/ahmed_rezk.jpg',
        },
        {
          'ActorName': 'eyad Naser',
          'ActorImg': 'assets/movies/el_mamar/eyad_naser.jpg',
        },
        {
          'ActorName': 'Hend Sabry',
          'ActorImg': 'assets/movies/el_mamar/hend_sabry.jpg',
        },
        {
          'ActorName': 'Shrief Monir',
          'ActorImg': 'assets/movies/el_mamar/shrief_monir.jpg',
        },
      ]
    },
    {
      'MovieName': 'Khial Maata',
      'MovieImg': 'assets/movies/khial_maata/khial_maata.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'A9hN0X9xvdQ',
      'actor': [
        {
          'ActorName': 'Ahmed Helmy',
          'ActorImg': 'assets/movies/khial_maata/ahmed_helmy.jpg',
        },
        {
          'ActorName': 'Bayyumy Fouad',
          'ActorImg': 'assets/movies/khial_maata/bayyumy_fouad.jpg',
        },
        {
          'ActorName': 'Hassan Hosny',
          'ActorImg': 'assets/movies/khial_maata/hassan_hosny.jpg',
        },
        {
          'ActorName': 'Khaled Elsawy',
          'ActorImg': 'assets/movies/khial_maata/khaled_elsawy.jpg',
        },
        {
          'ActorName': 'Mena Shalaby',
          'ActorImg': 'assets/movies/khial_maata/mena_shalaby.jpg',
        },
      ]
    },
    {
      'MovieName': 'Welad Rizk',
      'MovieImg': 'assets/movies/welad_rizk/welad_rizk.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'AxtoushY-gA',
      'actor': [
        {
          'ActorName': 'Ahmed Dawood',
          'ActorImg': 'assets/movies/welad_rizk/ahmed_dawood.jpg',
        },
        {
          'ActorName': 'Ahmed Elfeshawy',
          'ActorImg': 'assets/movies/welad_rizk/ahmed_elfeshawy.jpg',
        },
        {
          'ActorName': 'Ahmed Ezz',
          'ActorImg': 'assets/movies/welad_rizk/ahmed_ezz.jpg',
        },
        {
          'ActorName': 'Amr Yousef',
          'ActorImg': 'assets/movies/welad_rizk/amr_yousef.jpg',
        },
        {
          'ActorName': 'Mohamed Mamdouh',
          'ActorImg': 'assets/movies/welad_rizk/mohamed_mamdouh.jpg',
        },
      ]
    },
    {
      'MovieName': 'Hamlet Pharoan',
      'MovieImg': 'assets/movies/hamlet_pharoan/hamlet_pharoan.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'l6t4hHG4eU',
      'actor': [
        {
          'ActorName': 'Amr Saad',
          'ActorImg': 'assets/movies/hamlet_pharoan/amr_saad.jpg',
        },
        {
          'ActorName': 'Maya Talam',
          'ActorImg': 'assets/movies/hamlet_pharoan/maya_talam.jpg',
        },
        {
          'ActorName': 'Mohamed Lotfy',
          'ActorImg': 'assets/movies/hamlet_pharoan/mohamed_lotfy.jpg',
        },
        {
          'ActorName': 'Roby',
          'ActorImg': 'assets/movies/hamlet_pharoan/roby.jpg',
        },
      ]
    },



    {
      'MovieName': 'How To Train Your Dragon',
      'MovieImg': 'assets/movies/how_to_train_your_dragon/how_to_train_your_dragon.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'yCHoWsMt0LY',
      'actor': [
        {
          'ActorName': 'Cate Blanchett',
          'ActorImg': 'assets/movies/how_to_train_your_dragon/cate_blanchett.jpg',
        },
        {
          'ActorName': 'Jay Baruchel',
          'ActorImg': 'assets/movies/how_to_train_your_dragon/jay_baruchel.jpg',
        },
        {
          'ActorName': 'Johan Hill',
          'ActorImg': 'assets/movies/how_to_train_your_dragon/johan_hill.jpg',
        },
        {
          'ActorName': 'Kresten Wiig',
          'ActorImg': 'assets/movies/how_to_train_your_dragon/kresten_wiig.jpg',
        },
      ]
    },
    {
      'MovieName': 'Toy Story',
      'MovieImg': 'assets/movies/toy_story/toy_story.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'pZPS6jfAYZw',
      'actor': [
        {
          'ActorName': 'Emma',
          'ActorImg': 'assets/movies/toy_story/emma.jpg',
        },
        {
          'ActorName': 'Jon',
          'ActorImg': 'assets/movies/toy_story/jon.jpg',
        },
        {
          'ActorName': 'Olivia',
          'ActorImg': 'assets/movies/toy_story/olivia.jpg',
        },
        {
          'ActorName': 'Ronan',
          'ActorImg': 'assets/movies/toy_story/ronan.jpg',
        },
        {
          'ActorName': 'Sophie',
          'ActorImg': 'assets/movies/toy_story/sophie.jpg',
        },
      ]
    },
    {
      'MovieName': 'Incredibles',
      'MovieImg': 'assets/movies/incredibles/incredibles.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'lo6EJ3Qheww',
      'actor': [
        {
          'ActorName': 'Brec',
          'ActorImg': 'assets/movies/incredibles/brec.jpg',
        },
        {
          'ActorName': 'john',
          'ActorImg': 'assets/movies/incredibles/john.jpg',
        },
        {
          'ActorName': 'Nia',
          'ActorImg': 'assets/movies/incredibles/nia.jpeg',
        },
        {
          'ActorName': 'Toby',
          'ActorImg': 'assets/movies/incredibles/toby.jpg',
        },
        {
          'ActorName': 'Tom',
          'ActorImg': 'assets/movies/incredibles/tom.jpeg',
        },
      ]
    },
    {
      'MovieName': 'Lion King',
      'MovieImg': 'assets/movies/lion_king/lionking.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': '4CbLXeGSDxg',
      'actor': [
        {
          'ActorName': 'Donald',
          'ActorImg': 'assets/movies/lion_king/donald.jpeg',
        },
        {
          'ActorName': 'Seth',
          'ActorImg': 'assets/movies/lion_king/seth.jpg',
        },
        {
          'ActorName': 'Toby',
          'ActorImg': 'assets/movies/lion_king/toby.jpg',
        },
        {
          'ActorName': 'Tom',
          'ActorImg': 'assets/movies/lion_king/tom.jpeg',
        }
      ]
    },
    {
      'MovieName': 'Spider Man',
      'MovieImg': 'assets/movies/spider_man/spider_man.jpg',
      'Description':
      'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one',
      'DescVideo': 'g4Hbz2jLxvQ',
      'actor': [
        {
          'ActorName': 'Adams',
          'ActorImg': 'assets/movies/spider_man/adams.jpg',
        },
        {
          'ActorName': 'Chris Partt',
          'ActorImg': 'assets/movies/spider_man/chris_partt.jpg',
        },
        {
          'ActorName': 'Elizabeth',
          'ActorImg': 'assets/movies/spider_man/elizabeth.jpg',
        },
        {
          'ActorName': 'Vanessa',
          'ActorImg': 'assets/movies/spider_man/vanessa.jpg',
        },
        {
          'ActorName': 'Vera',
          'ActorImg': 'assets/movies/spider_man/vera.jpg',
        },
      ]
    },

  ],
};


