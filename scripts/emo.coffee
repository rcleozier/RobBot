# Description:
# Emotional paulbot - Paulbot will actively listen in on the chat and randomily determines if he should respond and in what mood
#
# Commands:
# Paulbot how are you - Get current mood
# Paulbot snap out of it - Randomily choose a another mood
# Paulbot emo level - Options are off, low, med, high. Changes frequency of responses
#
# Author:
# Robbins Cleozier


emotionalPaulBot = (robot) ->

  self = this

  # Paulbot brain and emotions
  self.emotions = {
    'wise' : {
      'emojii' : ':smugfrog:',
      'responses': [
        'Be happy for this moment. This moment is your life.',
        'Happy people plan actions, they don’t plan results.',
        'Time you enjoy wasting is not wasted time.',
        'Nobody can be uncheered with a balloon.',
        'What you do not want done to yourself, do not do to others.',
        'Happiness depends upon ourselves',
        'Happiness is a state of activity.',
        'The two enemies of human happiness are pain and boredom',
        'Don’t try to make sense of it all, just go',
        'Art is 99 percent robbery',
        'The desire for safety stands against every great and noble enterprise',
        'It’s not what you look at that matters, it’s what you see',
        'When you’ve seen beyond yourself, then you may find, peace of mind is waiting there',
        'If you lack the will to start, you’re already finished',
        'The best way to get approval is to not need it',
        'Holding back is so close to stealing',
      ],
    },
    'nerdy' : {
      'emojii' : ':eduardodealwithit:',
      'responses': [
        'One of my most productive days was throwing away 1000 lines of code.',
        'When in doubt, use brute force.',
        'Deleted code is debugged code.',
        'Controlling complexity is the essence of computer programming.',
        'Life is too short to run proprietary software.',
        'Ethernet always wins.',
        'The central enemy of reliability is complexity.',
        'Nobody who uses XML knows what they are doing.',
        'The best code is no code at all.',
        'Before software can be reusable it first has to be usable.',
        'Code never lies, comments sometimes do.',
        'What I cannot build, I do not understand.',
        'A fool with a tool is a more dangerous fool.',
        'Once a new technology starts rolling, if you’re not part of the steamroller, you’re part of the road.',
        'With diligence it is possible to make anything run slowly.',
        'The unavoidable price of reliability is simplicity.',
        'The proper use of comments is to compensate for our failure to express ourself in code.',
        'Software sucks because users demand it to.',
        'Search all the parks in all your cities; you’ll find no statues of committees.',
        'The only sin is to make a choice without knowing you are making one.',
        'I object to doing things that computers can do.',
        'If it doesn’t work, it doesn’t matter how fast it doesn’t work.',
        'No code is faster than no code.',
        'OOP is to writing a program, what going through airport security is to flying.',
        'PHP is [the] Sarah Palin of programming languages.',
        'The trick is to fix the problem you have, rather than the problem you want.',
        'So much complexity in software comes from trying to make one thing do two things.',
        'Premature optimization, that’s like a fart. Premature abstraction is like taking a dump on another developer’s desk.',
        'Simplicity is prerequisite for reliability.',
        'All software wants to be free',
        'When shit happens, we add new features',
        'First, solve the problem. Then, write the code.',
        'You can’t trust code that you did not totally create yourself.',
        'If you want to go somewhere, goto is the best way to get there.',
        'A smart terminal is not a smartass terminal, but rather a terminal you can educate.',
        'Simplicity is the ultimate sophistication.',
        'Every language has an optimization operator. In PHP that operator is ‘//’',
        'A computer is a stupid machine with the ability to do incredibly smart things, while computer programmers are smart people with the ability to do incredibly stupid things. They are, in short, a perfect match'
      ],
    },
    'happy' : {
      'emojii' : ':jayz:'
      'responses' : [
        'You\'re amazing','Love you bro',
        'I love working for Complex', 'I love you',
        'Friends forever', 'You\'re pretty awesome',
        'You\'re awesome', ':heart_eyes_cat:',
        'Today was a good day.',
        'I just find myself smiling sometimes!',
        'I just find myself happy with the simple things',
        'Im happy!!',
        'I love my job',
        'Anytime!',
        'Here you go!',
        'anytime!',
        'Yayyeeee!',
        'Yipppeeee!!!',
        'YES!',
      ],
    },
    'kanye' : {
      'emojii' : ':kanye:'
      'responses' : [
        'When you’re the absolute best, you get hated on the most.',
        'I am God\'s vessel. But my greatest pain in life is that I will never be able to see myself perform live',
        'I will go down as the voice of this generation, of this decade, I will be the loudest voice',
        'You should only believe about 90 percent of what I say. As a matter of fact, don’t even believe anything that I’m saying at all. I could be completely messing with you, and the world, the entire time',
        'Come at me bruh',
        'Bruhh. Give me a break',
        'You mad son?',
        'Hold your butter',
        'Bruh....',
        'Chill Bruh',
        'chill son',
        'cool bro',
        'yea, okay',
        'what am i, your slave?',
        'Fallback son',
        'Finished!',
        'Find something harder for me to do next time!',
        'Lightwork',
        'If only you could work this fast',
        'Too Easy...',
        'Who\'s the Man?',
        'Done... Too Easy',
        'Lightwork',
        'Done, took me less than a millisecond',
        'Like A Boss',
        'Too easy bro',
        'Try and keep up',
        'Next time, give me something harder',
        'Visiting my mind is like visiting the Hermès factory. Sh*t is real',
        'I am so credible and so influential and so relevant that I will change things.',
      ]
    },
  }

  @defaultMood = 'nerdy'
  @defaultMoodExpirationMinutes = 120
  
  @intensity = {
    'off' : [],
    'low' : [1,2,3,4],
    'med' : [1,2,3,4,5,6],
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
    msg.send self.emotions[mood]['responses'][random] + ' ' + self.emotions[mood]['emojii'];
 
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
   # Return currect mood
   #
  @getCurrentMood = ->
    date = new Date();

    if self.currentMood.mood == '' || date > self.currentMood.expiration
      self.selectBotMood();
    
    return self.currentMood.mood

   #
   # Return currect users mood
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
   # Change the bots mood
   #
   @changeBotMood = (msg) ->
     msg.send "Fine..."
     self.currentMood.mood = self.selectBotMood();
     return self.whatsMyMood(msg);

   #
   # Change the bots intensity
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
