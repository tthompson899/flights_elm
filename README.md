Software Requirements:
  1. Follow the nodejs and npm installation instructions to install these in your system.  In MacOS you can use "brew
  install nodejs" to install nodejs.

Setup:
 1. Run "npm install elm livereload chokidar-cli -g"
 2. Clone this repository
 3. Within the project directory:
    a. run "npm install"
    b. run "elm make", this should prompt you do download some elm components.
    c. run "npm run watch"

 if you want to use livereload:
   1. Install chrome livereload browser extension
   2. Navigate to the index.html file using your filemanager and open in the browser as local file.
   3. As you update any elm or html file, chrome will reload the page automatically.



