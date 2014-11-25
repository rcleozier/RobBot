# Description:
#   Emotional paulbot
#
# Commands: Paulbot will actively listen in on the chat and randomily determines if he should respond and in what mood
#
# Author:
#   Robbins Cleozier

emotionalPaulBot = (robot) ->

  self = this

  self.emotions = {
    'happy' : {
      'emojii' : ':dance:'
      'responses' : [':grinning:', 'anytime!', 'Yayyeeee!', 'Yipppeeee!!!', 'YES!', ':parrot:', ':kreygasm:'],
    },
    'sad' : {
      'emojii' : ':disappointed:'
      'responses' : ['i feeling down today', ''],
    },
    'angry' : {
      'emojii' : ':angry:'
      'responses' : ['LEAVE ME ALONE!', ''],
    },
    'raged' : {
      'emojii' : ':rage:'
      'responses' : [':rage1:', ':rage2:', ':rage3:', ':rage4:', ':hocho:', ':rage:'],
    },
    'salt' : {
      'emojii' : ':troll:'
      'responses' : ['chill son', 'not cool bro', 'yea, okay', 'nub', 'what am i, your slave?', 'Im not your bitch', 'fallback son'],
    },
    'loving' : {
      'emojii' : ':sparkling_heart:'
      'responses' : ['i love you', 'friends forever', 'we should hang out', 'you\'re awesome'],
    },
    'drunk' : {
      'emojii' : ':sweetjesus:'
      'responses' : ["A man's true character comes out when he's drunk.", "You're not drunk if you can lie on the floor without holding on.", "I try not to drink too much because when I'm drunk, I bite."],
    }
  }

  @defaultMood = 'happy'

  @currentMood = {
    'mood' : 'happy'
    'expiration' : ''
  }

  @messageObject = {}


   #
   # Randomily chooses paulbot should respond
   #
  @shouldIRespond = (msg) ->
    random = Math.floor(Math.random() * 10) + 1
    
    if 1 == 1 
       self.returnReponse(msg)
    else
      return false

   #
   # Return a response
   #
  @returnReponse = (msg) ->
    mood = self.getPaulbotMood
    random = Math.floor(Math.random() * self.emotions[mood]['responses'].length) + 1
    msg.send self.emotions[mood][random] + " " + self.getUserName

   #
   #  Randomily select a mood from emotion set
   #
  @selectMyMood = ->
    random = Math.floor(Math.random() * self.emotions.length) + 1
    mood = self.emotions[random]
    return mood
   #
   #  Return currect users mood
   #

  @getPaulbotMood = ->
    return self.currentMood.mood

   #
   #  Return currect users mood
   #
  @whatsMyMood = ->
    return self.currentMood.mood + self.emotions[self.currentMood].emojii

   #
   #  Get the current users name
   #
  @getUserName = ->
    return self.messageObject.message.user.name

  robot.hear /(paulbot)? (.*)/i, (msg) ->
    self.shouldIRespond(msg)

  
  return

module.exports = (robot) ->
  new emotionalPaulBot(robot)
