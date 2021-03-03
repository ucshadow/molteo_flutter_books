import requests
from threading import Thread

req_url = 'https://qcvault.herokuapp.com/unlock_safe'


def get_url(num: int):
    s = str(num)
    r = requests.post(req_url, json={'first': get_num(s, 0), 'second': get_num(s, 1), 'third': get_num(s, 2)})
    print('{} -> {}'.format(num, r.text))


def get_num(string, index):
    if index > len(string) - 1:
        return 0
    return string[index]


for i in range(1000):
    Thread(target=get_url, args=(i,)).start()
