This is the Drummers Practice App, that will help you to stay on a practice regimen to track you progress of each practice lesson and update it with your current/latest BMP (beats per minute)/tempo.

You, the Drummer (ie., User) will be able to:
    1) Create an account (Sign Up)
    2) Log in
    3) Log out when finished
    4) Create a public profile page
    5) Choose from an existing list of practice lessons to enter what BPM you were able to get up to today
    6) View other Drummers profile pages (whether logged in or logged out)
    7) Edit your own Profile Page
    8) Look at the Leaders Board Page, which shows which Drummer in our community is practice each of the lessons at the highest tempo. (whether logged in or logged out)
    9) Add your current practice log and goal for that particular practice
    10) Edit #9 
    11) See all the entires/logs of other Drummers, displayed with the most recent first (whether logged in or logged out)

    To operate:
    1) Clone at github
    2) run 'bundle install'
    3) run 'shotgun' to view on your local browser

Code where I got the secure random session, from Sinatra Documentation: 
    ruby -e "require 'securerandom'; puts SecureRandom.hex(64) - this did not display anything
   Got a 64 bit random hexidecimal code and dropped it into the session secret