# Simple Sign In

## Introduction

simple_sign_in adds [super simple authentication](http://railscasts.com/episodes/21-super-simple-authentication) to your Ruby on Rails app.

I've created it after I found myself rewriting basic authentication from scratch whenever I needed to show an early stage project to someone or during staging environment setup. It is meant to be used as a temporary quick fix, which can be applied easily and removed later.

**TL;DR: This gem is not meant to be used in production. Use it during
early stages of development or in staging env.**

## Installation

Add this line to your application's Gemfile:

    gem 'simple_sign_in'

And then execute:

    $ bundle

Add the following line to config/routes.rb:

    mount SimpleSignIn::Engine => "/simple_sign_in"

Next you'll need to define your login & password. This can be done by setting two [environment variables](http://en.wikipedia.org/wiki/Environment_variable): SIMPLE_SIGN_IN_LOGIN and SIMPLE_SIGN_IN_PASSWORD.

If you're using os x or linux add the following to ~/.profile || ~/.bashrc || ~/.bash_profile file:

    export SIMPLE_SIGN_IN_LOGIN=admin
    export SIMPLE_SIGN_IN_LOGIN=password
    
Then start your server and log into the app using 'admin' and 'password'.

**Note that simple_sign_in will raise an error if these two variables have not been defined.**

## Usage

### Sign Out

If you need to add a sign out link, you can use the following:

    <%= link_to "Sign Out", 'simple_sign_in/signout', method: 'delete' if simple_sign_in_user_logged_in? %>

### Skipping Authentication

If you want skip authentcation in a specific controller, just skip the simple_sign_in_authentication action:

    class PublicController < ApplicationController
       skip_before_action :simple_sign_in_authentication

       def index
       end
    end

### Defining Environments

By default simple_sign_in works automaticlly in all three major environments (test, development and production). You can override this behavior by changing the vlaue of @@simple_sign_in_envs, which aacepts an array containing the names of the environments where simple_sign_in should be enabled.

For example, if you want simple_sign_in to work only in test and production, add the following line to application controller:

    @@simple_sign_in_envs ||= [:test, :production]

**You may need to restart your app for the new settings to take effect.**
