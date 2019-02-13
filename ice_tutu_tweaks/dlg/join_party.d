BEGIN ~dw#sylee~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN sy_intro
SAY ~I greet you, adventurer. I am Syleen, paladin of Tyr and slayer of the undead.~
IF ~~ THEN REPLY ~What's a paladin of Tyr doing in the frozen North?~ GOTO sy_whyhere
IF ~!Class(Player1,PALADIN)~ THEN REPLY ~Honoured to meet you, Syleen. I am <CHARNAME>.~ GOTO sy_joinme
IF ~Class(Player1,PALADIN)~ THEN REPLY ~Another paladin, in these parts? I am honoured to meet you, Syleen. I am <CHARNAME>.~ GOTO sy_joinme
IF ~!Class(Player1,PALADIN)~ THEN REPLY ~Oh great, a paladin...~ GOTO sy_insult
END

IF ~~ THEN BEGIN sy_whyhere
SAY ~Perhaps nothing very worthwhile. I felt my skills would be more useful here on the border than in more civilised lands - but I wonder if I have interpreted my Lord's will correctly.~
= ~But here I am, and I am looking for companions in my travels. May I join with you?~
IF ~~ THEN REPLY ~I would welcome your aid.~ GOTO sy_hasjoined
IF ~~ THEN REPLY ~Okay, but I don't want to hear any moralising.~ GOTO sy_moralise
IF ~~ THEN REPLY ~I don't think so.~ GOTO sy_notjoined
IF ~~ THEN REPLY ~Not a chance.~ GOTO sy_insult
END

IF ~~ THEN BEGIN sy_joinme
SAY ~I had been hoping to meet like-minded folk in these parts. Might I join with you, <CHARNAME>, that we might travel a while together?~
IF ~~ THEN REPLY ~I would welcome your aid.~ GOTO sy_hasjoined
IF ~~ THEN REPLY ~Okay, but I don't want to hear any moralising.~ GOTO sy_moralise
IF ~~ THEN REPLY ~I don't think so.~ GOTO sy_notjoined
IF ~~ THEN REPLY ~Not a chance.~ GOTO sy_insult
END

IF ~~ THEN BEGIN sy_insult
SAY ~I see that my company is unwelcome. I bid you good day, then.~
IF ~~ THEN DO ~SetGlobal("insulted","LOCALS",1)~
EXIT END

IF ~~ THEN BEGIN sy_hasjoined
SAY ~Excellent - then let us be off.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN sy_moralise
SAY ~I have no intention of doing so. My disapproval will be saved for our enemies!~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN sy_notjoined
SAY ~I am disappointed. So be it, then, but I will be here for a few days longer if you change your mind.~
IF ~~ THEN EXIT END

IF ~!Global("insulted","LOCALS",1)~ THEN BEGIN sy_secondchat_noinsult
SAY ~You have returned - have you reconsidered my offer?~
IF ~~ THEN REPLY ~I have. You would be welcome to join me.~ GOTO sy_hasjoined
IF ~~ THEN REPLY ~I'm afraid not.~ GOTO sy_notjoined
IF ~~ THEN REPLY ~Not in a hundred years.~ GOTO sy_insult
END

IF ~Global("insulted","LOCALS",1)~ THEN BEGIN sy_secondchat_insult
SAY ~You return to insult me again, I see?~
IF ~~ THEN REPLY ~Not at all. I wanted to apologise for my rudeness earlier.~ GOTO sy_forgive
IF ~~ THEN REPLY ~Yep.~ GOTO sy_insult2
END

IF ~Global("insulted","LOCALS",1)~ THEN BEGIN sy_forgive
SAY ~Well, it is not my way to hold a grudge. I accept your apology.~
= ~Indeed, I would welcome the chance to join with your group. I have been hoping to meet like-minded folks in these parts.~
IF ~~ THEN REPLY ~I would welcome your aid.~ GOTO sy_hasjoined
IF ~~ THEN REPLY ~Okay, but I don't want to hear any moralising.~ GOTO sy_moralise
IF ~~ THEN REPLY ~I don't think so.~ GOTO sy_notjoined
END

IF ~~ THEN BEGIN sy_insult2
SAY ~Begone, then. I have no interest in playing your childish games. Go join the children tormenting that squirrel if such things amuse you.~
IF ~~ THEN EXIT END

BEGIN ~dw#sylep~

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN sy_kickedout
SAY ~We are to part ways then? So be it, but I would be happy to travel with you once more should the need arise.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN sy_rejoin
SAY ~You return, I see. Do you have need for my aid once more?~
IF ~~ THEN REPLY ~I would be pleased to have you travel with me again.~ GOTO sy_yesrejoin
IF ~~ THEN REPLY  ~Not at this time, no.~ GOTO sy_norejoin
END

IF ~~ THEN BEGIN sy_yesrejoin
SAY ~Excellent - then let us be off.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN sy_norejoin
SAY ~I am disappointed. Return if you change your mind.~
IF ~~ THEN EXIT END

BEGIN ~dw#ragna~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN ragnar_start
SAY ~Hail an' well met! Ragnar Thundershield at yer service.~
IF ~Gender(Player1,MALE)~ THEN REPLY ~Well met, Ragnar. I am <CHARNAME>.~ GOTO ragnar_recruit_male
IF ~Gender(Player1,FEMALE)~ THEN REPLY ~Well met, Ragnar. I am <CHARNAME>.~ GOTO ragnar_recruit_female
IF ~~ THEN REPLY ~Leave me be, dwarf.~ GOTO ragnar_rebuff
END

IF ~~ THEN BEGIN ragnar_recruit_male
SAY ~Ye look like a lad who can handle himself in a scuffle. I don't s'pose ye fancy helpin' a dwarf out with a spot o'trouble?~
IF ~~ THEN REPLY ~What kind of trouble?~ GOTO ragnar_orcs
IF ~~ THEN REPLY ~I don't think so.~ GOTO ragnar_nothanks
END

IF ~~ THEN BEGIN ragnar_recruit_female
SAY ~Ye look like a lass who can handle herself in a scuffle. I don't s'pose ye fancy helpin' a dwarf out with a spot o'trouble?~
IF ~~ THEN REPLY ~What kind of trouble?~ GOTO ragnar_orcs
IF ~~ THEN REPLY ~I don't think so.~ GOTO ragnar_nothanks
END

IF ~~ THEN BEGIN ragnar_rebuff
SAY ~Sure'n someone got out o'bed on the wrong side this morn! Well, if ye find yerself in a more agreeable temper later, maybe an' we'll talk then.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ragnar_orcs
SAY ~The orcish kind. There's a bunch of them holed up in a cave not far outside o'town, an' this dwarf ain't standing for that! What do ye say to showing those scum some steel?~
IF ~!Global("Caravan_Quest","GLOBAL",3)~ THEN REPLY ~I'd be happy to help out.~ GOTO ragnar_orcjoin
IF ~!Global("Caravan_Quest","GLOBAL",3)~ THEN REPLY ~I don't have time for this.~ GOTO ragnar_notime
IF ~!Global("Caravan_Quest","GLOBAL",3)~ THEN REPLY ~I don't think so. I've no quarrel with the orcs.~ GOTO ragnar_noquarrel
IF ~Global("Caravan_Quest","GLOBAL",3)~ THEN REPLY ~In that case, the problem is solved. I've dealt with those orcs already.~ GOTO ragnar_already
END

