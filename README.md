active_support_pg
=================

Ever wanted to have your ActiveSupport helpers in your PostgreSQL
database?

Now you can:

```sql
select pluralize('person');
-------------
people

select pluralize('woman');
-------------
women

select pluralize('fox');
-------------
foxes
```

All functions are written in PG/PGSQL language.

To use them in your database, run the contents of `lib/as` inside your
migration:

```ruby
sql = '
...
'
execute sql
```

This is a work in progress, contributions are welcome.

## Running tests (requires ruby)

1. cd into the directory and `bundle install`
1. Copy the `database.yml.example` to `database.yml`
2. Change your connection settings in `database.yml`
3. Run  `rake setup`
4. Run `rake test`


## Licence

This code is MITlicenced:

Copyright (c) 2014 Valentin Vasilyev

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

