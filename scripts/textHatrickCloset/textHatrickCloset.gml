
main_1 = new TextNode(
    [
        new Page("H: That's cool. Cool to meet you. Umm, I mean nice to meet you.")
    ],
    choices = [
        new Choice("A: What's you name?", main_2),
        new Choice("A: Ok bye.", early_bye)
    ]
);

ask_name = new TextNode(
    [
        new Page("H: WAIT don't go I haven't talked to anyone in a really long time..."),
        new Page("A: ...")
    ],
    nextnode = main_2
)

main_2 = new TextNode(
    [
        new Page("H: I'm... umm... hat... Hat... yeah.")
    ],
    nextnode = noone
)

/*
more main_2:
choice("Nice to meet you, Hat.", hat)
choice("Short for Hatrick?", hatrick)
choice("I'm gonna call you Hatty.", hatty)
execute_code(store name)

hat:
text("Yay.")
end()

hatrick:
text("H: Yeah... yeah that sounds cool!")
text("H: Short for Hatrick.")
end()

hatty:
text("H: Oh my stars above... I... I have a nickname...")
text("H: ...")
text("H: This is the best.")
end()