# Description

Helps set up ESLint and Prettier configs.

ESlint and Prettier recommend (or enforce) using local installations rather than global installations.

I got pretty tired of doing the same thing every time.

This shell script should do this automatically, in any npm-initialized directory!

# How to use

If this script is placed in the repository-to-initialize, it can be run with `sh setup-linter-prettier.sh`

You will also need node globally installed.

To run this globally, you'll need to drop it in your PATH as found in your env variables. You can check echo $PATH for directories that you can put this in, or add your own directory -- google elsewhere for details on how to do that.

# What it does

Currently, this script does the following:

- Install _ESLint_, _Prettier_ and _eslint-config-prettier_ from npm
- Execute the eslint --init helper. The script is currently only compatible with javascript or JSON config files (.eslintrc.js or .eslintrc.json).
- Create an empty .prettierrc file. This is necessary if your VSCode is set-up to only run prettier if it detects a config file.

//The next steps are run in javascript via node, in order to simplify editing the config file.

- Pull in a .eslintrc file -- either .js or .json work here.
- Add prettier to the extends list to use eslint-config-prettier
- Replace the .eslintrc file
