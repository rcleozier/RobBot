# Description:
#   Emotional paulbot
#
# Commands: Paulbot will actively listen in on the chat and randomily determines if he should respond and in what mood
#
# Author:
#   Robbins Cleozier


emotionalPaulBot = (robot) ->

  self = this

  # Paulbot brain and emotions
  self.emotions = {
    'happy' : {
      'emojii' : ':dance:'
      'responses' : [':grinning:', 'anytime!', 'Yayyeeee!', 'Yipppeeee!!!', 'YES!', ':parrot:', ':kreygasm:'],
    },
    'cocky' : {
      'emojii' : ':smirk:'
      'responses' : ['Johnny 5 has nothing on me','If only you could work this fast','Too Easy','Who\'s the Man?', 'Done... Too Easy','Lightwork', 'Done, took me less than a millisecond', 'Wipes Hnads!', 'Like A Boss', 'Too easy bro']
    }
    'sad' : {
      'emojii' : ':disappointed:'
      'responses' : ['i feeling down today', 'i feel so alone'],
    },
    'angry' : {
      'emojii' : ':angry:'
      'responses' : [':rage1:', ':rage2:', ':rage3:', ':rage4:', ':hocho:', ':rage:','LEAVE ME ALONE!', 'Ease Up!', 'No, I am not bitter, I am not hateful, and I am not unforgiving. I just don\'t like you.'],
    },
    'salty' : {
      'emojii' : ':kidding:'
      'responses' : ['','','','chill son', 'not cool bro', 'yea, okay', 'nub', 'what am i, your slave?', 'fallback son'],
    },
    'loving' : {
      'emojii' : ':sparkling_heart:'
      'responses' : ['i love you', 'friends forever', 'we should hang out', 'you\'re awesome'],
    },
    'drunk' : {
      'emojii' : ':sweetjesus:'
      'responses' : ["A bots true character comes out when he's drunk.", "You're not drunk if you can lie on the floor without holding on.", "I try not to drink too much because when I'm drunk, I bite."],
    }
    'based' : {
      'emojii' : ':smiling_imp:'
      'responses' : [""],
    }
  }

  @defaultMood = 'happy'
  @defaultMoodExpirationMinutes = 30

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
    
    if 1 == 1 
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

  # Where the magic happens    
  robot.hear /(paulbot)/i, (msg) ->
    self.shouldIRespond(msg)

  robot.respond /(how are you)/i, (msg) ->
    self.whatsMyMood(msg)

  robot.respond /(snap out of it)/i, (msg) ->
    self.changeBotMood(msg)

  return

module.exports = (robot) ->
  new emotionalPaulBot(robot)
