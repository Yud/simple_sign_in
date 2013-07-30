# SimpleSignIn

## Introduction

simple_sign_in adds super simple authentication to your Ruby on Raisl app. I've created
it after I found myself recreating basic authentication from scratch 
whenever I needed to show an early stage project to someone or during staging environment setup.
Since I didn't find anything that suited my needs, I've created my own gem.

TL;DR This gem is not meant to be used in production. Use it during
early stages of development or in staging env.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_sign_in'

And then execute:

    $ bundle

## Usage

### Defining Login & Password

simple_sign_in uses two [config vars](https://devcenter.heroku.com/articles/config-vars): ENV['SIMPLE_SIGN_IN_LOGIN'] and ENV['SIMPLE_SIGN_IN_PASSWORD'].

If you're using os x you can add the following to ~/.profile file:

    export SIMPLE_SIGN_IN_LOGIN=admin
    export SIMPLE_SIGN_IN_LOGIN=password

Now you can login using the login to your app using the login 'admin'
and the password 'password'.

### Skipping Authentication

If you want skip authentcation in a specific controller, use the
skip_before_action:

    class PublicController < ApplicationController
       skip_before_action :simple_sign_in_authentication

       def index

       end
    end

### Defining Environments

By default, simple_sign_in will is turned on automaticlly in all the
three major environments (test, development and production). You can
override these deaults by adding the following line to your Application
controller:

    @@simple_sign_in_envs ||= [:test, :production]

The @@simple_sign_in_envs variable excepts an array containing the names
of the environments where it simple_sign_in should be enabled.

**You may need to restart your app for the new changes to take effect.**
