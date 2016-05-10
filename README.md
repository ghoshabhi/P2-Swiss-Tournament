# Swiss Tournament Round 1-2

This program will simulate the first two rounds of a Swiss Tournament. In the first round
each player will be randomly assigned to another and a win or loss will be recorded. In the second
round, those players who have one win will play one another and those with one loss will play one another. 

###Install Virtualbox###
https://www.virtualbox.org/wiki/Downloads


###Install Vagrant###
https://www.vagrantup.com/downloads

Verify that Vagrant is installed and working by typing in the terminal:

	$ vagrant -v   # will print out the Vagrant version number

###Clone the Repository###
Once you are sure that VirtualBox and Vagrant are installed correctly execute the following:

	$ git clone https://github.com/ghoshabhi/P2-Swiss-Tournament.git
	$ cd udacity-swiss-tournament
	$ cd vagrant

###Verify that these files exist in the newly cloned repository:###<br>

	--tournament             #folder containing tournament files
	----tournament.py        #file that contains the python functions which unit tests will run on
	----tournament_test.py   #unit tests for tournament.py
	----tournament.sql       #postgresql database
	--Vagrantfile            #template that launches the Vagrant environment
	--pg_config.sh           #shell script provisioner called by Vagrantfile that performs
                              some configurations 

###Launch the Vagrant Box###

	$ vagrant up   #to launch and provision the vagrant environment
	$ vagrant ssh  #to login to your vagrant environment

###Enter the Swiss Tournament###

	$ cd /
	$ cd vagrant
	$ cd tournament

###Initialize the database###

	$ psql
	vagrant=> \i tournament.sql
	vagrant=> \q


###Run the unit tests###

	$ python tournament_test.py

You should see these results:

	1. Old matches can be deleted.
	2. Player records can be deleted.
	3. After deleting, countPlayers() returns zero.
	4. After registering a player, countPlayers() returns 1.
	5. Players can be registered and deleted.
	6. Newly registered players appear in the standings with no matches.
	7. After a match, players have updated standings.
	8. After one match, players with one win are paired.
	Success!  All tests pass!

###Shutdown Vagrant machine###

	$ vagrant halt


###Destroy the Vagrant machine###

	$ vagrant destroy


###References###
* https://wiki.postgresql.org/wiki/Using_psycopg2_with_PostgreSQL
* http://bobby-tables.com
* http://www.tutorialspoint.com/postgresql
* http://www.postgresqltutorial.com
* http://initd.org/psycopg/docs/
* www.postgresql.org
* https://stackoverflow.com/questions/14880192/iterate-a-list-of-tuples

