[<img src="https://cdn.anychart.com/images/logo-transparent-segoe.png?2" width="234px" alt="AnyChart - Robust JavaScript/HTML5 Chart library for any project">](https://www.anychart.com)
# R basic template
This example shows how to use Anychart library with the R programming language, Shiny web framework, and MySQL database.

## Running

To get started you need R to be installed, if you don't have it, you can visit [official R site](https://www.r-project.org/) or follow [these instructions](https://www.digitalocean.com/community/tutorials/how-to-set-up-r-on-ubuntu-14-04);
and also you need MySQL to be installed and running, if you don't have it either, please check out [MySQL download page](https://dev.mysql.com/downloads/installer/) and follow [these instructions](http://dev.mysql.com/doc/refman/5.7/en/installing.html).

To make sure that everything is ok, run the following in the command line:
```
$ R --version
R version 3.4.4 (2018-03-15) -- "Someone to Lean On"... # sample output

$ mysql --version
mysql  Ver 14.14 Distrib 5.7.21, for macos10.13 (x86_64) using  EditLine wrapper # sample output
```

Then execute the commands listed below to start this sample.

Clone the repository from github.com:
```
$ git clone git@github.com:anychart-integrations/r-basic-sample.git
```

Navigate to the repository folder:
```
$ cd r-basic-sample
```

Set up MySQL database, use -u -p flags to provide username and password:
```
$ mysql -u {USER} -p < database_backup.sql
```

Run R:
```
$ R
```

Install application dependencies, one after another and initialize the Shiny library:
```
> install.packages("shiny")

> install.packages("RMySQL")

> install.packages("jsonlite")

> library(shiny)
```
If you have some troubles with dependencies installation, read error messages carefully, e.g. to install 'RMySQL' you may need `sudo apt-get install libmysqlclient-dev` command.

And finally run the application using the absolute path to the project folder:
```
> runApp("{PATH_TO_TEMPLATE}") # e.g. runApp("~/work/r-basic-sample") 
```

Your browser will open the application automatically.

## Workspace
Your workspace should look like:
```
r-basic-sample/
    www/
        css/
            style.css       # css style
	app.R					# main application code
    database_backup.sql     # MySQL database dump
    LICENSE
    README.md
    index.html			# html template
```

## Technologies
Language - [R](https://www.r-project.org/)<br />
Web framework - [Shiny](http://shiny.rstudio.com/)<br />
Database - [MySQL](https://www.mysql.com/)<br />


## Further Learning
* [Documentation](https://docs.anychart.com)
* [JavaScript API Reference](https://api.anychart.com)
* [Code Playground](https://playground.anychart.com)
* [Technical Support](https://www.anychart.com/support)

## License
AnyChart R/Shiny/MySQL integration sample includes two parts:
- Code of the integration sample that allows to use Javascript library (in this case, AnyChart) with the R language, Shiny web framework, and MySQL database. You can edit, modify and use it with other Javascript libraries without any restrictions. It is released under [Apache 2.0 License](https://github.com/anychart-integrations/r-basic-sample/blob/master/LICENSE).
- AnyChart JavaScript library, which is released under Commercial license. You can test this plugin with the trial version of AnyChart. Our trial version is not limited by time and doesn't contain any feature limitations. Check details [here](https://www.anychart.com/buy/).

If you have any questions regarding licensing - please contact us. <sales@anychart.com>

[![Analytics](https://ga-beacon.appspot.com/UA-228820-4/Integrations/r-basic-sample?pixel&useReferer)](https://github.com/igrigorik/ga-beacon)
