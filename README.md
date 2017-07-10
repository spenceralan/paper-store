# Rails Paper Store

This app is unlikely to save the world. But it will help you keep track of every review you have ever left on a product (that is in this store)!

With user authentication and authorization, users can easily navigate between products and add reviews that are instantly tied to their accounts! If a user has a special admin account, they have the power to add new products and even delete user reviews!

Users will even have the option of viewing all the reviews they have left on one convenient page.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby 2.4.1
Bundler

### Installing

Installation is quick and easy! You can clone this repository to your machine and host it locally! 

Once it is cloned, navigate to the root of the project and run:

```shell
bundle
```

When that finishes set up the database with the command:

```shell
bundle exec rake db:setup
```

NOTE: Due to the random seed data this step may fail validations. In the unlinkely event it fails, run the above command again.

When the database is successfully setup it is time to run the app!

```shell
bundle exec rails server
```

The default host path is http://localhost:3000


NOTE: There are two basic accounts that come alone with the test database.

#### User
* username: testuser
* password: 123456

#### Admin
* username: admin
* password: admin123456

## Built With

* Ruby
* Rails
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/

## Authors

* Spencer Alan

## License

MIT License

Copyright (c) 2017 Spencer Alan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.