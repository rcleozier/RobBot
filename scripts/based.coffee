# Description:
#   Get insightful quotes from the Based God - LIL. B
#
# Commands:
#   "Based" -> Displays an insightful, thought provoking Lil B. quotes 
#
# Author:
#   Robbins Cleozier

images = ['http://images.complex.com/complex/image/upload/t_article_image/ymmpn02mj887tp1ftkse.jpg',
'http://images.complex.com/complex/image/upload/t_article_image/ei51bdlw77ppropuugw9.jpg',
'http://images.complex.com/complex/image/upload/t_article_image/ndfg9lmog6skpo8opyjm.jpg',
'http://images.complex.com/complex/image/upload/t_article_image/bhjtl3lf1fmukc2tlqdx.jpg',
'http://images.complex.com/complex/image/upload/t_article_image/nm6dxfj6jb2l2awwrcyr.jpg',
'http://images.complex.com/complex/image/upload/t_article_image/rjnlreiseuspwophbh7l.jpg',
'http://images.complex.com/complex/image/upload/t_article_image/ucvhy7gjkzbepusg86al.jpg',
'http://images.complex.com/complex/image/upload/t_article_image/zujflytibmgydanmpb4r.jpg',
'http://images.complex.com/complex/image/upload/t_article_image/gkl1oip81vwwiw3imitl.jpg',
]

quotes = ["You know I'm the first rapper to adopt a tabby cat. You know I adopted straight from the ASPCA, you feel me? Just breaking the boundaries, man.",
"Let's stop fracking. Who knows about hydraulic fracking? I'm like, whodie, get that oil out the ocean!",
"Appreciate every single person. Look at them like a golden, million-dollar baby.",
"Nobody in this building asked to be born. You didn't ask to be you, bro. I didn't ask to be me. I didn't ask to have this skin. I didn't ask to be who I was, bro. Nobody in here asked that... So when you see people, forgive them and accept, you feel me?",
"Seeing these ants and studying them and respecting them, it's like, man, they're in their own community too. They're trying to survive. They love. They fight. They telling themselves something. We can't understand, but one day we will. I'm trying hard to figure it out.",
"We're very smart animals, you know, or whatever we are. Organisms? What are we? What do y'all think we are? Is there like a fact? Does anybody have any proof what we are? Come up with your theories man.",
"I'm feeling like Michael Jackson out there, whipping the wrist like br-br-br-da! But I'm too subtle now.",
"I woulda come up here in a suit so y'all could take me seriously. I take y'all so seriously. I take The Based God seriously.",
"How lucky we are to have this structure. Who built this? Tell me who built this building, please.",
"Get gold teeth! Don't be thinking so hard, like, 'Oh, man, I can't get gold teeth.' Who is going to say what to you? We got love in our heart.",
"Real talk: Don't ever deny the voices in your head either. When you're sitting at home alone, right, we all go through depression, anxiety. You're by yourself and you hear those voices going wild in your head, in your unconscious, those angels by your side, your mental, your gut feeling, your heart. Listen to them.",
"Y'all make me feel gorgeous, but sometimes you go to the mirror like, 'Oh my god, I'm not that gorgeous.'' But it's all from your heart though, and that's why you can always feel gorgeous, one hundred percent. To say 'I'm not that gorgeous' is only a reflection of the media. You are gorgeous. I'm telling you.",
"Salute to our brain and our cells fighting for us, fighting off those infections when you rub your butt and you forget to—when you're writing a paper and you wipe your butt and you go to shake your partner's hand. Wash your hands! Wash your hands!",
"I thank my car. Thank you whoever, whatever, earth, spirit, myself, people. I'm like, man, I got from point A to point B safely.",
"Nobody has done what I've done in history. From being the first artist ever to release an ambient album in history with no cursing, Rain in England. Love is strange.",
"My favorite is watercolors. I'm a watercolors type of dude, so definitely collect some of my rare paintings.",
"You guys are going to freak out, because, real talk, I got a song with pretty much the biggest artist on earth.",
"Respect knowledge. If you see somebody with gray hair, embrace that beauty!",
"I better not talk about Mitt [Romney] or you might not see me. What happened to Lil B? Lil B is in jail. Why is he in jail? Imprisoned by the government. Lil B made jokes about Mitt Romney at NYU and he's in prison for some reason.",
"Support humans. I put out money. I spend my money in America because this is our money. I'm about to pay taxes, and I'm happy because of that. I'm happy. I don't know what it's going for, and I pray it's going to the people. The government says that and I'm going to give them the benefit of the doubt. But, hey, look, anybody is smart and has some facts, let me know. But until further notice, I'm paying taxes and I'm loving it.",
"Be bilingual and go learn some slang. Fo sheezy!",
"What is based? What does based mean? Shwoo. Shwoo. Shwoo.",
"I think I'm basedgod with a arc like noah.",
"Swag to the maximum.",
"A lot of people said I would never do it, that's what scares me.",
"I'm paris hilton woo woo swag.",
"He who walks his own path of greatness will never be ancient.",
"What are you gonna do when the lions eat you?!"
]

signatures = ["- Based God",
"- Based",
"- Based God, Signing Out"
"- Lil B"
"- Lil B, Based God",
"- The BasedGod",
"- Lil Boss"
"- BasedGod"
]

module.exports = (robot) ->

  robot.hear /based/i, (msg) ->
    quote = msg.random quotes
    sig = msg.random signatures
    img = msg.random images

    msg.send img
    msg.send quote + ' ' + sig