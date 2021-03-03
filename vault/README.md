# Vault challenge

I tried first from the browser console and apparently Chrome (and Firefox also) limits the
number of requests to 6 at a time, so I thought 'man, this challenge requires some
thinking', but then I tried from python and they all fired at once. I also added
the Javascript script I used in console, it should work the same, the advantage is that
you do not need 1000 threads for each request (or I should just have used asyncio for
python I guess) 