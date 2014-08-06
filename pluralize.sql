create or replace function pluralize(input varchar)
  returns varchar
as
  $$
declare
  regexes varchar[];
  pair varchar[];
  regex varchar;
  replacement varchar;
begin
  regexes := array[
    -- uncountable
    ['^equipment$', 'equipment'],
    ['^fish$', 'fish'],
    ['^information$', 'information'],
    ['^jeans$', 'jeans'],
    ['^money$', 'money'],
    ['^police$', 'police'],
    ['^rice$', 'rice'],
    ['^series$', 'series'],
    ['^sheep$', 'sheep'],
    ['^species$', 'species'],
    -- irregular
    ['^person$', 'people'],
    ['^man$', 'men'],
    ['^woman$', 'women'],
    ['^child$', 'children'],
    -- regular
    ['(quiz)$', '\1zes'],
    ['^(oxen)$', '\1'],
    ['^(ox)$', '\1en'],
    ['^(m|l)ice$', '\1ice'],
    ['^(m|l)ouse$', '\1ice'],
    ['(matr|vert|ind)(?:ix|ex)$', '\1ices'],
    ['(x|ch|ss|sh)$', '\1es'],
    ['([^aeiouy]|qu)y$', '\1ies'],
    ['(hive)$', '\1s'],
    ['(?:([^f])fe|([lr])f)$', '\1\2ves'],
    ['sis$', 'ses'],
    ['([ti])a$', '\1a'],
    ['([ti])um$', '\1a'],
    ['(buffal|tomat)o$', '\1oes'],
    ['(bu)s$', '\1ses'],
    ['(alias|status)$', '\1es'],
    ['(octop|vir)i$', '\1i'],
    ['(octop|vir)us$', '\1i'],
    ['(radi)us$', '\1i'],
    ['^(ax|test)is$', '\1es'],
    ['s$', 's'],
    ['$', 's']
  ];
  foreach pair slice 1 in array regexes
    loop
      regex := pair[1];
      replacement := pair[2];
      if input ~* regex then
        return regexp_replace(input, regex, replacement);
      end if;
    end loop;
  return input;
end
$$ language plpgsql;

