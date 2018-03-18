thing_or_things
======

Making gets and multigets one and the same


#### Install
```gem install thing_or_things```


#### Usage
```
require 'thing_or_things'


def load_stuff(id_or_ids)
  thing_or_things(id_or_ids) do |ids|
    res = []

    # expensive multiget
    ids.each {|id| res[id] = id }

    res
  end
end


load_stuff 123
=> 123

load_stuff [ 4, 5, 6 ]
=> { 4 => 4, 5 => 5, 6 => 6 }
```
