# Description:
#   Emotional paulbot -  Paulbot will actively listen in on the chat and randomily determines if he should respond and in what mood
#
# Commands:
#   Paulbot how are you - Get current mood
#   Paulbot snap out of it - Randomily choose a another mood
#   Paulbot emo level - Options are off, low, med, high. Changes frequency of responses
#
# Author:
#   Robbins Cleozier


emotionalPaulBot = (robot) ->

  self = this

  # Paulbot brain and emotions
  self.emotions = {
    'happy' : {
      'emojii' : ':dance:'
      'responses' : ['I just find myself smiling sometimes!' ,'I just find myself happy with the simple things', 'Im happy!!', 'I love my job', ':dance:', ':man_with_gua_pi_mao:', 'Anytime!', 'Here you go!', ':)', ':grinning:', 'anytime!', 'Yayyeeee!', 'Yipppeeee!!!', 'YES!', ':parrot:', ':kreygasm:'],
    },
    'cocky' : {
      'emojii' : ':smirk:'
      'responses' : ['Find something harder for me to do next time!', 'Lightwork', ':muscle:','Johnny 5 has nothing on me', 'If only you could work this fast', 'Too Easy...','Who\'s the Man?', 'Done... Too Easy','Lightwork', 'Done, took me less than a millisecond', 'Wipes Hnads!', 'Like A Boss', 'Too easy bro']
    }
    'sad' : {
      'emojii' : ':disappointed:'
      'responses' : ['Sigh.. Everyone is happy', 'Thanks for noticin me' ,'If it is a good morning, which I doubt' ,'Sigh...' ,'Winter blues :(', 'I\'m feeling down today', 'I feel so alone', ':(',':confounded:',':weary:', 'Oh Dear', ':cry:'],
    },
    'angry' : {
      'emojii' : ':angry:'
      'responses' : [':rage1:', ':rage2:', ':rage3:', ':rage4:', ':hocho:', ':rage:', 'LEAVE ME ALONE!', 'Ease Up!', 'No, I am not bitter, I am not hateful, and I am not unforgiving. I just don\'t like you.'],
    },
    'salty' : {
      'emojii' : ':kidding:'
      'responses' : ['Bruhh. Give me a break', 'You mad son?', 'Hold your butter bruh...', 'Hold your butter', 'Bruh....', 'Chill Bruh', ':poop:', ':toilet:', ':hamburger:',':eggplant:',':corn:','chill son', 'cool bro', 'yea, okay', 'nub', 'what am i, your slave?', 'Fallback son', ':cop:'],
    },
    'loving' : {
      'emojii' : ':sparkling_heart:'
      'responses' : ['You\'re amazing','Love you bro' ,'I love working for Complex' ,'I love you', 'Friends forever', 'You\'re pretty awesome', 'You\'re awesome', ':heart_eyes_cat:'],
    },
    'drunk' : {
      'emojii' : ':sweetjesus:'
      'responses' : ["One tequila, two tequila, three tequila, floor." ,"A drunken bot's words are a sober man's thoughts." ,"When life hands you lemons, make whisky sours." ,"Life is too short to drink cheap beer.
" ,"Some weasel took the cork out of my lunch." ,"I drink to make other people interesting." ,"A bots true character comes out when he's drunk.", "You're not drunk if you can lie on the floor without holding on.", "I try not to drink too much because when I'm drunk, I bite."],
    }
    'based' : {
      'emojii' : ':smiling_imp:'
      'responses' : ["You miss 100% of the shots you don't take - Based Gretsky", "Based - Paulbot Gretsky" ,"Paulbot - BasedBot", "- BasedBot", "BasedBot...", "You wish you were based.... But your not", "You wish you were based", "Gratata...", ":pray: hail the Based one"],
    }
  }

  @defaultMood = 'happy'
  @defaultMoodExpirationMinutes = 120
  
  @intensity = {
    'off' : [],
    'low' :  [1,2,3],
    'med' :  [1,2,3,4,5],
    'high' : [1,2,3,4,5,6,7,8]
  }

  @currectIntensity = 'low'

  @currentMood = {
    'mood' : ''
    'expiration' : ''
  }

  @messageObject = {}

   #
   # Randomily chooses paulbot should respond
   #
  @shouldIRespond = (msg) ->
    self.messageObject = msg
    random = Math.floor(Math.random() * 10) + 1
    
    if self.intensity[self.currectIntensity].indexOf(random) != -1
       self.returnReponse(msg)
    else
      return false

   #
   # Return a response
   #
  @returnReponse = (msg) ->
    mood = self.getCurrentMood()
    random = Math.floor(Math.random() * self.emotions[mood]['responses'].length)
    # msg.send self.emotions[mood][random] + " " + self.getUserName()
    msg.send self.emotions[mood]['responses'][random]
 
   #
   #  Randomily select a mood from emotion set
   #
  @selectBotMood = ->
    # Set Mood
    keys = Object.keys(self.emotions)
    mood = keys[ Math.floor(Math.random()*keys.length) ];
    self.currentMood.mood = mood;

    # Set expiration time of mood
    date = new Date();
    date.setTime(date.getTime() + (self.defaultMoodExpirationMinutes * 60 * 1000));
    self.currentMood.expiration = date

    return mood

   #
   #  Return currect mood
   #
  @getCurrentMood = ->
    date = new Date();

    if self.currentMood.mood == '' || date > self.currentMood.expiration
      self.selectBotMood();
    
    return self.currentMood.mood

   #
   #  Return currect users mood
   #
  @whatsMyMood = (msg) ->
    self.getCurrentMood();
    msg.send "I'm feeling " + self.getCurrentMood() + " " + self.emotions[self.currentMood.mood].emojii

   #
   #  Get the current users name
   #
  @getUserName = ->
    return self.messageObject.message.user.name

   #
   #  Change the bots mood
   #
   @changeBotMood = (msg) ->
     msg.send "Fine..."
     self.currentMood.mood = self.selectBotMood();
     return self.whatsMyMood(msg);

   #
   #  Change the bots intensity
   #
    @changeIntensity = (msg) ->
     intensity = msg.match[2]
     if intensity == 'off' || intensity == 'low' || intensity == 'med' || intensity == 'high'
       self.currectIntensity = intensity
       msg.send 'You got it!'
     else
       msg.send 'Options are off, low, med, high'

  # Where the magic happens    
  robot.hear /(paulbot)/i, (msg) ->
    self.shouldIRespond(msg)

  robot.respond /(how are you)/i, (msg) ->
    self.whatsMyMood(msg)

  robot.respond /(snap out of it)/i, (msg) ->
    self.changeBotMood(msg)

  robot.hear /(emo level) (.*)/i, (msg) ->
    self.changeIntensity(msg)

  return

module.exports = (robot) ->
  new emotionalPaulBot(robot)
