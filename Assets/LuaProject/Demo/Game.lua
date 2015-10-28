--ȫ��ͷ�ļ�
class = require "Lib/MiddleClass/middleclass.lua"
json = require "cjson"
require "Lib/Thrift/TMemoryBuffer.lua"
require "Lib/Thrift/TBinaryProtocol.lua"
require "Framework/Utility.lua"
require "Framework/MsgDispatcher.lua"
require "Framework/ThriftNetMsgMgr.lua"
require "Wrapper/UIEventListenerWrapper.lua"
require "Wrapper/ResMgrWrapper.lua"
require "Wrapper/SceneMgrWrapper.lua"
require "AutoGeneration/Config/Config.lua"

require "Service/LoginService.lua"

require "Demo/LoadingUI.lua"
require "Demo/Login/LoginSceneLoading.lua"
require "Demo/SelectHero/SelectHeroSceneLoading.lua"

data = {};

local GameObject = UnityEngine.GameObject;
local Debug = UnityEngine.Debug;

function main()
	Debug.LogWarning("Hello, oneRain 1");
	Debug.LogWarning("Hello, oneRain 2");
	Debug.LogWarning("Hello, oneRain 3");
	Debug.LogWarning("Hello, oneRain 4");
	Debug.LogWarning("Hello, oneRain 5");
	Debug.LogWarning("Hello, oneRain 6");
	Debug.LogWarning("Hello, oneRain 7");
	Debug.LogWarning("Hello, oneRain 8");
	Debug.LogWarning("Hello, oneRain 99");
	
	--����cjson
	local json_text = '["Skill",{"skillID":"123","casterID":"234","BulletBehavior":{"behaviorID":"222","exeEffects":[["ShangHai",{"targetID":"888","val":100}],["ZhuoShao",{"targetID":"888","val":20,"round":2}]],"triEffects":[["DunShu",{"targetID":"888","val":80}]],"removedEffectIDs":["233","111"]}}]';
	local value = json.decode(json_text);	
	local skill = value[2];
	
	--�﷨���ԣ�����GetComponentsInChildren()
	local gameGO = GameObject.Find("Game");
	local colliders = gameGO:GetComponentsInChildren("UnityEngine.BoxCollider, UnityEngine");
	for i = 1, #colliders do
		Debug.LogWarning("@@@@@@ : " .. colliders[i].name);
	end

	--����thrift��ʽ�����ñ�
	Config.Load();

    Utility.CreateLuaBehaviour(GameObject("SelectHeroSceneLoading"), SelectHeroSceneLoading:new(), "select_hero.scene", "aaa");

    --������Ϣע��
    --LoginService.Init();
	--��������demo
    --Utility.CreateLuaBehaviour(GameObject("LoginSceneLoading"), LoginSceneLoading:new(), "login.scene", "aaa");
    --NetMgr.Instance():Connect("192.168.0.22", 8083);
	
end