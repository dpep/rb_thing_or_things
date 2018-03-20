def thing_or_things *args, &block
  if 1 == args.count and args.first.is_a? Array
    things = args.first
    unpacked = true
  else
    things = args
    unpacked = false
  end

  res = yield things

  # check return type
  unless res.is_a? Hash
    raise TypeError.new "expected Hash, found #{res.class}: #{res}"
  end

  # ensure all things are mapped
  missing = (things - res.keys).first
  if missing
    raise KeyError.new "thing missing: #{missing} from #{block}"
  end

  # ensure there's no extra things
  extra = (res.keys - things).first
  if extra
    raise KeyError.new "extra thing: #{extra} from #{block}"
  end

  # unpack as needed
  if not unpacked and 1 == things.count
    res = res[things.first]
  end

  res
end
