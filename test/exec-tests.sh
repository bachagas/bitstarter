#!/bin/bash

../grader.js --help
echo "
  Usage: grader.js [options]

  Options:

    -h, --help                 output usage information
    -c, --checks <check_file>  Path to checks.json
    -f, --file <html_file>     Path to index.html
    -u, --url <url>            URL to retrieve html

"

../grader.js -c checks-test-1.json -f test1.html
echo "
{
    ".navigation": false,
    "h1": true
}"

../grader.js -c checks-test-1.json -f test2.html
echo "
{
    ".navigation": true,
    "h1": true
}"

../grader.js -c checks-test-2.json -f test1.html 
echo "
{
    "div div div h1": true,
    "div div.subheading": true,
    "div.footer": true,
    "title": true
}"

../grader.js -c checks-test-2.json -f test2.html 
echo "
{
    "div div div h1": true,
    "div div.subheading": false,
    "div.footer": false,
    "title": true
}"

../grader.js
echo "
{
    ".navigation": true,
    "h1": true
}"

../grader.js -c checks-3.json
echo "
{
    ".about": true,
    ".blank": true,
    ".faq": true,
    ".footer": true,
    ".heading": true,
    ".logo": true,
    ".navigation": true,
    ".order": true,
    ".pitch": true,
    ".section1": true,
    ".section2": true,
    ".social": true,
    ".subheading": true,
    ".thermometer": true,
    ".video": true,
    "h1": true
}"

../grader.js -u http://stark-retreat-6911.herokuapp.com/
echo "
{
    ".navigation": true,
    "h1": true
}"

../grader.js -c checks-3.json -u http://stark-retreat-6911.herokuapp.com/
echo "
{
    ".about": true,
    ".blank": true,
    ".faq": true,
    ".footer": true,
    ".heading": true,
    ".logo": true,
    ".navigation": true,
    ".order": true,
    ".pitch": true,
    ".section1": true,
    ".section2": true,
    ".social": true,
    ".subheading": true,
    ".thermometer": true,
    ".video": true,
    "h1": true
}"

../grader.js -f arquivo-inexistente.html
echo "
arquivo-inexistente.html does not exist. Exiting!"

../grader.js -c check-inexistente.json
echo "
check-inexistente.json does not exist. Exiting!"

../grader.js -u http://nao-existe.com.br/
echo "
Error: getaddrinfo ENOTFOUND"
