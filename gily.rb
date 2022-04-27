#!/usr/bin/env ruby
require "tty-box"
require "tty-prompt"
require "thor"


print TTY::Box.frame "Gily, A Git Tool"
prompt = TTY::Prompt.new
#prompt.multi_select("select files to include:", choices
require 'optparse'
options = {}
  
  def push
    puts "commit message:"
    commit = gets.chomp
    `git add .`
    `git commit -m "#{commit}"`
    `git push`

  end

  def create
    files = "--public --private".split(" ")
    prompt = TTY::Prompt.new
    puts "enter name of repo to create:"
    repo_name = gets.chomp
    options = prompt.select("select privacy:", files)
    puts options
    puts "----- gh repo create "    
    `gh repo create #{repo_name} #{options}`
    puts "----- git init" 
    `git init`
    puts "----- git add all" 
    `git add .`
    puts "----- commit thing" 
    `git commit -m 'first commit'`
    puts "----- add remote" 
    `git remote add origin https://github.com/chqir/#{repo_name}.git`
    puts "----- push to remote" 
    `git push -u origin master`
    #`gh repo create #{repo_name} #{options}`
    #`git remote add origin git@github.com:chqir/#{repo_name}.git`
    #`git push -u -f origin master`
    #puts `git remote set-url origin https://github.com/chqir/#{repo_name}.git`
    
  end

  def update
    `git pull`    
  end

OptionParser.new do |parser|
  parser.on("-c", "-c", "creates a repo") do
    create()
  end
  parser.on("-u", "-u", "updates a repo") do
    update()
  end
  parser.on("-p", "-p", "pushes the most recent change") do
    push()
  end
end.parse!

