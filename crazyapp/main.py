import requests, time

def main():
    ret = requests.get('https://httpbin.org/get?t=%s' % int(time.time()))
    print(ret.text)


if __name__ == '__main__':
    main()