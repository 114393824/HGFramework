import "UnityEngine"

--ȫ��ͷ�ļ�
class = require "Lib/middleclass.lua"
json = require "cjson" 
require "Framework/Utility.lua"
require "Framework/MsgDispatcher.lua"
require "Framework/ThriftNetMsgMgr.lua"
require "Wrapper/LuaUIEventListener.lua"
require "Wrapper/LuaResMgr.lua"
require "Wrapper/LuaSceneMgr.lua"
require "Thrift/TMemoryBuffer.lua"
require "Thrift/TBinaryProtocol.lua"
require "Config/config_ttypes.lua"
require "Config/Config.lua"

require "Service/LoginService.lua"

require "Demo/SelectHero/SelectHeroSceneLoading.lua"

data = {};

function main()
	--����cjson
	local json_text = '{"username":"hello","password":"world"}';
	local value = json.decode(json_text);
	print("Json Object : " .. value["username"] .. " : " .. value["password"]);
	local str= json.encode(value);
	print("Json String : " .. str);

	--����thrift��ʽ�����ñ�
	Config.Load();

	--����demo
	local selectHeroLoading = Utility.CreateLuaBehaviour(GameObject("SelectHeroSceneLoading"), SelectHeroSceneLoading:new());

    NetMgr.Instance():Connect("127.0.0.1", 8083);
end