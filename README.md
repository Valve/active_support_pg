active_support_pg
=================

Ever wanted to have your ActiveSupport helpers in your PostgreSQL
database?

Now you can:

### Parameterize

```sql
select parameterize('Ég elska Ísland mjög-mikið');
--------------------------
 eg-elska-sland-mjog-miki

fivesearch=# select parameterize('---**I love iceland**---');
----------------
 i-love-iceland


select parameterize('I love 中國');
--------------
 i-love
```

### Pluralize

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

### Humanize

```sql
select humanize('i_love_postgres');
-------------
I love postgres

select humanize('person_id');
-------------
Person

```

All functions are written in PG/PGSQL language.

To use them in your database, run the contents of `src/as.sql` inside your
migration:

```ruby
def up
  sql = File.read(Rails.root.join('db/scripts/as.sql'))
  execute sql
end
```

To drop them, add the contents of `src/as_drop.sql` to the `down`
section of the migration:

```ruby
def down
  sql = File.read(Rails.root.join('db/scripts/as_drop.sql'))
  execute sql
end
```

This is a work in progress, contributions are welcome.

## Running tests (requires ruby)

1. cd into the directory and `bundle install`
1. Copy the `database.yml.example` to `database.yml`
2. Change your connection settings in `database.yml`
3. Run  `rake setup` (only once)
4. Run `rake test`


## Licence

This code is MITlicenced:

Copyright (c) 2014 Valentin Vasilyev

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

