#!/bin/bash

echo "Make a workpiece for your HTML project"
echo ""
read -p "Enter project name: " PROJECT_NAME
echo ""

CURR_DIR=$0
CURR_DIR=$(realpath $CURR_DIR)
CURR_DIR=$(dirname $CURR_DIR)

CGI_BIN_DIR=$CURR_DIR/$PROJECT_NAME/cgi-bin
PHP_DIR=$CURR_DIR/$PROJECT_NAME/resources/php
STYLE_DIR=$CURR_DIR/$PROJECT_NAME/resources/css
IMG_DIR=$CURR_DIR/$PROJECT_NAME/resources/images
JS_DIR=$CURR_DIR/$PROJECT_NAME/resources/js

if [ ! -d $PROJECT_NAME ]
then
    mkdir -p $CGI_BIN_DIR
    mkdir -p $PHP_DIR
    mkdir -p $STYLE_DIR
    mkdir -p $IMG_DIR
    mkdir -p $JS_DIR
fi

cp favicon.ico $IMG_DIR

HTML_FILE=$CURR_DIR/$PROJECT_NAME/'index.html'

echo '<!DOCTYPE html>' > $HTML_FILE
echo '<html lang="en">' >> $HTML_FILE
echo '  <head>' >> $HTML_FILE
echo '      <meta charset="UTF-8">' >> $HTML_FILE
echo '      <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> $HTML_FILE
echo '      <meta http-equiv="X-UA-Compatible" content="ie=firefox">' >> $HTML_FILE
echo '      <title>'$PROJECT_NAME'</title>' >> $HTML_FILE
echo '      <link rel="stylesheet" href="./resources/css/style.css">' >> $HTML_FILE
echo '      <link rel="icon" href="./resources/images/favicon.ico" type="image/x-icon">' >> $HTML_FILE
echo '  </head>' >> $HTML_FILE
echo "" >> $HTML_FILE
echo '  <body>' >> $HTML_FILE
echo '      <main>' >> $HTML_FILE
echo '          <h1 id="demo">welcome to '$PROJECT_NAME'</h1>' >> $HTML_FILE
echo '          <br />' >> $HTML_FILE
echo '          <div style="text-align: center;">' >> $HTML_FILE
echo '              <button type="button" onclick="myFunction()">Click Me</button>' >> $HTML_FILE
echo '          </div>' >> $HTML_FILE
echo '      </main>' >> $HTML_FILE
echo '      <script src="./resources/js/index.js"></script>' >> $HTML_FILE
echo '  </body>' >> $HTML_FILE
echo '</html>' >> $HTML_FILE

CSS_FILE=$STYLE_DIR/style.css

echo 'h1 {' > $CSS_FILE
echo '  color: purple;' >> $CSS_FILE
echo '  text-align: center;' >> $CSS_FILE
echo '}' >> $CSS_FILE

JS_FILE=$JS_DIR/index.js

echo 'function myFunction() {' > $JS_FILE
echo '  document.getElementById("demo").innerHTML="'$PROJECT_NAME' is changed...";' >> $JS_FILE
echo '}' >> $JS_FILE

PHP_FILE=$PHP_DIR/index.php

echo '<?php' > $PHP_FILE
echo '  echo '\''Today’s date is '\'' . date('\''Y/m/d'\'') . '\''<br /> and it’s a '\''.date('\''l'\'').'\'' today'\'';' >> $PHP_FILE
echo '?>' >> $PHP_FILE

CGI_FILE=$CGI_BIN_DIR/index.cgi

echo '#!/bin/bash' >> $CGI_FILE
echo "" >> $CGI_FILE
echo 'echo '\''Content-type: text/html'\''' >> $CGI_FILE
echo 'echo ""' >> $CGI_FILE
echo 'echo '\''<!DOCTYPE html>'\''' >> $CGI_FILE
echo 'echo '\''<html>'\''' >> $CGI_FILE
echo 'echo '\''<head>'\''' >> $CGI_FILE
echo 'echo '\''<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'\''' >> $CGI_FILE
echo 'echo '\''<title>SGI Script</title>'\''' >> $CGI_FILE
echo 'echo '\''</head>'\''' >> $CGI_FILE
echo 'echo '\''<body>'\''' >> $CGI_FILE
echo 'echo '\''<a href="../index.html">to the main page</a><br />'\''' >> $CGI_FILE
echo 'echo '\''<div style="width: 100%; font-size: 40px; font-weight: bold; text-align: center; color: darkolivegreen">'\''' >> $CGI_FILE
echo 'echo '\''CGI BASH Script Test Page'\''' >> $CGI_FILE
echo 'echo '\''</div>'\''' >> $CGI_FILE
echo 'echo '\''</body>'\''' >> $CGI_FILE
echo 'echo '\''</html>'\''' >> $CGI_FILE

exec $SHELL
