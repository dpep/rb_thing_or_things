def thing_or_things *args, &block
  if 1 == args.count and args.first.is_a? Array
    things = args.first
    unpacked = true
  else
    things = args
    unpacked = false
  end

  res = yield things

  if not unpacked and 1 == things.count
    res = res[things.first]
  end

  res
end
