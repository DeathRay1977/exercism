def detect_anagrams(target_word, probables_list):
    return [current_word for current_word in probables_list if is_anagram(target_word.lower(), current_word.lower())]

def is_anagram(target_word, word_to_try):
    if target_word == word_to_try:
        return False
    return sort(target_word) == sort(word_to_try)

def sort(string):
    return ''.join(sorted(string))
