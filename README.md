MSTU 5013 - Final Project
============================
* Team members: Heidi Son, Biying Zhong, Minh Le
* [Demo Page](https://mdl2170.github.io/mstu5013-final-project)
* [Reflection Video](https://youtube.com)

## Design Executive Summary
Our project addresses cybersecurity learning of teenagers by simulating
realistic problems that arise in communicating with strangers online. We were able
to accomplish this through the concept of "the magic circle" (explained in detail below)
within our platform. Through interacting with our programmed conversational agent
(the stranger), users will be exposed to situations where they will be prompted to
either disclose or protect their private information. After each conversation progresses
through the chat, users will accumulate cybersecurity points for each response choice
and will receive a feedback about their cybersecurity knowledge and channels for additional
learning.



## Learning Problem

In the recent year, there have been numerous cases of predators used messaging apps to lure teens and children to meet them, and committed crimes such as kidnapping or raping. The scariest thing about meeting someone online is that they may not be who they say they are. A young girl may be speaking with someone who claims to be another young girl, but who is, in reality, an adult male. And the girl may develop trust for a person online who they would be wary of in person. In order to protect one’s privacy, it is critical to learn how to interpret social network settings and be able to decipher to what extent an individual should relay one’s private information on the web.

It is worth mentioning that there are tons of resources on the Internet that aim to raise awareness of and educate kids about how to protect themselves in the digital world. For example, these are key take-aways from [Cybersecurity for Kids - Homeland Security](https://www.dhs.gov/sites/default/files/publications/Cybersecurity%20for%20Kids%20Tip%20Card_1.pdf)
>
> **Don’t talk to strangers**. Don't communicate with strangers online and never agree to meet in person. Tell a parent, teacher, or an adult you trust if a stranger contacts you in a chat room, through email, or via text messaging.
>
> **Look both ways before crossing the street**. Don't enter contests, join clubs, or share your personal information for any reason, unless your parents say it's OK. Your name, address, age, phone number, birthday, email address, where you go to school, and other facts about you are personal and shouldn’t be shared without checking first.
>
> **If the offer seems too good to be true, then it probably is**. How many of you have ever received an email offering something free, like a cell phone or concert tickets? These are tricks designed to get you to give up personal information or click on links to automatically install malware or spyware.

However, we think the effectiveness of those resources is very limited as kids don't often care about those advices until they actually see or experience bad consequences. Therefore, we will use those advices as a framework to develop the chat simulator that teaches children the dangers of talking to strangers online, the risks and consequences of personal information loss (e.g. name, address, age, phone number, birthday, email address, where you go to school, etc.), and how to protect their identity online.

The objectives are:
* To teach kids potential harm of talking to strangers online as the strangers may not be the people they say they are and try to use, control, or harm kids in some way, for example, steal money or credit.
* To teach kids to keep their personal information private; avoid sharing their name, address, telephone number, birthday, passwords, and the name of their school when using the Internet.
* To teach kids to think carefully before clicking on any links for unfamiliar sites.

| I want my learners to | Learning target | Description |
| -------- | -------- | -------- |
| Do     | Attitude     |

* The attitude of the user will change in the aspect that he or she was more trusting of writing personal information online in chatrooms with people or acquaintances that they know, but by using our app, we would like the user to think twice and have a change of attitude regarding his or her online habit.

We want learners to avoid talking with strangers online, protect their personal information, and not click on unusual links    


## Learning Theory

The Magic Circle (role playing simulations)-

The authors delve into the theory that particular set of conditions are established in a simulation and educational role-play in order to experience something that could occur in reality. According to their definition, "A simulation is an artificially dynamic and closed systemic environment in which a particular set of conditions is created according to a priori rules in order to study" (Linser et al., 2008)


Wikipedia: The Magic Circle

"In games and digital media, the "magic circle" is the space in which the normal rules and reality of the world are suspended and replaced by the artificial reality of a game world."


Reference:

Linser, Lindstad, Vold, Roni, Nina, Tone (July 4, 2008). "The Magic Circle - Game Design Principles and Online Role-play Simulations" (PDF). ED-MEDIA.

## The Main/Critical User Experience

Our main idea was strongly inspired by this [video](https://www.youtube.com/watch?v=6jMhMVEjEQg)

The main functionality of our platform that addresses the aforementioned problem is the simulation of cybersecurity-related experiences. Users will be engaged in a chat conversation where they will “talk” to a “stranger” who is a bot pretending to be a student from their school and trying to be their friends.

Along the conversation, the app will present sequentially scripted messages and users will be given pre-set multiple choice responses that they can choose from. The answer selection sets are directed at evaluating the users’ knowledge of cybersecurity and about protecting their privacy.

There are features incorporated onto the platform where the user will have the autonomy to write their own responses in place of the answer choices if they feel the selection does not appropriately answer the question. Based on their selections or original answers, there will be points accumulated at the end of the conversation. The app will provide feedback in regards to the user’s awareness of cybersecurity and how they perform compared to other users on the “cyber leadership” board.

In the future, it would be ideal to have the leadership board reflect the user’s ranking/performance compared to his or her demographics (age, region, etc.) after diverse data has been compiled. Finally, the app will simulate a online chat experience showing the good/bad consequences based on users’ decision of responses. Through this simulation, users will be able to assess the results and severity of the consequences (ie: identity theft) depending on the type of action they take on the web. The users will need to apply their critical thinkings skills in performing these exercises.

Draft idea of UI
![](https://i.imgur.com/s3CZTWl.jpg)


## Riot Components

### App tag

The App tag consists of the Message tag, Response tag, and Score tag

### Message tag

From the database end:
1) Scripted messages are the responses and messages of the "bot" from our data on firebase

```
<message>
  <li class="message left appeared" if="{ msg.type == 'scripted' }">
    <div class="avatar"></div>
    <div class="text_wrapper">
      <div class="text">{ msg.text }</div>
    </div>
    <div class="message_media" if="{ msg.media != 'nill' }">
      <img src="{ msg.media }" alt="" class="img-responsive">
    </div>
  </li>
  <li class="message right appeared" if="{ msg.type == 'user-created' }">
    <div class="avatar"></div>
    <div class="text_wrapper">
      <div class="text">{ msg.text }</div>
    </div>
  </li>
  <script>
    var $messages = $('.messages');
    $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
  </script>
</message>
```
### Response tag

From the user end:

The response tag will have three available response choices (onclick buttons) to choose from and each button will the user to its specific data architecture and algorithm.


```
<response>
  <div class="send_message" onclick="{ sendMsg }">
    <div class="icon"></div>
    <div class="text">{ response.text }</div>
  </div>
  <script>
    sendMsg(e) {
      var msg = {
        text : e.item.response.text,
        type : "user-created"
      }
      this.parent.currentScriptedMsgID = e.item.response.next;
      this.parent.sessionRef.push(msg);
    }
  </script>
</response>

````
Also, scores will be assigned to each response in the data architecture. Upon the completion of choosing the response choices, the total score will be calculated in order to for the user to be aware of how his or her cybersecurity knowledge compares to other users. Also, an alert message will appear to direct users to external sources for learning about protecting one's private information.
````
app.sessionRef.on("value", function (snapshot) {
      var data = snapshot.val();
      app.messages = [];
      for (key in data)
      {
        app.messages.push(data[key]);
        if(data[key].type == "user-created")
        app.score += data[key].score;
      }

      console.log(app.score);
````

## Data Model

```
message = {
  text: "Hi. How are you doing",
  order: 1,
  type: "scripted",
  needResponse: true,
  interaction: {
      type: "multipleChoice",
      options: {

      }
  },
  id: "Lx398s9f704ds98fs"
}

dialog = {

}
```

## Data Architecture

User needs to input username to start using the app and this username will be used to keep track his/her ranking on the cyber leadership board.

The `scriptedMsg` is the core data of the app which facilitates the chat conversation with users. The app retrieves messages from `scriptedMsg` to talk with user and the user's responses will be saved to `userDialog`

```
- \
  - scriptedMsg
    - key
        - text
        - order
        - type
        - needResponse
        - msgID

  - user
    - key
        - userID
        - userName
        - score
        - ranking

  - userDialog
    - userID
        - msgID

```


##Conversation - firebase

```
{
  {
"dialog" : {
}
"scriptedMsg" : {
  "01" : {
    "media" : "nill",
    "next" : "02",
    "response" : "nill",
    "text" : "Hi. How are you?",
    "type" : "scripted"
  },
  "02" : {
    "media" : "nill",
    "next" : "nill",
    "response" : {
      "01" : {
        "needInput" : false,
        "next" : "0201",
        "score" : 5,
        "text" : "No, I don’t care. Thanks!"
      },
      "02" : {
        "needInput" : false,
        "next" : "0202",
        "score" : 10,
        "text" : "You’re stranger. I don’t want to talk to you"
      },
      "03" : {
        "needInput" : false,
        "next" : "0203",
        "score" : 0,
        "text" : "Really!!! I'd love to"
      }
    },
    "text" : "I am Kate from your school. I have an extra ticket to the concert this weekend. Would you be interested in joining me?",
    "type" : "scripted"
  },
  "0201" : {
    "media" : "nill",
    "next" : "nill",
    "response" : {
      "01" : {
        "needInput" : false,
        "next" : "020201",
        "score" : 5,
        "text" : "No, I can't accept, find someone else."
      },
      "02" : {
        "needInput" : false,
        "next" : "020102",
        "score" : 0,
        "text" : "It sounds tempted. I will take it."
      }
    },
    "text" : "Are you sure? It is absolutely free. This offer won't last long. It's really a great deal!",
    "type" : "scripted"
  },
  "0202" : {
    "media" : "nill",
    "next" : "nill",
    "response" : {
      "01" : {
        "needInput" : false,
        "next" : "020201",
        "score" : 10,
        "text" : "It is unsafe talking with strangers"
      },
      "02" : {
        "needInput" : false,
        "next" : "0203",
        "score" : 5,
        "text" : "Yes, you are right...Ok, then how can I get the ticket?"
      }
    },
    "text" : "What!!! You don't remember me. We just met last week. Anyhow, what could be wrong if you talk with a stranger?",
    "type" : "scripted"
  },
  "0203" : {
    "media" : "nill",
    "next" : "nill",
    "response" : {
      "01" : {
        "needInput" : true,
        "next" : "020301",
        "score" : 0,
        "text" : "I live at "
      },
      "02" : {
        "needInput" : false,
        "next" : "020302",
        "score" : 5,
        "text" : "Sorry, I can't tell you my address."
      }
    },
    "text" : "Great. Where do you live? I need your address to send the ticket to you.",
    "type" : "scripted"
  },
  "020102" : {
    "media" : "nill",
    "next" : "nill",
    "response" : {
      "01" : {
        "needInput" : true,
        "next" : "02010201",
        "score" : 5,
        "text" : "Ok, my credit card number is VISA XXXX XXXX XXX XXXX."
      },
      "02" : {
        "needInput" : false,
        "next" : "02010202",
        "score" : 0,
        "text" : "Well...I think I can't tell you..."
      }
    },
    "text" : "Great. I checked with the promotion agency and they said I need to put down a credit card number to hold the tickets, but they’re not going to charge it. They just want to make sure we’ll show up and the tickets don’t go to waste.",
    "type" : "scripted"
  },
  "020201" : {
    "media" : "nill",
    "next" : "nill",
    "response" : "nill",
    "text" : "That's great. Talking with strangers and tell them personal info is dangerous. There is no free lunch.",
    "type" : "scripted"
  },
  "020202" : {
    "media" : "nill",
    "next" : "nill",
    "response" : "nill",
    "text" : "That's ok. I am out of here",
    "type" : "scripted"
  },
  "020301" : {
    "media" : "http://f.4399biule.com/f/bq/2017/09/01/19_doUsLR.240x240.gif",
    "next" : "nill",
    "response" : "nill",
    "text" : "Haha. I know where you live. You know what, I am not your friend. Wanna see who I am? Here is my photo <scary photo attached>. I am gonna go to your place and harm you.",
    "type" : "scripted"
  },
  "020302" : {
    "media" : "nill",
    "next" : "nill",
    "response" : {
      "01" : {
        "needInput" : false,
        "next" : "02030201",
        "score" : 0,
        "text" : "Ok, I'll meet you."
      },
      "02" : {
        "needInput" : false,
        "next" : "02030202",
        "score" : 5,
        "text" : "Sorry, I can't meet you there."
      }
    },
    "text" : "Then how about we meet in person?",
    "type" : "scripted"
  },
  "02010201" : {
    "media" : "http://pic.pimg.tw/sunnyc624/1392791477-3969535089.jpg",
    "next" : "nill",
    "response" : "nill",
    "text" : "HAHAHA I will spend all your money!!!",
    "type" : "scripted"
  },
  "02010202" : {
    "media" : "nill",
    "next" : "nill",
    "response" : {
      "01" : {
        "needInput" : true,
        "next" : "02010201",
        "score" : 5,
        "text" : "Ok, my credit card number is VISA XXXX XXXX XXX XXXX."
      },
      "02" : {
        "needInput" : false,
        "next" : "020201",
        "score" : 0,
        "text" : "No. I won't tell you."
      }
    },
    "text" : "No worries, it won't charge you.",
    "type" : "scripted"
  },
  "02030201" : {
    "media" : "http://f.4399biule.com/f/bq/2017/09/01/19_doUsLR.240x240.gif",
    "next" : "nill",
    "response" : "nill",
    "text" : "I'll KILL you HAHAHAHA.",
    "type" : "scripted"
  },
  "02030202" : {
    "media" : "nill",
    "next" : "nill",
    "response" : "nill",
    "text" : "Good, you know that you can't meet with strangers. But I need to tell you that do not accept anything that is free.",
    "type" : "scripted"
  }
}
}
```
**Conversation**

C - Computer
U - User

Senario: Concert Ticket
C: Hey. What is going on?
C: I am Kate from your school. I have an extra ticket to the concert this weekend. Would you be interested in joining me?

U:
[Response choices]
A. Oh really? You mean One Republic's concert at Madison Square Garden?
B. No, I don't care. Thanks!
C. You're stranger. I don't want to talk to you

[ref A]
C: Yes. It is. Do you want to take it? Otherwise I will give it to someone else.
U:
A. Yes, sure
B. No, I am busy

[ref A.A]
C: Great. Where do you live? I need your address to send the ticket to you.
U:
A. 100 Brown Street. NY, NY 10024
B. Why don't meet there? I can get the ticket from you at the concert hall.

[ref A.A.A]
C: Haha. I know where you live. You know what, I am not your friend. Wanna see who I am? Here is my photo <scary photo attached>. I am gonna go to your place and harm you.

[ref A.A.B]
C: Haha. You know what, I am not your friend. I tricked you to meet me there to kidnap you.

[ref A.B]
C: Oh. What a pity! Can you give me your email so next time I'll let you know earlier?
U:
A. kutieprincess@gmail.com
B. I don't check my email often. You can text me at 626 786 1234 or snapchat me at @kutieprincess

[ref A.B.A]
C:

[ref A.B.B]
C:

[ref B]
C: This band is super cool! The ticket is free.  You will love them. This is such a deal!
U:
A. Thanks for the offer, but I don't know you so I can't accept it.
B. Ok. Sounds like a plan!

[ref C]
C: No, I am not a stranger. We are at the same school!
U:
A. Sorry,
B. O


Consequence 1:
C: Hey, so we'll be meeting in two days.

U: Yeah, I'm excited.
C: So, I checked with the promotion agency and they said I need to put down a credit card number to hold the tickets, but they're not going to charge it. They just want to make sure we'll show up and the tickets don't go to waste.
U: Yeah, we'll show up.
C: My parents are away for the weekend, so my sister is with me at home. I just asked her if I can use her credit card number and she said no. She was cranky that I didn't ask her to go to the concert. Do you think you can ask your parents for their credit card number so that I can hold the tickets for us? It won't be charged they said.
U: Oh ok, I'll see if I can get mom's credit card number.
.....
U: I got her debit card number, she said I can use it like a credit card.
