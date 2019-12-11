# Temple University Libraries Docker config for OJS

Some docker configs that wrap around https://github.com/arturluizbr/docker-pkp-ojs, optimized for migrating existing instances of OJS.

## Running in development

in the root of the repository, run:

1. docker-compose up -d`

### OJS Container
This spins up the OJS container, availabel at http://localhost:8181.

The OJS container mounts two volumes:
1. from `./ojs_files` it mounts files_dir as per [ojs configs](https://github.com/pkp/ojs/blob/9c606e4f6cc21072533e15a9e4b16147d5f9e968/config.TEMPLATE.inc.php#L204)
2. from `./ojs_public_files` it mounts the public files dir as per [ojs configs](https://github.com/pkp/ojs/blob/9c606e4f6cc21072533e15a9e4b16147d5f9e968/config.TEMPLATE.inc.php#L215)

If you have data form an existing instance of OJS, places them in these directories. 

### Mysql Container

It also creates a mysql container into which you can import data from an existing OJS database.

Exports are typically created with something like:

`mysqldump --default-character-set=utf8 <DATABASE-NAME> > <DATABASE-NAME>.sql`


To import it into the container, you can run

`mysql -u ojs -p ojs -h 127.0.0.1 -P 3307 --default-character-set=utf8 < path/to/<DATABASE-NAME>.sql`


### Upgrades

If you are upgrading the version of OJS, after building the container with the new releases code, you will need to run the OJS cli upgrade tool. You can do this by running:

`docker-compose exec ojs php tools/upgrade.php upgrade`


