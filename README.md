# README

# Acme-Corp-Assignment

## Brief

Acme Corp. has an API service that allows registered users to fetch any information about the company and its wide array of products. It quickly became a very popular service and, to provide fair service to all users, a 10,000 API requests per-user monthly limit was added. Not long after the change, users started to report that their requests were very slow or not returning at all.


## Tasks

* Requests to Acme's API are timing out after 15 seconds. After some investigation in production, they've identified that the User#count_hits method's response time is around 500ms and is called 50 times per second (on average).
* Users in Australia are complaining they still get some “over quota” errors from the API after their quota resets at the beginning of the month and after a few hours it resolves itself.
* Acme identified that some users have been able to make API requests over the monthly limit.
* Acme's development team has reported working with the code base is difficult due to accumulated technical debt and bad coding practices. They've asked the community to help them refactor the code so it's clean, readable, maintainable, and well-tested.


## Solution

The existing code was using a Class Method to check the quota every time, when a user is trying to get the data from Acme's API.
Instead of using the class method, I have implemented a different technique to check the current user's quota.

I have add two columns in user table:
>`hit_count` : which stores the hit count of that particular user in current month.

>`hit_count_time` : which stores the time of latest hit count of the user.

>I have used this two columns while checking the quota for a user, which helps in minimizing the time taken on every API request.

>I have used the `scope` instead of `class method` in `HIT` model to implement lazy loading.

## Root Cause and Fixes

* **#1** As I have removed the `class method` which was checking the quota before, and using the value of attributes of user table, which minimized the time of checking the qouta.
* **#2** The reason behind the wrong data from API can be the preloading of the `class method`: `count_hits`. For resolving that I have used Scope.
* **#3** The reason for ***'user have been able to make API requests over the monthly limit'***, can also be the preloading, which will be resolved by changing the technique to check the quota.
* **#4** I have written down the optimized version of existing code, and also used rubocop to maintain the code quality.
