# How to monitor traffic to/from app (2023-11-25)

Use `sudo strace -f -e trace=network -s 10000 -p <pid>`

## Example

```python
# install flask with 'pip install Flask'
# save to e.g. foo.py
from flask import Flask; import requests
app = Flask(__name__)
@app.route("/")
def hello():
    x = requests.get('http://142.250.74.35')
    return '{"hey": "there"}'
```

Run the server: `flask --app foo run`, get pid from `ps`, then run `strace` as
above and we'll see

```
[pid <pid>] sendto(5, "GET / HTTP/1.1\r\nHost: 142.250.74.35\r\nUser-Agent: python-requests/2.25.1 ...
```

# Create new repo from cmdline (unknown date)

TBD
