import inflect

def verse(number):
    if number == 0:
        return "{num_cap_bottles} on the wall, {num_bottles}.\n" \
               "Go to the store and buy some more, {bottles_99} on the wall.\n".format(num_cap_bottles=format_bottles(number).capitalize(),
                                                                                       num_bottles=format_bottles(number),
                                                                                       bottles_99=format_bottles(99))

    return "{num_cap_bottles} on the wall, {num_bottles}{take}{remaining} on the wall.\n".format(num_cap_bottles=format_bottles(number).capitalize(),
                                                                                                 num_bottles=format_bottles(number),
                                                                                                 take=take_string(number),
                                                                                                 remaining=format_bottles(number-1))

def format_bottles(number):
    p = inflect.engine()
    if number == 0:
        return "no more bottles of beer"
    return "{number_of_bottles} of beer".format(number_of_bottles=p.no('bottle', number) )

def take_string(number):
    subs = "one"
    if number == 1:
        subs = "it"
    return ".\nTake {sub} down and pass it around, ".format(sub=subs)

def song(verse_start, verse_end=0):
    result = ""
    for current in range(verse_start, verse_end-1, -1):
        result += "{verse}\n".format(verse=verse(current))
    return result