IF ~~ THEN BEGIN ragnar_nothanks
SAY ~Well, if ye change yer mind, ye know where ta find me.~
IF ~~ THEN DO ~SetGlobal("orcquestoffered","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN ragnar_orcjoin
SAY ~That's the kind o'talk I'm likin' to hear. Those orc bastards won't know what hit 'em!~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN ragnar_notime
SAY ~"I don't have time for this", eh? Well, if'n yer busy schedule opens up any, ye know where ta find me.~
IF ~~ THEN DO ~SetGlobal("orcquestoffered","LOCALS",2)~ EXIT
END

IF ~~ THEN BEGIN ragnar_noquarrel
SAY ~"No quarrel" with those murderin' savages. eh? Well, if'n ye ever work out what all sane men know about orcs, ye know where ta find me.~
IF ~~ THEN DO ~SetGlobal("orcquestoffered","LOCALS",2)~ EXIT 
END

IF ~~ THEN BEGIN ragnar_already
SAY ~Have ye, now? Well, in that case, ye're a <PRO_MANWOMAN> after me own heart. I'm guessin' ye'll be off to join Hrothgar's little expedition next? In that case, I'd be pleased to keep ye company on the road.~
IF ~~ THEN REPLY ~I am. And I'd be happy to have you join me.~ GOTO ragnar_expedition
IF ~~ THEN REPLY ~I'm not sure what expedition you're talking about... but I'd be happy to have you join me.~ GOTO ragnar_expedition
IF ~~ THEN REPLY ~I don't think so.~ GOTO ragnar_nojoin
END

IF ~~ THEN BEGIN ragnar_expedition
SAY ~Glad ta hear it. Then let's get movin'.~
IF ~~ THEN DO ~JoinParty()SetGlobal("orcinterject","LOCALS",4)~ EXIT
END

IF ~~ THEN BEGIN ragnar_nojoin
SAY ~Sure'n that's a shame. Well, let me know if ye change yer mind before ye leave town.~
IF ~~ THEN DO ~SetGlobal("orcquestoffered","LOCALS",3)~ EXIT
END

IF ~Global("orcquestoffered","LOCALS",1)~ THEN BEGIN ragnar_remeet1
SAY ~Well, look who's back? Changed yer mind about helpin' out, have you?~
IF ~~ THEN REPLY ~Maybe. Tell me what kind of problem you have.~ GOTO ragnar_orcs
IF ~~ THEN REPLY ~Not for the moment.~ GOTO ragnar_nothanks
END

IF ~Global("orcquestoffered","LOCALS",2)~ THEN BEGIN ragnar_remeet2
SAY ~Well, look who's back? Changed yer mind about helpin' with those orcs, have you?~
IF ~!Global("Caravan_Quest","GLOBAL",3)~ THEN REPLY ~Yes. I'd be happy to help out.~ GOTO ragnar_orcjoin
IF ~!Global("Caravan_Quest","GLOBAL",3)~ THEN REPLY ~I don't have time for this.~ GOTO ragnar_notime
IF ~!Global("Caravan_Quest","GLOBAL",3)~ THEN REPLY ~I don't think so. I've no quarrel with the orcs.~ GOTO ragnar_noquarrel
IF ~Global("Caravan_Quest","GLOBAL",3)~ THEN REPLY ~Actually, the problem is solved. I've dealt with those orcs already.~ GOTO ragnar_already
END

IF ~Global("orcquestoffered","LOCALS",3)~ THEN BEGIN ragnar_remeet3
SAY ~Well, look who's back? Changed yer mind about joinin' up wi' me?~
IF ~~ THEN REPLY ~Yes - I'd be happy to have you join me.~ GOTO ragnar_expedition
IF ~~ THEN REPLY ~No, I don't think we're suited.~ GOTO ragnar_nojoin
END

IF ~True()~ THEN BEGIN ragnar_remeet0
SAY ~Feelin' more agreeable, friend?~
IF ~~ THEN REPLY ~Yes. I'm sorry for my harsh words earlier.~ GOTO ragnar_nogrudge
IF ~~ THEN REPLY ~Not much, no.~ GOTO ragnar_rebuff2
END

IF ~~ THEN BEGIN ragnar_nogrudge
SAY ~Well, ye can make it up ta me by givin' me a bit o'help with a spot o'trouble.~
IF ~~ THEN REPLY ~What kind of trouble?~ GOTO ragnar_orcs
IF ~~ THEN REPLY ~I don't think so.~ GOTO ragnar_nothanks
END

IF ~~ THEN BEGIN ragnar_rebuff2
SAY ~Have it yer own way.~
IF ~~ THEN EXIT END 

BEGIN dw#ragnj

IF ~Global("Caravan_Quest","GLOBAL",2)Global("orcinterject","LOCALS",1)~ THEN BEGIN ragnar_interject1
SAY ~This be the orcs' cave, alright. Let's do this fast an' hard.~
IF ~~ THEN DO ~SetGlobal("orcinterject","LOCALS",2)~ EXIT 
END

IF ~Global("Caravan_Quest","GLOBAL",3)Global("orcinterject","LOCALS",3)~ THEN BEGIN ragnar_interject2
SAY ~Well, so much for them orcs. But Hrothgar'll want ta be hearin' about the caravan. That's a bad business.~
=~Ye're good in a fight, friend, I'll give yer that. I'll stick around, I reckon - it'll be good ta have some company on Hrothgar's expedition.~
IF ~~ THEN DO ~SetGlobal("orcinterject","LOCALS",4)~ EXIT
END

BEGIN dw#ragnp

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN ragnar_kickedout
SAY ~Time ta go, huh? Sure 'n it's a shame. Well, ye know where ta find me if ye change yer mind.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN ragnar_rejoin
SAY ~I knew ye'd be back. Ready ta swing a blade wi'me again?~
IF ~~ THEN REPLY ~I would be pleased to have you travel with me again.~ GOTO ragnar_yesrejoin
IF ~~ THEN REPLY  ~Not at this time, no.~ GOTO ragnar_norejoin
END

IF ~~ THEN BEGIN ragnar_yesrejoin
SAY ~That's the kind o'thing I like ta hear.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN ragnar_norejoin
SAY ~Ah, well. Ye know where ta find me if ye change yer mind.~
IF ~~ THEN EXIT END

BEGIN dw#valri

IF ~NumTimesTalkedTo(0)~ THEN BEGIN val_intro
SAY ~You need not stare, stranger. Yes, I am one of the Uthgardt - the "barbarians", as your people call us.~
IF ~~ THEN REPLY ~I wasn't staring.~ GOTO val_notstare
IF ~~ THEN REPLY ~What's one of your people doing in Easthaven?~ GOTO val_whyhere
END

IF ~~ THEN BEGIN val_notstare
SAY ~No? It seems that all around are watching me. Perhaps I have grown too sensitive. I swear, even were a dark elf to come to this town, he would not be more noticed than I.~
= ~But forgive my discourtesy. I am Vilmar Wolf-Slayer, of the Tribe of the Elk, and well met.~
IF ~~ THEN REPLY ~Well met. I am <CHARNAME>. Why have you come to Easthaven?~ GOTO val_whyhere2
IF ~~ THEN REPLY ~And why are you here, barbarian?~ GOTO val_whyhere_rude
END

IF ~~ THEN BEGIN val_whyhere
SAY ~There is suspicion in your words... but you need have no fear of my intentions. I am no raider, and I mean this town no harm.~
=
~I am Vilmar Wolf-Slayer, of the Tribe of the Elk, and I am a man of honour.~
IF ~~ THEN REPLY ~I am sure you are. I am <CHARNAME>, and well met. But what brings you to Easthaven?~ GOTO val_whyhere2
IF ~~ THEN REPLY ~No doubt. But why are you here, barbarian?~ GOTO val_whyhere_rude
END

IF ~~ THEN BEGIN val_whyhere2
SAY ~In truth, I do not know. I saw a vision of a man, frozen in a disc of stone. The shaman of my tribe told me of Jerrod's Stone and Jerrod's sacrifice.~
=
~It was a vision from Tempos, I am sure, and so I have come to this place to understand it further. But it is a mystery to me still.~
IF ~~ THEN REPLY ~So what will you do now?~ GOTO val_whatnow
IF ~~ THEN REPLY ~Who is Jerrod?~ GOTO val_jerrod
END

IF ~~ THEN BEGIN val_whyhere_rude
SAY ~From your lips, that word "barbarian" sounds ill. But I will answer you regardless.~
= ~In truth, I do not know what I am here to do. I saw a vision of a man, frozen in a disc of stone. The shaman of my tribe told me of Jerrod's Stone and Jerrod's sacrifice.~
=
~It was a vision from Tempos, I am sure, and so I have come to this place to understand it further. But it is a mystery to me still.~
IF ~~ THEN REPLY ~So what will you do now?~ GOTO val_whatnow
IF ~~ THEN REPLY ~Who is Jerrod?~ GOTO val_jerrod
END

IF ~~ THEN BEGIN val_jerrod
SAY ~It is a long story, and one which I am sure Everard the priest can tell far better than I. Ask him, if you would know more.~
=
~For myself... I wonder if our meeting here is purely chance. I sense that you are a <PRO_MANWOMAN> of destiny, not one of these meek fishermen. Might we travel together, perhaps, until my purpose is more clear?~
IF ~~ THEN REPLY ~I would be happy to have you at my side.~ GOTO val_joins
IF ~~ THEN REPLY ~I think not.~ GOTO val_nojoin
END

IF ~~ THEN BEGIN val_whatnow
SAY ~I am not certain. But there seems little point simply waiting in this town for my destiny to come. I wonder... was our meeting today mere chance?~
=~I sense that you are a <PRO_MANWOMAN> of destiny yourself, and not one of these meek fishermen. Might we travel together, perhaps, until my purpose is more clear?~
IF ~~ THEN REPLY ~I would be happy to have you at my side.~ GOTO val_joins
IF ~~ THEN REPLY ~I think not.~ GOTO val_nojoin
END

IF ~~ THEN BEGIN val_joins
SAY ~Then let it be so.~
IF ~~ THEN DO ~JoinParty()~  EXIT
END

IF ~~ THEN BEGIN val_nojoin
SAY ~Then I must remain here, and meditate until Tempos' will becomes more clear. I will be here should you think better of my offer.~ 
IF ~~ THEN EXIT END

IF ~True()~ THEN BEGIN val_back
SAY ~You return. Is your path changed? Shall we travel alongside one another?~
IF ~~ THEN REPLY ~We shall.~ GOTO val_joins
IF ~~ THEN REPLY ~Not for the moment, no.~ GOTO val_nojoin
END

BEGIN dw#valrp

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN val_kickedout
SAY ~I do not wish to part. I am still unsure of my path, but I sense it is yours too. But it is for you to decide. I hope you will reconsider soon.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN val_rejoin
SAY ~I am pleased that you return. Are we to travel together once more?~
IF ~~ THEN REPLY ~I would be honoured.~ GOTO val_yesrejoin
IF ~~ THEN REPLY  ~Not at this time, no.~ GOTO val_norejoin
END

IF ~~ THEN BEGIN val_yesrejoin
SAY ~I am glad that it is so.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN val_norejoin
SAY ~So be it. It is your choice to make.~
IF ~~ THEN EXIT END

BEGIN dw#marcu

IF ~NumTimesTalkedTo(0)~ THEN BEGIN marc_intro
SAY ~Greetings, <CHARNAME>. I have a proposition for you.~
IF ~~ THEN REPLY ~I'm willing to hear it.~ GOTO marc_prop
IF ~~ THEN REPLY ~How do you know my name?~ GOTO marc_knowname
IF ~~ THEN REPLY ~I don't have time for this now.~ GOTO marc_notime
IF ~~ THEN REPLY ~I don't think so... I don't trust you.~ GOTO marc_notrust
END

IF ~~ THEN BEGIN marc_prop
SAY ~I find myself in this remote land against my will. But there is still opportunity here.~
=
~My skills are not suited to fighting alone, not in these lands. I propose an alliance.~
IF ~~ THEN REPLY ~What sort of alliance?~ GOTO marc_alliance
IF ~~ THEN REPLY ~What do you mean, "against your will"?~ GOTO marc_whyhere
END

IF ~~ THEN BEGIN marc_knowname
SAY ~I make it my business to know all I can of the places where I find myself, be they great cities or frontier villages. I have been waiting for someone like you to come here for some weeks.~
=
~Will you hear my proposal?~
IF ~~ THEN REPLY ~I'm willing to hear it.~ GOTO marc_prop
IF ~~ THEN REPLY ~I don't have time for this now.~ GOTO marc_notime
IF ~~ THEN REPLY ~I don't think so... I don't trust you.~ GOTO marc_notrust
END

IF ~~ THEN BEGIN marc_notime
SAY ~Is that so? There is nothing happening in this town which warrants such haste... I fear it is, rather, that you do not trust me.~
IF ~~ THEN GOTO marc_notrust
END

IF ~~ THEN BEGIN marc_notrust
SAY ~And in that, you are wise: only a fool trusts one whom he has never met. Yet you have nothing to fear in mere conversation. I will be here if you reconsider.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN marc_alliance
SAY ~A surprising number of adventurers and mercenaries seem to pass through this town... yet of all those I have seen, you are the one who seems most to have promise.~
=
~I would travel with you. You will find that I am a skilled and valuable ally.~
IF ~!Global("whyhere","LOCALS",1)~ THEN REPLY ~First tell me what you're doing here.~ GOTO marc_whyhere2
IF ~~ THEN REPLY ~I agree to your proposal.~ GOTO marc_join1
IF ~~ THEN REPLY ~Okay, we'll try this... but I will be watching you.~ GOTO marc_join2
IF ~~ THEN REPLY ~I don't think I can trust you.~ GOTO marc_notrust2
IF ~~ THEN REPLY ~I'm not interested.~ GOTO marc_nojoin
END

IF ~~ THEN BEGIN marc_whyhere
SAY ~My reasons are my own, <CHARNAME>. Suffice it to say that events in the south made it advisable for me to seek a more remote locale, at least for a time.~
IF ~~ THEN REPLY ~Very well, What sort of alliance are you proposing?~ DO ~SetGlobal("whyhere","LOCALS",1)~ GOTO marc_alliance
IF ~~ THEN REPLY ~I don't think I trust you.~ DO ~SetGlobal("whyhere","LOCALS",1)~ GOTO marc_notrust
END

IF ~~ THEN BEGIN marc_notrust2
SAY ~And in that, you are wise: only a fool trusts one whom he has never met.~
=
~But a man who would betray his allies in the friendless wilderness of Icewind Dale is a greater fool yet. And I am not such a fool, <CHARNAME>.~
IF ~!Global("whyhere","LOCALS",1)~ THEN REPLY ~I want to know what you're doing here.~ GOTO marc_whyhere2
IF ~~ THEN REPLY ~I agree to your proposal.~ GOTO marc_join1
IF ~~ THEN REPLY ~Okay, we'll try this... but I will be watching you.~ GOTO marc_join2
IF ~~ THEN REPLY ~I'm not interested.~ GOTO marc_nojoin
END

IF ~~ THEN BEGIN marc_whyhere2
SAY ~My reasons are my own, <CHARNAME>. Suffice it to say that events in the south made it advisable for me to seek a more remote locale, at least for a time.~
IF ~~ THEN REPLY ~Very well, I agree to your proposal.~  DO ~SetGlobal("whyhere","LOCALS",1)~ GOTO marc_join1
IF ~~ THEN REPLY ~Okay, we'll try this... but I will be watching you.~  DO ~SetGlobal("whyhere","LOCALS",1)~ GOTO marc_join2
IF ~~ THEN REPLY ~I don't think I can trust you.~  DO ~SetGlobal("whyhere","LOCALS",1)~ GOTO marc_notrust2
IF ~~ THEN REPLY ~I'm not interested.~  DO ~SetGlobal("whyhere","LOCALS",1)~ GOTO marc_nojoin
END

IF ~~ THEN BEGIN marc_join1
SAY ~You will find that you have made a wise choice, <CHARNAME>.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN marc_join2
SAY ~If you were *not* to watch me, I would reconsider my judgment of your intelligence, <CHARNAME>.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN marc_nojoin
SAY ~Take some time to consider your decision, <CHARNAME>. I am in no hurry to leave this town.~
IF ~~ THEN DO ~SetGlobal("madeoffer","LOCALS",1)~ EXIT
END

IF ~Global("madeoffer","LOCALS",1)~ THEN BEGIN marc_back1
SAY ~We meet again, <CHARNAME>. Does your return mean that you have reconsidered my offer?~
IF ~~ THEN REPLY ~I agree to your proposal.~ GOTO marc_join1
IF ~~ THEN REPLY ~Okay, we'll try this... but I will be watching you.~ GOTO marc_join2
IF ~~ THEN REPLY ~I'm still not interested.~ GOTO marc_nojoin
END

IF ~True()~ THEN BEGIN marc_back2
SAY ~We meet again, <CHARNAME>. Does your return mean that you are now willing to hear my offer?~
IF ~~ THEN REPLY ~I'm willing to hear it.~ GOTO marc_prop
IF ~~ THEN REPLY ~How do you know my name?~ GOTO marc_knowname
IF ~~ THEN REPLY ~I don't have time for this now.~ GOTO marc_notime
IF ~~ THEN REPLY ~I don't think so... I don't trust you.~ GOTO marc_notrust
END

BEGIN dw#marcp

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN marc_kickedout
SAY ~I am sure you will reconsider before long, <CHARNAME>. It would be unwise not to do so.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN marc_rejoin
SAY ~You return. Shall we continue our alliance?~
IF ~~ THEN REPLY ~Yes, I'd like you in the group again.~ GOTO marc_yesrejoin
IF ~~ THEN REPLY  ~We're best separated for now.~ GOTO marc_norejoin
END

IF ~~ THEN BEGIN marc_yesrejoin
SAY ~Your choice is a wise one.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN marc_norejoin
SAY ~I disagree. But for the moment I will accept your decision. In due course you may realise that it would be wise to reconsider, though.~
IF ~~ THEN EXIT END

BEGIN dw#endri

IF ~NumTimesTalkedTo(0)~ THEN BEGIN end_intro
SAY ~Oh! Oh, pardon me, friend, I did not see you there.~
IF ~~ THEN REPLY ~No pardon needed. I am <CHARNAME> - and you?~ GOTO end_whopolite
IF ~~ THEN REPLY ~You seemed to be staring out across the lake. Are you looking for something?~ GOTO end_stare
IF ~~ THEN REPLY ~Next time, pay more attention. Who are you, anyway?~ GOTO end_whorude
END

IF ~~ THEN BEGIN end_whopolite
SAY ~I? I am Endricane, a priest of Lathander the Morninglord.~
IF ~~ THEN REPLY ~And what brings you to Icewind Dale, Endricane?~ GOTO end_whyhere
IF ~!Kit(Player1,GODLATHANDER)~ THEN REPLY ~I've no time for a weak god like Lathander.~ GOTO end_notime
IF ~~ THEN REPLY ~And why were you staring out across the lake?~ GOTO end_stare2
IF ~Kit(Player1,GODLATHANDER)~ THEN REPLY ~I, too, serve the Morninglord.~ GOTO end_metoo
END

IF ~~ THEN BEGIN end_stare
SAY ~No - just admiring the view. I often come here to meditate - at dawn in particular, the sunrise across the lake is glorious to behold. But even at other times, there is something beautiful about this place.~
=~I am Endricane, a priest of Lathander the Morninglord. And who might you be?~
IF ~~ THEN REPLY ~I am <CHARNAME>. What brings you to Icewind Dale, Endricane?~ GOTO end_whyhere
IF ~~ THEN REPLY ~Never mind who I am. What are you doing in Easthaven?~ GOTO end_whyhere_rude
IF ~!Kit(Player1,GODLATHANDER)~ THEN REPLY ~I am <CHARNAME>. And I've no time for a weak god like Lathander.~ GOTO end_notime
IF ~Kit(Player1,GODLATHANDER)~ THEN REPLY ~I am <CHARNAME>, and I, too, serve the Morninglord.~ GOTO end_metoo
END

IF ~~ THEN BEGIN end_whorude
SAY ~Manners are scarce here on the frontier, I have found. But I will answer your question. I am Endricane, a priest of Lathander the Morninglord.~
IF ~~ THEN REPLY ~And what brings you to Icewind Dale, Endricane?~ GOTO end_whyhere
IF ~!Kit(Player1,GODLATHANDER)~ THEN REPLY ~I've no time for a weak god like Lathander.~ GOTO end_notime
IF ~~ THEN REPLY ~And why were you staring out across the lake?~ GOTO end_stare2
IF ~Kit(Player1,GODLATHANDER)~ THEN REPLY ~I, too, serve the Morninglord.~ GOTO end_metoo
END

IF ~~ THEN BEGIN end_whyhere
SAY ~Well might you ask! I am on a pilgrimage from my home in Waterdeep - I have been tasked with spreading the light of Lathander among the frontier towns.~
=
~In truth, these pilgrimages are not a popular assignment, and many of my fellows in the clergy shun them. But I welcomed the opportunity - a chance to do some good, and not just preside over routine services in a little chapel somewhere.~
=
~But I have found it hard going, especially here in Easthaven with Tempus's church towering over the village. It is time for me to move on, I think.~
IF ~~ THEN REPLY ~Where will you go?~ GOTO end_wherego
IF ~~ THEN REPLY ~I'm looking for a good cleric - want to join up?~ GOTO end_wannajoin
IF ~~ THEN REPLY ~I must be going.~ GOTO end_mustbegoing
END

IF ~~ THEN BEGIN end_whyhere_rude
SAY ~Manners are scarce here on the frontier, I have found. But I will answer your question. I am on a pilgrimage from my home in Waterdeep - I have been tasked with spreading the light of Lathander among the frontier towns.~
=
~In truth, these pilgrimages are not a popular assignment, and many of my fellows in the clergy shun them. But I welcomed the opportunity - a chance to do some good, and not just preside over routine services in a little chapel somewhere.~
=
~But I have found it hard going, especially here in Easthaven with Tempus's church towering over the village. It is time for me to move on, I think.~
IF ~~ THEN REPLY ~Where will you go?~ GOTO end_wherego
IF ~~ THEN REPLY ~I'm looking for a good cleric - want to join up?~ GOTO end_wannajoin
IF ~~ THEN REPLY ~I must be going.~ GOTO end_mustbegoing
END

IF ~~ THEN BEGIN end_notime
SAY ~And in that view, alas, I fear you speak for most of the people here as well. They do not recognise the inner strength that the Morninglord brings.~
=
~This is why I have come here from my home in Waterdeep - I have been tasked with spreading the light of Lathander among the frontier towns.~
=
~In truth, these pilgrimages are not a popular assignment, and many of my fellows in the clergy shun them. But I welcomed the opportunity - a chance to do some good, and not just preside over routine services in a little chapel somewhere.~
=
~But I have found it hard going, especially here in Easthaven with Tempus's church towering over the village. It is time for me to move on, I think.~
IF ~~ THEN REPLY ~Where will you go?~ GOTO end_wherego
IF ~~ THEN REPLY ~I'm looking for a good cleric - want to join up?~ GOTO end_wannajoin
IF ~~ THEN REPLY ~I must be going.~ GOTO end_mustbegoing
END

IF ~~ THEN BEGIN end_stare2
SAY ~Simply the view across the water. I often come here to meditate - at dawn in particular, the sunrise across the lake is glorious to behold. But even at other times, there is something beautiful about this place.~
IF ~~ THEN REPLY ~What brings you to Icewind Dale, Endricane?~ GOTO end_whyhere
IF ~~ THEN REPLY ~Okay if you like that sort of thing, I guess. What are you doing in Easthaven?~ GOTO end_whyhere_rude
IF ~!Kit(Player1,GODLATHANDER)~ THEN REPLY ~This is why I've no time for a weak god like Lathander.~ GOTO end_notime
IF ~Kit(Player1,GODLATHANDER)~ THEN REPLY ~I, too, serve the Morninglord.~ GOTO end_metoo
END

IF ~~ THEN BEGIN end_metoo
SAY ~Praise Lathander! I am on a pilgrimage from my home in Waterdeep - I have been tasked with spreading the light of Lathander among the frontier towns.~
=
~In truth, these pilgrimages are not a popular assignment, and many of my fellows in the clergy shun them. But I welcomed the opportunity - a chance to do some good, and not just preside over routine services in a little chapel somewhere.~
=
~But I have found it hard going, especially here in Easthaven with Tempus's church towering over the village. It is time for me to move on, I think.~
IF ~~ THEN REPLY ~Where will you go?~ GOTO end_wherego
IF ~~ THEN REPLY ~I'm looking for a good cleric - want to join up?~ GOTO end_wannajoin
IF ~~ THEN REPLY ~I must be going.~ GOTO end_mustbegoing
END

IF ~~ THEN BEGIN end_wherego
SAY ~Hrothgar is leading an expedition to Kuldahar, at the edge of the mountains. It is a place I passed through on my journey north, and would visit again.~
=
~There is a place near to Kuldahar called the Vale of Shadows. They say that the sunlight does not enter that place, and that the dead walk there. Such places are anathema to my lord, and I would visit to see if there is truth in the stories.~
IF ~~ THEN REPLY ~I'm hoping to join that expedition myself. Shall we travel together?~ GOTO end_wannajoin2
IF ~~ THEN REPLY ~I must be going.~ GOTO end_mustbegoing2
END

IF ~~ THEN BEGIN end_wannajoin
SAY ~I would like that, yes. I suspect that you hope to join Hrothgar's expedition to Kuldahar, and I wish the same. It is a place I passed through on my journey north, and would visit again.~
=
~There is a place near to Kuldahar called the Vale of Shadows. They say that the sunlight does not enter that place, and that the dead walk there. Such places are anathema to my lord, and I would visit to see if there is truth in the stories.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN end_mustbegoing
SAY ~Hold a moment! You are no local fisher<PRO_MANWOMAN>, and I doubt you will be staying long in this place either. Perhaps we could travel together awhile?~
=
~Hrothgar is leading an expedition to Kuldahar, at the edge of the mountains. It is a place I passed through on my journey north, and would visit again.~
=
~There is a place near to Kuldahar called the Vale of Shadows. They say that the sunlight does not enter that place, and that the dead walk there. Such places are anathema to my lord, and I would visit to see if there is truth in the stories.~
IF ~~ THEN REPLY ~I would be happy to have you travel with me.~ GOTO end_wannajoin3
IF ~~ THEN REPLY ~I don't think it's a good idea.~ GOTO end_nodeal
END

IF ~~ THEN BEGIN end_wannajoin2
SAY ~I would like that very much, yes. May the Morninglord bless our journeys.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN end_mustbegoing2
SAY ~Hold a moment! You are no local fisher<PRO_MANWOMAN>, and I doubt you will be staying long in this place either. Perhaps we could travel together awhile?~
IF ~~ THEN REPLY ~I would be happy to have you travel with me.~ GOTO end_wannajoin3
IF ~~ THEN REPLY ~I don't think it's a good idea.~ GOTO end_nodeal
END

IF ~~ THEN BEGIN end_wannajoin3
SAY ~Then may the Morninglord bless our journeys.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN end_nodeal
SAY ~A shame... but should you change your mind, simply say. You will usually be able to find me here.~
IF ~~ THEN EXIT 
END

IF ~True()~ THEN BEGIN end_secondmeet
SAY ~You return? Does this mean you have reconsidered my offer to travel with you?~
IF ~~ THEN REPLY ~I have.~ GOTO end_wannajoin3
IF ~~ THEN REPLY ~I'm afraid not.~ GOTO end_nodeal
END

BEGIN dw#endrp

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN end_kickedout
SAY ~I am sorry that our time together is at an end - but perhaps we will travel together again.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN end_rejoin
SAY ~I am glad to see you, <CHARNAME>. Shall we travel together once again?~
IF ~~ THEN REPLY ~Yes, I'd like you in the group again.~ GOTO end_yesrejoin
IF ~~ THEN REPLY  ~We're best separated for now.~ GOTO end_norejoin
END

IF ~~ THEN BEGIN end_yesrejoin
SAY ~The blessings of Lathander be with us.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN end_norejoin
SAY ~Then I shall remain here. I hope that we meet again ere long.~
IF ~~ THEN EXIT END

BEGIN dw#elois

IF ~NumTimesTalkedTo(0)~ THEN BEGIN el_intro
SAY ~Um... this probably doesn't look good, does it?~
IF ~~ THEN REPLY ~It looks as if you're trying to steal Pomab's supplies, actually.~ GOTO el_judge
IF ~~ THEN REPLY ~Don't mind me. If you want to steal from Pomab, go right ahead.~ GOTO el_nojudge
END

IF ~~ THEN BEGIN el_judge
SAY ~Well, yes... okay, I was... but Pomab doesn't need all these things! And he's such a nasty piece of work anyway, he almost deserves it!~
=
~What - what are you going to do?~
IF ~~ THEN REPLY ~Tell Pomab, of course.~ GOTO el_tellpomab
IF ~~ THEN REPLY ~Tell Hrothgar, most probably.~ GOTO el_tellhrothgar
IF ~~ THEN REPLY ~Nothing, for now. But why are you stealing from Pomab?~ GOTO el_whysteal
IF ~~ THEN REPLY ~Nothing. You want to steal from Pomab, go right ahead.~ GOTO el_nojudge
END

IF ~~ THEN BEGIN el_nojudge
SAY ~Oh... oh, well maybe I'll keep just a couple of the scrolls, then.~
=
~Say - are you an adventurer? You sure look like one.~
IF ~~ THEN REPLY ~I'm an adventurer, yes.~ GOTO el_adv
IF ~~ THEN REPLY ~I hope to be.~ GOTO el_hope
IF ~~ THEN REPLY ~It's none of your business what I am.~ GOTO el_rude
END

IF ~~ THEN BEGIN el_tellpomab
SAY ~No! No, please don't do that! He'll hurt me, I'm sure!~
= 
~If - if you don't, I can help you!~
IF ~~ THEN REPLY ~I don't care. I'm going to Pomab.~ GOTO el_gotopomab
IF ~~ THEN REPLY ~I'm listening.~ GOTO el_canhelp
END

IF ~~ THEN BEGIN el_tellhrothgar
SAY ~Please don't! Hrothgar's a nice man, but he's terribly stern.~
=
~If - if you don't, I can help you!~
IF ~~ THEN REPLY ~I don't care. I'm going to tell him.~ GOTO el_gotohrothgar
IF ~~ THEN REPLY ~I'm listening.~ GOTO el_canhelp
END

IF ~~ THEN BEGIN el_whysteal
SAY ~Um... well, I want to be an adventurer... But - but I don't know how to start, and I thought if I could find the money to travel to one of the big cities in the south...~
IF ~~ THEN REPLY ~That doesn't justify stealing. I'm going to tell Pomab.~ GOTO el_tellpomab2
IF ~~ THEN REPLY ~That doesn't justify stealing. I'm going to tell Hrothgar.~ GOTO el_tellhrothgar2
IF ~~ THEN REPLY ~Why do you want to be an adventurer?~ GOTO el_whyadventure
IF ~~ THEN REPLY ~I might have room for another companion.~ GOTO el_whatskills
END

IF ~~ THEN BEGIN el_adv
SAY ~I've wanted to be an adventurer for a long time... but - but I don't know how to start, and I thought if I could find the money to travel to one of the big cities in the south...~
=
~But if you're an adventurer yourself, could I travel with you? And - and maybe you could teach me?~
IF ~~ THEN REPLY ~I don't think so.~ GOTO el_nojoin
IF ~~ THEN REPLY ~What skills do you have?~ GOTO el_whatskills
IF ~~ THEN REPLY ~I'd be happy to have you travel with me.~ GOTO el_happy
IF ~~ THEN REPLY ~Why do you want to be an adventurer?~ GOTO el_whyadventure2
END

IF ~~ THEN BEGIN el_hope
SAY ~I've wanted to be an adventurer for a long time... but - but I don't know how to start, and I thought if I could find the money to travel to one of the big cities in the south...~
=
~But if you're trying to become one yourself, could I travel with you? And - and maybe we could learn together?~
IF ~~ THEN REPLY ~I don't think so.~ GOTO el_nojoin
IF ~~ THEN REPLY ~What skills do you have?~ GOTO el_whatskills
IF ~~ THEN REPLY ~I'd be happy to have you travel with me.~ GOTO el_happy
IF ~~ THEN REPLY ~Why do you want to be an adventurer?~ GOTO el_whyadventure2
END

IF ~~ THEN BEGIN el_rude
SAY ~Oh - oh, I'm sorry! It's just that I've wanted to be an adventurer for a long time... but - but I don't know how to start, and I thought if I could find the money to travel to one of the big cities in the south...~
=
~And I thought, maybe if you were an adventurer, I could travel with you? And - and maybe you could teach me?~
IF ~~ THEN REPLY ~I don't think so.~ GOTO el_nojoin
IF ~~ THEN REPLY ~What skills do you have?~ GOTO el_whatskills
IF ~~ THEN REPLY ~I'd be happy to have you travel with me.~ GOTO el_happy
IF ~~ THEN REPLY ~Why do you want to be an adventurer?~ GOTO el_whyadventure2
END

IF ~~ THEN BEGIN el_gotopomab
SAY ~Oh, no! No! Then I'm not staying here to get into trouble!~
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN el_gotohrothgar
SAY ~Oh - then I'm not staying here to get into trouble!~
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN el_canhelp
SAY ~Well - I'm a bard. Well, sort of a bard. And I thought maybe, if you're an adventurer, maybe I could travel with you? And help you?~
=
~I've wanted to be an adventurer for a long time... but - but I don't know how to start, and I thought if I could find the money to travel to one of the big cities in the south... That's the only reason I was stealing, really!~
IF ~~ THEN REPLY ~I'm not interested. I'm going to tell Pomab now!~ GOTO el_gotopomab
IF ~~ THEN REPLY ~I'm not interested. I'm going to tell Hrothgar now!~ GOTO el_gotohrothgar
IF ~~ THEN REPLY ~I'd be happy to have you travel with me.~ GOTO el_happy
IF ~~ THEN REPLY ~Why do you want to be an adventurer?~ GOTO el_whyadventure3
IF ~~ THEN REPLY ~"Sort of" a bard?~ GOTO el_sortofbard
END

IF ~~ THEN BEGIN el_tellpomab2
SAY ~No! No, please don't do that! He'll hurt me, I'm sure!~
= 
~If - if you don't, I can help you!~
IF ~~ THEN REPLY ~I don't care. I'm going to Pomab~ GOTO el_gotopomab
IF ~~ THEN REPLY ~I'm listening.~ GOTO el_canhelp2
END

IF ~~ THEN BEGIN el_tellhrothgar2
SAY ~Please don't! Hrothgar's a nice man, but he's terribly stern.~
=
~If - if you don't, I can help you!~
IF ~~ THEN REPLY ~I don't care. I'm going to tell him~ GOTO el_gotohrothgar
IF ~~ THEN REPLY ~I'm listening.~ GOTO el_canhelp2
END

IF ~~ THEN BEGIN el_canhelp2
SAY ~Well - I'm a bard. Well, sort of a bard. And I thought maybe, if you're an adventurer, maybe I could travel with you? And help you?~
IF ~~ THEN REPLY ~I'm not interested. I'm going to tell Pomab now!~ GOTO el_gotopomab
IF ~~ THEN REPLY ~I'm not interested. I'm going to tell Hrothgar now!~ GOTO el_gotohrothgar
IF ~~ THEN REPLY ~I'd be happy to have you travel with me.~ GOTO el_happy
IF ~~ THEN REPLY ~Why do you want to be an adventurer?~ GOTO el_whyadventure2
IF ~~ THEN REPLY ~"Sort of" a bard?~ GOTO el_sortofbard
END

IF ~~ THEN BEGIN el_whyadventure
SAY ~Well, my dad was an adventurer - he's an elf from the south, and he used to tell me such lovely stories about his travels.~
=
~And he'd bring my mum such lovely gifts whenever he visited. And I can't bear to just stay in Easthaven and fish or clean or cook - not when I know what's out there!~
=
~And - and besides, my dad hasn't been back for years now, and he used to visit every second spring. I know my mum thinks he's dead... but - but I don't believe that! And I thought - maybe I could find him?~
IF ~~ THEN REPLY ~That doesn't justify stealing. I'm going to tell Pomab.~ GOTO el_tellpomab2
IF ~~ THEN REPLY ~That doesn't justify stealing. I'm going to tell Hrothgar.~ GOTO el_tellhrothgar2
IF ~~ THEN REPLY ~I might have room for another companion. What skills do you have?~ GOTO el_whatskills
END

IF ~~ THEN BEGIN el_whyadventure2
SAY ~Well, my dad was an adventurer - he's an elf from the south, and he used to tell me such lovely stories about his travels.~
=
~And he'd bring my mum such lovely gifts whenever he visited. And I can't bear to just stay in Easthaven and fish or clean or cook - not when I know what's out there!~
=
~And - and besides, my dad hasn't been back for years now, and he used to visit every second spring. I know my mum thinks he's dead... but - but I don't believe that! And I thought - maybe I could find him?~
IF ~~ THEN REPLY ~I might have room for another companion. What skills do you have?~ GOTO el_whatskills
IF ~~ THEN REPLY ~I'd be happy to have you travel with me.~ GOTO el_happy
IF ~~ THEN REPLY ~I'm not interested in travelling with you.~ GOTO el_nojoin
END

IF ~~ THEN BEGIN el_whyadventure3
SAY ~Well, my dad was an adventurer - he's an elf from the south, and he used to tell me such lovely stories about his travels.~
=
~And he'd bring my mum such lovely gifts whenever he visited. And I can't bear to just stay in Easthaven and fish or clean or cook - not when I know what's out there!~
=
~And - and besides, my dad hasn't been back for years now, and he used to visit every second spring. I know my mum thinks he's dead... but - but I don't believe that! And I thought - maybe I could find him?~
IF ~~ THEN REPLY ~That doesn't justify stealing. I'm going to tell Pomab.~ GOTO el_tellpomab2
IF ~~ THEN REPLY ~That doesn't justify stealing. I'm going to tell Hrothgar.~ GOTO el_tellhrothgar2
IF ~~ THEN REPLY ~I might have room for another companion. What did you mean about being "sort of a bard"?~ GOTO el_sortofbard
IF ~~ THEN REPLY ~Okay, I'm not going to tell anyone. But I don't want to travel with you either.~ GOTO el_nojoin
END

IF ~~ THEN BEGIN el_whatskills
SAY ~Well - I'm a bard. Well, sort of a bard. I mean, I can play the flute quite well, and Everard tells me I've got a nice singing voice. And - and I know a little bit of magic. Dad used to teach me - before he stopped visiting.~
IF ~~ THEN REPLY ~I'd be happy to have you travel with me.~ GOTO el_happy
IF ~~ THEN REPLY ~I'm not interested in travelling with you.~ GOTO el_nojoin
END

IF ~~ THEN BEGIN el_sortofbard
SAY ~Um... well, I mean, I can play the flute quite well, and Everard tells me I've got a nice singing voice. And - and I know a little bit of magic. Dad used to teach me - before he stopped visiting.~
IF ~~ THEN REPLY ~I'd be happy to have you travel with me.~ GOTO el_happy
IF ~~ THEN REPLY ~I'm not interested in travelling with you.~ GOTO el_nojoin
END

IF ~~ THEN BEGIN el_happy
SAY ~Oh! Oh, I'm so happy! I'll be really helpful, I will! You won't regret it! Thank you, thank you!~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN el_nojoin
SAY ~Oh... oh well, I didn't really think you'd want to. But... if you change your mind, I'm usually at the inn - I wait tables there.~
IF ~~ THEN DO ~EscapeAreaMove("ar1008",381,536,0)~ EXIT
END

IF ~True()~ THEN BEGIN el_return
SAY ~Oh, hello! Thank you again for not telling Pomab about me.~
=
~I -I don't suppose you've reconsidered?~
IF ~~ THEN REPLY ~Reconsidered letting you join me? I have. I'd be happy to travel with you.~ GOTO el_happy
IF ~~ THEN REPLY ~No, I've no interest in travelling with you.~ GOTO el_nojoin2
END

IF ~~ THEN BEGIN el_nojoin2
SAY ~Okay... I understand, I guess. Well, if you change your mind, it's not like I'm going anywhere...~
IF ~~ THEN EXIT
END

BEGIN dw#eloip

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN el_kickedout
SAY ~I have to leave? Oh - oh, okay, but I really would like to do this again sometime soon.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN el_rejoin
SAY ~You're back! Does that mean you want me back in the group?~
IF ~~ THEN REPLY ~Yes, I'd like you in the group again.~ GOTO el_yesrejoin
IF ~~ THEN REPLY  ~We're best separated for now.~ GOTO el_norejoin
END

IF ~~ THEN BEGIN el_yesrejoin
SAY ~Oh - that's marvelous! I'm so pleased to be back!~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN el_norejoin
SAY ~Okay... I guess I'll just keep waiting here, then.~
IF ~~ THEN EXIT END


BEGIN dw#morga

IF ~NumTimesTalkedTo(0)~ THEN BEGIN morg_intro
SAY ~Ah... has someone interesting finally come to this town?~
IF ~NumInPartyGT(1)~ THEN REPLY ~Who are you?~ GOTO morg_who
IF ~!NumInPartyGT(1)~ THEN REPLY ~Who are you?~ GOTO morg_whosolo
IF ~~ THEN REPLY ~I'd like to think so, yes.~ GOTO morg_interesting
IF ~NumInPartyGT(1)~ THEN REPLY ~I suppose it depends on what interests you.~ GOTO morg_itdepends
IF ~!NumInPartyGT(1)~ THEN REPLY ~I suppose it depends on what interests you.~ GOTO morg_itdependssolo
END

IF ~~ THEN BEGIN morg_who
SAY ~I? I am Morgana of Westgate songsmith and harpist. And you... of course, you must be the adventurers from Easthaven.~
IF ~~ THEN REPLY ~Yes, we are. You're a long way from home, Morgana.~ GOTO morg_farfromhome
IF ~~ THEN REPLY ~How do you know that?~ GOTO morg_howknow
IF ~~ THEN REPLY ~We could use a bard. Any interest in joining us?~ GOTO morg_caretojoin
END

IF ~~ THEN BEGIN morg_whosolo
SAY ~I? I am Morgana of Westgate songsmith and harpist. And you... of course, you must be the adventurer from Easthaven.~
IF ~~ THEN REPLY ~Yes, we are. You're a long way from home, Morgana.~ GOTO morg_farfromhome
IF ~~ THEN REPLY ~How do you know that?~ GOTO morg_howknow
IF ~~ THEN REPLY ~We could use a bard. Any interest in joining us?~ GOTO morg_caretojoin
END


IF ~~ THEN BEGIN morg_interesting
SAY ~How delightful... I am Morgana of Westgate, songsmith and harpist, and your coming has brightened my day... considerably.~
IF ~~ THEN REPLY ~I'm glad to hear that, but why?~ GOTO morg_whyinterest
IF ~~ THEN REPLY ~I don't have time for this~ GOTO morg_notime
IF ~~ THEN REPLY ~We could use a bard. Any interest in joining us?~ GOTO morg_caretojoin
END

IF ~~ THEN BEGIN morg_itdepends
SAY ~*Novelty* interests me. I am Morgana of Westgate, songsmith and harpist.  And you... of course, you must be the adventurers from Easthaven.~
IF ~~ THEN REPLY ~Yes, we are. You're a long way from home, Morgana.~ GOTO morg_farfromhome
IF ~~ THEN REPLY ~How do you know that?~ GOTO morg_howknow
IF ~~ THEN REPLY ~We could use a bard. Any interest in joining us?~ GOTO morg_caretojoin
END

IF ~~ THEN BEGIN morg_itdependssolo
SAY ~*Novelty* interests me. I am Morgana of Westgate, songsmith and harpist.  And you... of course, you must be the adventurers from Easthaven.~
IF ~~ THEN REPLY ~Yes, we are. You're a long way from home, Morgana.~ GOTO morg_farfromhome
IF ~~ THEN REPLY ~How do you know that?~ GOTO morg_howknow
IF ~~ THEN REPLY ~We could use a bard. Any interest in joining us?~ GOTO morg_caretojoin
END

IF ~~ THEN BEGIN morg_farfromhome
SAY ~I am indeed... but I tired so quickly of the south, where it seems as though every song which could be written is written already. But here on the frontier... here, things are different.~
=
~Here, Tymora willing, I will see things beyond the dreams of civilised men. Here, I will write a song that is truly new.~
IF ~~ THEN REPLY ~And how do you plan to do that?~ GOTO morg_howdothat
IF ~~ THEN REPLY ~We could use a bard. Any interest in joining us?~ GOTO morg_caretojoin
IF ~~ THEN REPLY ~Fascinating, I'm sure, but I need to be going.~ GOTO morg_notime2
END

IF ~~ THEN BEGIN morg_howknow
SAY ~It is the talk of the town... your reputation precedes you. And I am far from home, seeking the aventure that one such as you might have to offer.~
=
~I tired so quickly of the south, where it seems as though every song which could be written is written already. But here on the frontier... here, things are different.~
=
~I would travel with you awhile, if you would have my aid... and in years to come, they will sing of you in every tavern in the Realms.~
IF ~~ THEN REPLY ~I like the sound of that.~ GOTO morg_likesound
IF ~~ THEN REPLY ~Fame doesn't interest me - but I could use your aid.~ GOTO morg_useaid
IF ~~ THEN REPLY ~I don't think so, no.~ GOTO morg_nodeal
END

IF ~~ THEN BEGIN morg_caretojoin
SAY ~I have *much* interest... I am here in the North, far from home, in search of someone or something truly worth a song. In your company... perhaps I might find it.~
=
~Yes, I will travel with you awhile... and in years to come, perhaps, they will sing of you in every tavern in the Realms.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN morg_whyinterest
SAY ~Because I am far from home, seeking the adventure that one such as you might have to offer.~
=
~I tired so quickly of the south, where it seems as though every song which could be written is written already. But here on the frontier... here, things are different.~
=
~I would travel with you awhile, if you would have me... and in years to come, they will sing of you in every tavern in the Realms.~
IF ~~ THEN REPLY ~I like the sound of that.~ GOTO morg_likesound
IF ~~ THEN REPLY ~Fame doesn't interest me - but I could use your aid.~ GOTO morg_useaid
IF ~~ THEN REPLY ~I don't think so, no.~ GOTO morg_nodeal
END

IF ~~ THEN BEGIN morg_notime
SAY ~Such a pity... for I have much time for you and your story.~
=
~I tired so quickly of the south, where it seems as though every song which could be written is written already. But here on the frontier... here, things are different.~
=
~I would travel with you awhile, if you would have my aid... and in years to come, they will sing of you in every tavern in the Realms.~
IF ~~ THEN REPLY ~I like the sound of that.~ GOTO morg_likesound
IF ~~ THEN REPLY ~Fame doesn't interest me - but I could use your aid.~ GOTO morg_useaid
IF ~~ THEN REPLY ~I don't think so, no.~ GOTO morg_nodeal
END

IF ~~ THEN BEGIN morg_notime2
SAY ~Such a pity... for I have much time for you and your story.~
=
~I would travel with you awhile, if you would have my aid... and in years to come, they will sing of you in every tavern in the Realms.~
IF ~~ THEN REPLY ~I like the sound of that.~ GOTO morg_likesound
IF ~~ THEN REPLY ~Fame doesn't interest me - but I could use your aid.~ GOTO morg_useaid
IF ~~ THEN REPLY ~I don't think so, no.~ GOTO morg_nodeal
END

IF ~~ THEN BEGIN morg_howdothat
SAY ~Why, I thought that here I might meet those whose deeds might be worth a song. And perhaps... perhaps I have.~
=
~I would travel with you awhile, if you would have my aid... and in years to come, they will sing of you in every tavern in the Realms.~
IF ~~ THEN REPLY ~I like the sound of that.~ GOTO morg_likesound
IF ~~ THEN REPLY ~Fame doesn't interest me - but I could use your aid.~ GOTO morg_useaid
IF ~~ THEN REPLY ~I don't think so, no.~ GOTO morg_nodeal
END

IF ~~ THEN BEGIN morg_likesound
SAY ~Well, then, let our saga begin...~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN morg_useaid
SAY ~Fame has its way of catching one's eye... we shall see if you can resist its lure.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN morg_nodeal
SAY ~Perhaps I misjudged you... perhaps your fate is to be but a footnote in someone else's saga.~
=
~If you tire of your obscurity, you know where I am to be found.~
IF ~~ THEN EXIT
END

IF ~NumInPartyGT(1)~ THEN BEGIN morg_back
SAY ~My self-effacing friends return... have you reconsidered the allure of fame?~
IF ~~ THEN REPLY ~I have. I would be pleased to have you write our song.~ GOTO morg_likesound
IF ~~ THEN REPLY ~No, but I would like your aid anyway.~ GOTO morg_useaid
IF ~~ THEN REPLY ~I've no interest in travelling with you.~ GOTO morg_nointerest
END

IF ~!NumInPartyGT(1)~ THEN BEGIN morg_backsolo
SAY ~My self-effacing friend returns... have you reconsidered the allure of fame?~
IF ~~ THEN REPLY ~I have. I would be pleased to have you write our song.~ GOTO morg_likesound
IF ~~ THEN REPLY ~No, but I would like your aid anyway.~ GOTO morg_useaid
IF ~~ THEN REPLY ~I've no interest in travelling with you.~ GOTO morg_nointerest
END

IF ~~ THEN BEGIN morg_nointerest
SAY ~I see. Return to your obscurity, then.~
IF ~~ THEN EXIT
END

BEGIN dw#morgp

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN morg_kickedout
SAY ~To separate with my saga but half complete... it is a trial.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN morg_rejoin
SAY ~You return. Shall I again sing of our triumphs and discoveries?~
IF ~~ THEN REPLY ~Yes, I'd like you in the group again.~ GOTO morg_yesrejoin
IF ~~ THEN REPLY  ~We're best separated for now.~ GOTO morg_norejoin
END

IF ~~ THEN BEGIN morg_yesrejoin
SAY ~Fate calls us, then.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN morg_norejoin
SAY ~I tire of your fickle ways... but you will return, I am sure.~
IF ~~ THEN EXIT END

BEGIN dw#elyvi

IF ~NumTimesTalkedTo(0)~ THEN BEGIN elyv_intro
SAY ~New guests? ... I did not see you come in.~
IF ~~ THEN REPLY ~You seem distracted, milady.~ GOTO elyv_distracted
IF ~~ THEN REPLY ~Who are you?~ GOTO elyv_whoyou
IF ~~ THEN REPLY ~Call yourself a ranger?~ GOTO elyv_ranger
END

IF ~~ THEN BEGIN elyv_distracted
SAY ~Distracted... yes, I am that. I just heard about the Easthaven expedition.~
IF ~~ THEN REPLY ~We came on that expedition ourselves, actually.~ GOTO elyv_onexpedition
IF ~~ THEN REPLY ~What about the expedition?~ GOTO elyv_whataboutexpedition
END

IF ~~ THEN BEGIN elyv_whoyou
SAY ~I? I am Elyvir. Elyvir Blacksheaf, ranger of Everaska.~
IF ~OR(2)Global("dw#erevaindead","GLOBAL",1)Global("Erevain_met","GLOBAL",1)~ THEN REPLY ~Blacksheaf? Are you related to Erevain?~ GOTO elyv_relative
IF ~~ THEN REPLY ~Pleased to meet you. I am <CHARNAME>. What brings you to Kuldahar, Elyvir?~ GOTO elyv_whykuld
IF ~~ THEN REPLY ~You seem distracted, Elyvir.~ GOTO elyv_distracted
IF ~~ THEN REPLY ~And why are you here, elf?~ GOTO elyv_whykuld
END

IF ~~ THEN BEGIN elyv_ranger
SAY ~I am distracted... I just heard about the Easthaven expedition.~
IF ~~ THEN REPLY ~We came on that expedition ourselves, actually.~ GOTO elyv_onexpedition
IF ~~ THEN REPLY ~What about the expedition?~ GOTO elyv_whataboutexpedition
END

IF ~~ THEN BEGIN elyv_onexpedition
SAY ~You did? Then have you seen word of my brother Erevain? Erevain Blacksheaf?~
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I'm sorry, milady. Erevain is dead. I found his body in the caverns of Dragon's Eye.~ GOTO elyv_dead
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~He's been eaten by beetles, actually. So much for the famed elven combat prowess.~ GOTO elyv_rudedead
IF ~!Global("dw#erevaindead","GLOBAL",1)Global("Erevain_met","GLOBAL",1)~ THEN REPLY ~I saw him in Easthaven a few days back, before the avalanche sealed the pass.~ GOTO elyv_seenhim
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~No, I'm afraid not.~ GOTO elyv_whylook
END

IF ~~ THEN BEGIN elyv_whataboutexpedition
SAY ~Only... I am looking for my brother Erevain. Erevain Blacksheaf. I know he had intended to travel to the Dale, and I thought perhaps he might be in the Ten Towns, but now that the pass is sealed...~
=
~He and I separated a year ago - I had always planned to follow him after my business in the south was done, but time slipped past.~
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I'm sorry, milady. Erevain is dead. I found his body in the caverns of Dragon's Eye.~ GOTO elyv_dead
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~He's been eaten by beetles, actually. So much for the famed elven combat prowess.~ GOTO elyv_rudedead
IF ~!Global("dw#erevaindead","GLOBAL",1)Global("Erevain_met","GLOBAL",1)~ THEN REPLY ~I saw him in Easthaven a few days back, before the avalanche sealed the pass.~ GOTO elyv_seenhim
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~Do you want help looking for your brother?~ GOTO elyv_wanthelp
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I don't have time for this.~ GOTO elyv_notime
END

IF ~~ THEN BEGIN elyv_whykuld
SAY ~I am looking for my brother Erevain. Erevain Blacksheaf. I know he had intended to travel to the Dale, and I thought perhaps he might be in the Ten Towns, but now that the pass is sealed...~
=
~He and I separated a year ago - I had always planned to follow him after my business in the south was done, but time slipped past.~
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I'm sorry, milady. Erevain is dead. I found his body in the caverns of Dragon's Eye.~ GOTO elyv_dead
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~He's been eaten by beetles, actually. So much for the famed elven combat prowess.~ GOTO elyv_rudedead
IF ~!Global("dw#erevaindead","GLOBAL",1)Global("Erevain_met","GLOBAL",1)~ THEN REPLY ~I saw him in Easthaven a few days back, before the avalanche sealed the pass.~ GOTO elyv_seenhim
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~Do you want help looking for your brother?~ GOTO elyv_wanthelp
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I don't have time for this.~ GOTO elyv_notime
END

IF ~~ THEN BEGIN elyv_dead
SAY ~Oh - oh, it cannot be true! ... but it is. I sense its truth. Oh my brother...~
=
~Tell me, do you know how he fell?~
IF ~~ THEN REPLY ~He tried to cross the Kuldahar pass, to learn more about what evils were threatening the town. I don't know after that, but I think he must have tracked the creatures of Dragon's Eye to their lair.~ GOTO elyv_gooddeath
IF ~~ THEN REPLY ~He was eaten by beetles, actually. So much for the famed elven combat prowess.~ GOTO elyv_nobody
END

IF ~~ THEN BEGIN elyv_rudedead
SAY ~Oh - oh, how can you say such things? ... but I sense its truth. Oh, my brother...~
=
~Where is his body? Tell me!~
IF ~~ THEN REPLY ~In Dragon's Eye.~ GOTO elyv_body
IF ~~ THEN REPLY ~Why should I bother?~ GOTO elyv_nobody
END

IF ~~ THEN BEGIN elyv_relative
SAY ~I am, yes! You must have seen Erevain - where is he?~
IF ~~ THEN REPLY ~I saw him in Easthaven a few days back, before the avalanche blocked the pass.~ GOTO elyv_whylook
END

IF ~~ THEN BEGIN elyv_whylook 
SAY ~I knew he had intended to travel to the Dale, and I thought perhaps he might be in the Ten Towns, but now that the pass is sealed...~
=
~He and I separated a year ago - I had always planned to follow him after my business in the south was done, but time slipped past.~
IF ~~ THEN REPLY ~Do you want help looking for your brother?~ GOTO elyv_wanthelp
IF ~~ THEN REPLY ~I don't have time for this.~ GOTO elyv_notime
END

IF ~~ THEN BEGIN elyv_wanthelp
SAY ~Yes - yes, I would like that very much. Erevain has a good heart and good instincts - I am sure he will try to do something about the evil that has come to the North, and I fear for his safety alone.~
=
~Shall I travel with you? I am a ranger, and though I have little experience of these northern lands, my skills may still be of use.~
IF ~~ THEN REPLY ~Yes, travel with us.~ DO ~JoinParty()~ EXIT
IF ~~ THEN REPLY ~I don't have need for a companion at the moment - but we'll bring you word of your brother if we find him.~ GOTO elyv_nojoin
END

IF ~~ THEN BEGIN elyv_nojoin
SAY ~I am grateful. And you will most likely find me here if you wish my company at some later time.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN elyv_notime
SAY ~If you hear word of my brother, please, tell me. I fear for him.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN elyv_seenhim
SAY ~Really! Oh, thank you, travellers... but I curse this avalanche. The Kuldahar pass will not be easy to traverse before winter.~
IF ~~ THEN REPLY ~Do you want help looking for your brother?~ GOTO elyv_wanthelp
IF ~~ THEN REPLY ~I don't have time for this.~ GOTO elyv_notime
END

IF ~~ THEN BEGIN elyv_gooddeath
SAY ~It... it is a comfort, at least... to know that he died in a noble cause. So like him.~
=
~I... would travel with you, if you would have me. Revenge is not my people's way, but I would learn more of the evil that claimed my brother's life.~
IF ~~ THEN REPLY ~You would be welcome to do so.~ DO ~JoinParty()~ EXIT
IF ~~ THEN REPLY ~I don't have need for your help at the moment.~ GOTO elyv_nojoindead
END

IF ~~ THEN BEGIN elyv_body
SAY ~Then I will go there at once - I would learn more of my brother's fate.~
=
~As for you - I thank you, I suppose, for your news, and ... forgive your cruelty.~
IF ~~ THEN DO ~AddXP2DA("Level_3_Easy")EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN elyv_nobody
SAY ~Why so cruel? Why? Curse you, curse you - Get out of my sight! Go!~ 
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN elyv_nojoindead
SAY ~I understand. I will search for myself then. Perhaps we will meet again, but I doubt it. Thank you again for your aid.~ 
IF ~~ THEN DO ~AddXP2DA("Level_3_Average")EscapeArea()~ EXIT
END

IF ~True()~ THEN BEGIN elyv_intro2
SAY ~Hello again - have you word of my brother?~
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I'm sorry, Elyvir. Erevain is dead. I found his body in the caverns of Dragon's Eye.~ GOTO elyv_dead
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~He's been eaten by beetles, actually. So much for the famed elven combat prowess.~ GOTO elyv_rudedead
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~No - but I'd like to search for him, with your help. Will you join me?~ GOTO elyv_join
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I'm afraid not. Farewell.~ GOTO elyv_notime
END

IF ~~ THEN BEGIN elyv_join
SAY ~Yes - yes, I am grateful. Let us go at once!~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

BEGIN dw#elyvp

IF ~Global("kickedout","LOCALS",0)!GlobalGT("dw#erevaindead","GLOBAL",0)~ THEN BEGIN elyv_kickedout
SAY ~I hope we travel again very soon - I still fear for my brother. Bring me word, if you find him.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",0)GlobalGT("dw#erevaindead","GLOBAL",0)~ THEN BEGIN elyv_kickedout2
SAY ~I am sorry we must part. I still crave answers - what is the evil responsible for Erevain's death?~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END


IF ~Global("kickedout","LOCALS",1)!GlobalGT("dw#erevaindead","GLOBAL",0)~ THEN BEGIN elyv_rejoin
SAY ~Do you have news of my brother?~
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I'm sorry, Elyvir. Erevain is dead. I found his body in the caverns of Dragon's Eye.~ GOTO elyv_dead_d
IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~He's been eaten by beetles, actually. So much for the famed elven combat prowess.~ GOTO elyv_rudedead_d
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~No - but I'd like to search for him, with your help. Will you join me?~ GOTO elyv_yesrejoin
IF ~!Global("dw#erevaindead","GLOBAL",1)~ THEN REPLY ~I'm afraid not. Farewell.~ GOTO elyv_norejoin
END

IF ~Global("kickedout","LOCALS",1)GlobalGT("dw#erevaindead","GLOBAL",0)~ THEN BEGIN elyv_rejoin
SAY ~I am pleased to see you once more. Shall we rejoin our search for the evil that haunts these mountains?~
IF ~~ THEN REPLY ~Yes, I'd be pleased to have you in the group.~ GOTO elyv_yesrejoin
IF ~~ THEN REPLY ~I don't need your help for the moment.~ GOTO elyv_norejoin
END

IF ~~ THEN BEGIN ~elyv_yesrejoin~
SAY ~I am grateful. Let us go at once!~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN ~elyv_norejoin~
SAY ~So be it - I shall remain here for now.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ~elyv_norejoin2~
SAY ~So be it - I shall remain here for now.~
IF ~~ THEN DO ~AddXP2DA("Level_3_Average")~ EXIT
END

IF ~~ THEN BEGIN elyv_dead_d
SAY ~Oh - oh, it cannot be true! ... but it is. I sense its truth. Oh my brother...~
=
~Tell me, do you know how he fell?~
IF ~~ THEN REPLY ~He tried to cross the Kuldahar pass, to learn more about what evils were threatening the town. I don't know after that, but I think he must have tracked the creatures of Dragon's Eye to their lair.~ GOTO elyv_gooddeath_d
IF ~~ THEN REPLY ~He was eaten by beetles, actually. So much for the famed elven combat prowess.~ GOTO elyv_nobody_d
END

IF ~~ THEN BEGIN elyv_rudedead_d
SAY ~Oh - oh, how can you say such things? ... but I sense its truth. Oh, my brother...~
=
~Where is his body? Tell me!~
IF ~~ THEN REPLY ~In Dragon's Eye.~ GOTO elyv_body_d
IF ~~ THEN REPLY ~Why should I bother?~ GOTO elyv_nobody_d
END


IF ~~ THEN BEGIN elyv_gooddeath_d
SAY ~It... it is a comfort, at least... to know that he died in a noble cause. So like him.~
=
~I... would travel with you, if you would have me. Revenge is not my people's way, but I would learn more of the evil that claimed my brother's life.~
IF ~~ THEN REPLY ~You would be welcome to do so.~ DO ~AddXP2DA("Level_3_Average")JoinParty()~ EXIT
IF ~~ THEN REPLY ~I don't have need for your help at the moment.~ GOTO elyv_norejoin2
END

IF ~~ THEN BEGIN elyv_body_d
SAY ~Then I will go there at once - I would learn more of my brother's fate.~
=
~As for you - I thank you, I suppose, for your news, and ... forgive your cruelty.~
IF ~~ THEN DO ~AddXP2DA("Level_3_Easy")EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN elyv_nobody_d
SAY ~Why so cruel? Why? Curse you, curse you - Get out of my sight! Go!~ 
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

BEGIN dw#elyvj

IF ~Global("dw#erevaindead","GLOBAL",1)~ THEN BEGIN  elyv_journal
SAY ~This... this is my brother's journal. Then this... no. No!~
=
~Oh, Erevain, what have they done to you? You were so handsome...~
=
~Help me. We can at least lay his body to rest properly here.~
IF ~~ THEN DO ~SetGlobal("dw#erevaindead","GLOBAL",1)StartCutSceneMode()StartCutScene("dw#erev")~ EXIT
END

IF ~Global("dw#erevaindead","GLOBAL",2)~ THEN BEGIN  elyv_buried
SAY ~It is done, then. His spirit will rest now.~
=
~It... it is a comfort, at least... to know that he died in a noble cause. So like him.~
=
~I... would travel with you, if you would have me. Revenge is not my people's way, but I would learn more of the evil that claimed my brother's life.~
IF ~~ THEN DO ~AddXP2DA("Level_3_Average")~ EXIT
END

ADD_TRANS_TRIGGER dorrick 3 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 4
ADD_TRANS_TRIGGER dorrick 4 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 2
ADD_TRANS_TRIGGER dorrick 5 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 2
ADD_TRANS_TRIGGER dorrick 6 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 2
ADD_TRANS_TRIGGER dorrick 7 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 2
ADD_TRANS_TRIGGER dorrick 8 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 1
ADD_TRANS_TRIGGER dorrick 9 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 1
ADD_TRANS_TRIGGER dorrick 14 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 3
ADD_TRANS_TRIGGER dorrick 15 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 2
ADD_TRANS_TRIGGER dorrick 16 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 1
ADD_TRANS_TRIGGER dorrick 17 ~!Global("dw#ilaunaoffer","GLOBAL",0)~ DO 2

APPEND dorrick

IF ~!NumTimesTalkedTo(0)!GlobalGT("dw#ilaunaoffer","GLOBAL",1)~ THEN BEGIN orrick_offer
SAY ~One moment... if you really are planning on traipsing across the mountains for the good of Kuldahar, there may be something I can do for you after all.~
=
~Ilauna! Come here for a moment, girl!~
IF ~~ THEN DO ~StartCutSceneMode()StartCutScene("dw#orila")~ EXIT END


END

ADD_STATE_TRIGGER dorrick 18 ~Global("dw#ilaunaoffer","GLOBAL",3)~
ADD_STATE_TRIGGER dorrick 19 ~Global("dw#ilaunaoffer","GLOBAL",3)~


EXTEND_BOTTOM dorrick 3  4  5 17
IF ~Global("dw#ilaunaoffer","GLOBAL",0)~ THEN REPLY ~Very well. Then I shall disturb you no further. Farewell.~ DO ~SetGlobal("dw#ilaunaoffer","GLOBAL",1)~ GOTO orrick_offer
END

EXTEND_BOTTOM dorrick 6  7
IF ~Global("dw#ilaunaoffer","GLOBAL",0)~ THEN REPLY ~Whatever. I think I'll be on my way now. Farewell.~ DO ~SetGlobal("dw#ilaunaoffer","GLOBAL",1)~ GOTO orrick_offer
END

EXTEND_BOTTOM dorrick 8  9
IF ~Global("dw#ilaunaoffer","GLOBAL",0)~ THEN REPLY ~Fascinating. Well, I'd best be off. Farewell.~ DO ~SetGlobal("dw#ilaunaoffer","GLOBAL",1)~ GOTO orrick_offer
END

EXTEND_BOTTOM dorrick 14
IF ~Global("dw#ilaunaoffer","GLOBAL",0)~ THEN REPLY ~Never mind. Farewell.~ DO ~SetGlobal("dw#ilaunaoffer","GLOBAL",1)~ GOTO orrick_offer
END

EXTEND_BOTTOM dorrick 15 16
IF ~Global("dw#ilaunaoffer","GLOBAL",0)~ THEN REPLY ~I'll remember that. Farewell.~ DO ~SetGlobal("dw#ilaunaoffer","GLOBAL",1)~ GOTO orrick_offer
END

BEGIN dw#ilaun

IF ~~ THEN BEGIN il_nojoin
SAY ~I suppose it is your choice to make. Return if you change your mind.~
IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN il_return
SAY ~Should I infer from your return that I may join your company after all?~
IF ~~ THEN REPLY ~Yes. Welcome to the group!~ GOTO il_join
IF ~~ THEN REPLY ~I'm afraid not, no.~ GOTO il_nojoin
END


CHAIN
  IF ~~ THEN dw#ilaun il_join
~I am delighted to have this opportunity.~
=
~Master Orrick, thank you for trusting me this way, and for all you have taught me.~
== dorrick
~Yes, yes, girl. Just be off with you and take these would-be-heroes with you.~
=
~And keep yourself safe.~
END
IF ~~ THEN DO ~ActionOverride("dw#ilaun",JoinParty())~ EXIT



CHAIN
  IF ~Global("dw#ilaunaoffer","GLOBAL",2)~ THEN dorrick orrick_ilauna_chain
~This is my apprentice, Ilauna. It's about time she had some practical experience.~
=
~Ilauna, I've taught you about all I can without you going out into the world and actually practising your magic, not just studying it.~
=
~These folks are adventurers, and they're here to get to the bottom of Kuldahar's problems. I'm sure they will have room for one of your talents.~
== dw#ilaun
~You are sure that I am ready for this, master Orrick?~
== dorrick
~Certainly, girl. You are very talented, but bookwork only takes you so far. And in any case, I think you can probably help my researches more this way than as my assistant.~
=
~We both know that there are hidden treasures in these mountains. If you find any sign of the mythal, be sure to return and let me know.~
== dw#ilaun
~I would be honoured to be accepted into your company, <PRO_SIRMAAM>.~
END
IF ~~ THEN REPLY ~Then welcome.~ DO ~SetGlobal("dw#ilaunaoffer","GLOBAL",3)~ EXTERN dw#ilaun il_join
IF ~~ THEN REPLY ~I'm sorry, but I don't have need for your services at the moment.~ DO ~SetGlobal("dw#ilaunaoffer","GLOBAL",3)~ EXTERN dw#ilaun il_nojoin

BEGIN dw#ilaup

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN il_kickedout
SAY ~I am sorry that my abilities have not been to your satisfaction. I hope you will reconsider before long.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN il_rejoin
SAY ~Do I take it that you have reconsidered your evaluation of my use to you?~
IF ~~ THEN REPLY ~Yes, I could really use your help.~ GOTO il_yesrejoin
IF ~~ THEN REPLY  ~Not for now, at least.~ GOTO il_norejoin
END

IF ~~ THEN BEGIN il_yesrejoin
SAY ~Then my talents are at your command once more.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN il_norejoin
SAY ~So be it. I hope a time comes soon when you reconsider your assessment, though.~
IF ~~ THEN EXIT END



BEGIN ~dw#korif~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN kori_intro
SAY ~Say, you're lookin' mighty unfamiliar. Haven't just come inta town with the Easthaven expedition, have ye?~
IF ~~ THEN REPLY ~We're all that's left of the expedition.~ GOTO kori_allleft
IF ~~ THEN REPLY ~What's it to you?~ GOTO kori_whatsit
END

IF ~~ THEN BEGIN kori_allleft
SAY ~Speak sense, <PRO_MANWOMAN>! What are ye talkin' about?~ 
IF ~~ THEN REPLY ~The expedition was ambushed by frost giants in the Kuldahar pass. No-one else survived.~ GOTO kori_ambushnice
IF ~~ THEN REPLY ~I don't need this, okay? We were attacked by giants, nearly everyone else is dead!~ GOTO kori_ambushnasty
END

IF ~~ THEN BEGIN kori_whatsit
SAY ~I'm Kori Fire-Eye, o' clan Battlehammer, up in the Dale. We had word that Hrothgar was sendin' some people, thought we'd send a few of our own. Hasn't worked out so well.~
IF ~~ THEN REPLY ~What do you mean?~ GOTO kori_notsowell
IF ~~ THEN REPLY ~We're all that's left of the expedition.~ GOTO kori_allleft2
END

IF ~~ THEN BEGIN kori_ambushnice
SAY ~Clangeddin's beard! Me companions an' me went the same way not five days past.~
IF ~~ THEN GOTO kori_ambushcommon
END

IF ~~ THEN BEGIN kori_ambushnasty
SAY ~Simmer down, I meant no offence. And ye're not the only ones who've tangled wi'those giants. Me companions went the same way not five days past.~
IF ~~ THEN GOTO kori_ambushcommon
END

IF ~~ THEN BEGIN kori_ambushcommon
SAY ~I'm Kori Fire-Eye, o' clan Battlehammer, up in the Dale. We had word that Hrothgar was sendin' some people, thought we'd send a few of our own. Didn't work out so well, damn giants attacked us ten miles north o' Kuldahar. Only me left.~
=
~Well, me leader told me pretty plain what I was to do - meet up wi' the Easthaven folks, offer me services. I guess that's you know. Not what I was expecting.~
IF ~~ THEN REPLY ~We could certainly use your help.~ GOTO kori_joinup
IF ~~ THEN REPLY ~What are you doing in this smithy, anyway?~ GOTO kori_whysmithy
IF ~~ THEN REPLY ~We don't need your help at the moment.~ GOTO kori_nojoin
END


IF ~~ THEN BEGIN kori_notsowell
SAY ~Ran into a group o'frost giants ten miles north o'Kuldahar. Most of us didn't make it - only me an' our leader Dorur, an'he died o'his wounds before makin' it to the town.~
=
~He said, get to Kuldahar, find Hrothgar, join up wi'his people, offer me services. So can ye point me ta him?~
IF ~~ THEN REPLY ~Hrothgar is dead. Giants attacked our expedition, too - we're the only survivors.~ GOTO kori_ustoo
END

IF ~~ THEN BEGIN kori_ustoo
SAY ~Clangeddin's beard! There's somethin' bad afoot in these moutains, that's fer sure.~
IF ~~ THEN GOTO kori_ambushcommon2
END

IF ~~ THEN BEGIN kori_allleft2
SAY ~Speak sense, <PRO_MANWOMAN>! What are ye talkin' about?~
IF ~~ THEN REPLY ~The expedition was ambushed by frost giants in the Kuldahar pass. No-one else survived.~ GOTO kori_ambushnice2
IF ~~ THEN REPLY ~I don't need this, okay? We were attacked by giants, nearly everyone else is dead!~ GOTO kori_ambushnasty2
END

IF ~~ THEN BEGIN kori_ambushnice2
SAY ~Clangeddin's beard! Me companions an' me went the same way not five days past.~
IF ~~ THEN GOTO kori_ambushcommon2
END

IF ~~ THEN BEGIN kori_ambushnasty2
SAY ~Simmer down, I meant no offence. And ye're not the only ones who've tangled wi'those giants. Me companions went the same way not five days past.~
IF ~~ THEN GOTO kori_ambushcommon2
END

IF ~~ THEN BEGIN kori_ambushcommon2
SAY ~Well, me leader told me pretty plain what I was to do - meet up wi' the Easthaven folks, offer me services. I guess that's you now. Not what I was expecting.~
IF ~~ THEN REPLY ~We could certainly use your help.~ GOTO kori_joinup
IF ~~ THEN REPLY ~What are you doing in this smithy, anyway?~ GOTO kori_whysmithy
IF ~~ THEN REPLY ~We don't need your help at the moment.~ GOTO kori_nojoin
END

IF ~~ THEN BEGIN kori_joinup
SAY ~Let's get movin' then. Looks like we both got some scores ta settle.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN kori_whysmithy
SAY ~Ah, Conlan an' me go way back. I was helpin' out fer a few days, just ta fill in the time afore Hrothgar showed up.~
=
~So, what's it ta be - do ye need me or not?~
IF ~~ THEN REPLY ~We could certainly use your help.~ GOTO kori_joinup
IF ~~ THEN REPLY ~We don't need your help at the moment.~ GOTO kori_nojoin
END

IF ~~ THEN BEGIN kori_nojoin
SAY ~Well, that's a shame an' no mistake, but it's your group - I guess ye know best. Ye change yer mind, ye know where ta find me.~
IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN kori_intro2
SAY ~Good ta see you back in one piece! Changed yer mind, have ye?~
IF ~~ THEN REPLY ~We could certainly use your help.~ GOTO kori_joinup
IF ~~ THEN REPLY ~We don't need your help at the moment.~ GOTO kori_nojoin
END


BEGIN dw#korip

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN kori_kickedout
SAY ~Well, it's up ta you, I guess, but there's a lot more ta do in these mountains.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN kori_rejoin
SAY ~Finally, ye're back. Let's get movin' then!~
IF ~~ THEN REPLY ~Sounds good to me.~ GOTO kori_yesrejoin
IF ~~ THEN REPLY  ~I don't think so - I don't have need of your skills right now.~ GOTO kori_norejoin
END

IF ~~ THEN BEGIN kori_yesrejoin
SAY ~Ye're not the only one.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN kori_norejoin
SAY ~Should'a known - luck's not wi'me this season. Be seein' ya, then.~
IF ~~ THEN EXIT END

BEGIN dw#arris

IF ~NumTimesTalkedTo(0)~ THEN BEGIN ar_intro
SAY ~An adventuring party in town? At last, the Seldarine see fit to smile on me!~
=
~I am Arris Carthimon, and I wish to join your group.~
IF ~~ THEN REPLY ~Well, we could use a wizard.~  GOTO ar_needwizard
IF ~~ THEN REPLY ~We don't have room for a wizard in the group.~ GOTO ar_needwizard
IF ~~ THEN REPLY ~Why do you want to join us?~ GOTO ar_whyjoin
END

IF ~~ THEN BEGIN ar_needwizard
SAY ~But I am no wizard. I am a sorcerer - arcane magic is in my blood, not just in my mind.~
=
~I wish to understand the nature of my power more - and I am sure that only through testing my magic will I truly grasp its essence - and its limits.~
IF ~~ THEN REPLY ~You're welcome to do so at my side.~ GOTO ar_join
IF ~~ THEN REPLY ~Well, we might have a space for you - but don't take any risks.~ GOTO ar_norisk
IF ~~ THEN REPLY ~We haven't got space for you at the moment.~ GOTO ar_nospace
IF ~~ THEN REPLY ~Sorcery? That sounds pretty dangerous - count us out.~ GOTO ar_notrust
END

IF ~~ THEN BEGIN ar_whyjoin
SAY ~Because I wish to understand the nature of my power. I am a sorcerer - magic is in my blood, not just in my mind.~
=
~I am sure that only through testing my magic will I truly grasp its essence - and its limits.~
IF ~~ THEN REPLY ~You're welcome to do so at my side.~ GOTO ar_join
IF ~~ THEN REPLY ~Well, we might have a space for you - but don't take any risks.~ GOTO ar_norisk
IF ~~ THEN REPLY ~We haven't got space for you at the moment.~ GOTO ar_nospace
IF ~~ THEN REPLY ~Sorcery? That sounds pretty dangerous - count us out.~ GOTO ar_notrust
END

IF ~~ THEN BEGIN ar_join
SAY ~You will not regret this choice. The elements themselves will serve at my command, and strike our enemies with their fury!~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN ar_norisk
SAY ~Ah, but risk is the essence of power! Yet I am no fool. You may be assured, I understand well the need for caution.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN ar_nospace
SAY ~Ah! Such ignominy - for so petty a reason, you turn away from my power. So be it.~
=~There is little chance other adventurers will come to this place before the spring - I will be here, no doubt, if your mood changes.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ar_notrust
SAY ~Your prejudice does you a disservice - my powers are fully under my command, for all that I understand little of them.~
=~There is little chance other adventurers will come to this place before the spring - I will be here, no doubt, if your mood changes.~
IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN ar_intro2
SAY ~I hope that your return bodes well for both of us. Shall I probe the depths of my sorcery at your side?~
IF ~~ THEN REPLY ~You're welcome to join us.~ GOTO ar_join
IF ~~ THEN REPLY ~Well, we might have a space for you - but don't take any risks.~ GOTO ar_norisk
IF ~~ THEN REPLY ~We haven't got space for you at the moment.~ GOTO ar_nospace
IF ~~ THEN REPLY ~Sorcery? That sounds pretty dangerous - count us out.~ GOTO ar_notrust
END


BEGIN dw#arrip

IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN ar_kickedout
SAY ~Separate? When there is still so much to learn? Let it be so, then, but I hope that it is for a short while only.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN ar_rejoin
SAY ~It is past time that we rejoined, is it not?~
IF ~~ THEN REPLY ~Yes, I'd like you in the group again.~ GOTO ar_yesrejoin
IF ~~ THEN REPLY  ~For the moment, I don't have space for you.~ GOTO ar_norejoin
END

IF ~~ THEN BEGIN ar_yesrejoin
SAY ~Your choice is a wise one - my powers are at your command once more!~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN ar_norejoin
SAY ~Then, I suppose, I shall remain idle here a while longer.~
IF ~~ THEN EXIT END


BEGIN dw#moran

IF ~!Global("gotsomewhere","LOCALS",1)~ THEN BEGIN mor_intro
SAY ~Ah... you are the travellers who spoke with Arundel. Hold a moment, I would have words with you.~
IF ~~ THEN REPLY ~What do you want?~ DO ~SetGlobal("gotsomewhere","LOCALS",1)~ GOTO mor_what
IF ~~ THEN REPLY ~Who are you?~ DO ~SetGlobal("gotsomewhere","LOCALS",1)~  GOTO mor_who
IF ~~ THEN REPLY ~Sorry, we're very busy people.~ GOTO mor_busy
END

IF ~~ THEN BEGIN mor_what
SAY ~I am sure that Arundel has asked you to learn what troubles this region. This is my goal also.~
IF ~~ THEN REPLY ~That is what he asked, but what's your reason for interest?~ GOTO mor_whycare
IF ~~ THEN REPLY ~Before we go any further, who are you anyway?~ GOTO mor_who2
END

IF ~~ THEN BEGIN mor_who
SAY ~I? I am Moranir. But it is *what* I am that is most important. I am a druid of the Neverwinter Wood, and it is my purpose to rid this land of the evil that assails it.~
IF ~!Global("arundelatodds","LOCALS",1)~ THEN REPLY ~If you're a druid, why didn't you talk to Arundel yourself?~ DO ~SetGlobal("arundelatodds","LOCALS",1)~ GOTO mor_whynottalk
IF ~~ THEN REPLY ~And what do you want with me?~ GOTO mor_what2
IF ~!Global("neverwinterquestion","LOCALS",1)~ THEN REPLY ~If you're from Neverwinter, what are you doing in Icewind Dale?~ DO ~SetGlobal("neverwinterquestion","LOCALS",1)~ GOTO mor_whydale
END

IF ~~ THEN BEGIN mor_busy
SAY ~I see. Return when you are less so, then.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN mor_whycare
SAY ~Because I, too, am a druid. I am Moranir, druid of the Neverwinter Wood, and it is my purpose to rid this land of the evil that assails it.~
IF ~!Global("arundelatodds","LOCALS",1)~ THEN REPLY ~If you're a druid, why didn't you talk to Arundel yourself?~ DO ~SetGlobal("arundelatodds","LOCALS",1)~ GOTO mor_whynottalk
IF ~!Global("neverwinterquestion","LOCALS",1)~ THEN REPLY ~If you're from Neverwinter, what are you doing in Icewind Dale?~ DO ~SetGlobal("neverwinterquestion","LOCALS",1)~ GOTO mor_whydale
IF ~~ THEN REPLY ~In that case, you're welcome to join us.~ GOTO mor_join
IF ~~ THEN REPLY ~But we don't have need for your aid at the moment.~ GOTO mor_nojoin
END

IF ~~ THEN BEGIN mor_who2
SAY ~I? I am Moranir. But it is *what* I am that is most important. I am a druid of the Neverwinter Wood, and it is my purpose to rid this land of the evil that assails it.~
IF ~!Global("arundelatodds","LOCALS",1)~ THEN REPLY ~If you're a druid, why didn't you talk to Arundel yourself?~ DO ~SetGlobal("arundelatodds","LOCALS",1)~ GOTO mor_whynottalk
IF ~!Global("neverwinterquestion","LOCALS",1)~ THEN REPLY ~If you're from Neverwinter, what are you doing in Icewind Dale?~ DO ~SetGlobal("neverwinterquestion","LOCALS",1)~ GOTO mor_whydale
END

IF ~~ THEN BEGIN mor_whynottalk
SAY ~Arundel's order and mine are ... at odds. We differ about the best way to defend the balance. His way is that of the oak - strong and safe, but so slow.~
=
~Ours is the way of the wolf, of the falcon. If the Balance is threatened, it must be fought for, swiftly and fiercely!~
=
~I had hoped to have Arundel's aid myself, but I am content to aid his allies in their turn.~
IF ~~ THEN REPLY ~In that case, you're welcome to join us.~ GOTO mor_join
IF ~~ THEN REPLY ~But we don't have need for your aid at the moment.~ GOTO mor_nojoin
IF ~!Global("neverwinterquestion","LOCALS",1)~ THEN REPLY ~If you're from Neverwinter, what are you doing in Icewind Dale?~ DO ~SetGlobal("neverwinterquestion","LOCALS",1)~ GOTO mor_whydale
END

IF ~~ THEN BEGIN mor_what2
SAY ~I had hoped to ally myself with Arundel and his followers - together we could strike out at the evil which threatens the Balance.~
~But Arundel's order and mine are ... at odds. We differ about the best way to defend the balance. His way is that of the oak - strong and safe, but so slow.~
=
~Ours is the way of the wolf, of the falcon. If the Balance is threatened, it must be fought for, swiftly and fiercely!~
=
~I had hoped to have Arundel's aid myself, but I am content to aid his allies in their turn.~
IF ~~ THEN REPLY ~In that case, you're welcome to join us.~ GOTO mor_join
IF ~~ THEN REPLY ~But we don't have need for your aid at the moment.~ GOTO mor_nojoin
IF ~!Global("neverwinterquestion","LOCALS",1)~ THEN REPLY ~If you're from Neverwinter, what are you doing in Icewind Dale?~ DO ~SetGlobal("neverwinterquestion","LOCALS",1)~ GOTO mor_whydale
END

IF ~~ THEN BEGIN mor_whydale
SAY ~I have felt for these past months that something was wrong. A strange scent upon the air, carrying the scent of storms that should not be. Flocks of birds from the northern reaches, migrating earlier than is custom.~
=
~Even the earth has whispered to me of late, telling of evils stirring within its depths. Something is wrong, and the source of the disturbance is here, in the North. ~
=
~My druidic order does not believe in staying passive while threats to nature grow and fester. I took it on myself to travel here, and find the meaning behind these portents.~
IF ~~ THEN REPLY ~In that case, you're welcome to join us.~ GOTO mor_join
IF ~~ THEN REPLY ~But we don't have need for your aid at the moment.~ GOTO mor_nojoin
IF ~!Global("arundelatodds","LOCALS",1)~ THEN REPLY ~If you're a druid, why didn't you talk to Arundel yourself?~ DO ~SetGlobal("arundelatodds","LOCALS",1)~ GOTO mor_whynottalk
END

IF ~~ THEN BEGIN mor_join
SAY ~I am glad that it is so. Let us seek out the threats to this land together.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN mor_nojoin
SAY ~Then I must remain here. Alone, I will be no match for that which lurks in the dark places of these mountains. But you are unwise to reject my skills. If you come to realise this, return to me here.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN mor_nojoin2
SAY ~A force rises that will pervert the works of man and nature alike - I am sure of it now. I hope that you will reconsider your folly ere long.~
IF ~~ THEN EXIT
END


IF ~True()~ THEN BEGIN mor_intro2
SAY ~I hope your return indicates that you have learned wisdom, and will seek my aid after all against the evil that lurks here?~
IF ~~ THEN REPLY ~I could use your help.~ GOTO mor_join
IF ~~ THEN REPLY ~Sorry, I still don't need you in the group.~ GOTO mor_nojoin2
END

BEGIN dw#morap


IF ~Global("kickedout","LOCALS",0)~ THEN BEGIN mor_kickedout
SAY ~This choice sits ill with me. The earth itself is in pain and calls for my aid. Return swiftly and call me again to your side.~
IF ~~ THEN DO ~SetGlobal("kickedout","LOCALS",1)~ EXIT END

IF ~Global("kickedout","LOCALS",1)~ THEN BEGIN mor_rejoin
SAY ~There is a taint upon the wind, and a fell purpose behind the storms. Your return is timely.~
IF ~~ THEN REPLY ~Yes, I'd like you in the group again.~ GOTO mor_yesrejoin
IF ~~ THEN REPLY  ~For the moment, I don't have space for you.~ GOTO mor_norejoin
END

IF ~~ THEN BEGIN mor_yesrejoin
SAY ~Then let us depart once more. Nature's enemies will fear her guardians' wrath ere long.~
IF ~~ THEN DO ~JoinParty()~
EXIT END

IF ~~ THEN BEGIN mor_norejoin
SAY ~It is an ill choice you make.~
IF ~~ THEN EXIT END
