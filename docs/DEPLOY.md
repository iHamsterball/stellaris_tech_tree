# Deployment

### Requirment

- Python3
- Nginx or other web server you want to use
- uWSGI

### Installation

Switch to a non-privileged user or create one.

```bash
git clone https://github.com/iHamsterball/stellaris_tech_tree.git
cd stellaris_tech_tree
pip3 install -r requirement.txt
python3 manage.py migrate
```

Remember the path you put this repository at, and compile localization files.

    python3 manage.py compilelanguages

### Configuration

**[Important]Change your secret key in settings.py, and turn debug to False**

If you exposed your secret key, your server would lost many Django's security protections, and could lead to privilege escalation and remote code execution vulnerabilities.

If you leave debug on, potential attackers could gather more information about your server.

    # SECURITY WARNING: keep the secret key used in production secret!
    # Developing key, please use your *OWN* secret key instead!
    SECRET_KEY = 'YOUR SECRET KEY'

    # SECURITY WARNING: don't run with debug turned on in production!
    DEBUG = True
Nginx or Apache is used to serve static files and handle django application.

Modify the following configuration and add to your nginx config file.

    # Static Files
    location /static {
        alias /path/to/your/mysite/static; # your Django project's static files - amend as required
    }

    # Django server served on root directory
    location / {
        uwsgi_pass  unix:///tmp/stellaris.socket;# the path to your socket file
        include     uwsgi_params; # the uwsgi_params file you installed
        proxy_pass_header "Accept-Language";
    }

    # Django server served on sub directory
    location /stellaris/ {
        uwsgi_pass  unix:///tmp/stellaris.socket;# the path to your socket file
        include     uwsgi_params; # the uwsgi_params file you installed
        proxy_pass_header "Accept-Language";
    }
uWSGI can be installed by `pip3 install uwsgi`, the config file uwsgi.ini contains many custom settings, modify them freely. All you have to make sure is the user to run have permission to socket, log and pid file/folder, and your nginx.conf have the same folder.