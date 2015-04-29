--# create server master1 with script='lua/master1.lua', lua_libs='lua/lua/shard.lua'
--# create server master2 with script='lua/master2.lua', lua_libs='lua/lua/shard.lua'
--# start server master1
--# start server master2
--# set connection default
wait()

shard.demo.insert{1, 'test'}
shard.demo.replace{1, 'test2'}
shard.demo.update(1, {{'=', 2, 'test3'}})
shard.demo.insert{2, 'test4'}
shard.demo.insert{3, 'test5'};
shard.demo.delete(3)

--# set connection default
wait()
box.space.demo:select()
--# set connection master1
box.space.demo:select()
--# set connection master2
box.space.demo:select()
--# set connection default

--# stop server master1
--# stop server master2
--# cleanup server master1
--# cleanup server master2
--# stop server default
--# start server default
--# set connection default
