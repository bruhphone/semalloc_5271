#!/usr/bin/ruby -w
def buildtest
    system("./build.rb make")
    system("./convert.rb test.run")
    system("LD_PRELOAD=../backend/build/lib/libsemalloc.so ./test.run.out")
end

buildtest