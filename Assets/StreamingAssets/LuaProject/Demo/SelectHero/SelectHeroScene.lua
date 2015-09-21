require "Demo/SelectHero/SelectHero.lua"

--ѡ��Ӣ�۳���
SelectHeroScene = class("SelectHeroScene");

function SelectHeroScene:Awake()
	--�ƹ�
	self.spotLightGO = GameObject.Find("Spotlight");
	self.spotLightGO:SetActive(false);
	--Ӣ��
	self.heros = {};
	self.heros[1] = _CreateLuaBehaviour(GameObject.Find("knight"), SelectHero:new());
	self.heros[1].id = "1";
	self.heros[2] = _CreateLuaBehaviour(GameObject.Find("magician"), SelectHero:new());
	self.heros[2].id = "2";
	self.heros[3] = _CreateLuaBehaviour(GameObject.Find("priest"), SelectHero:new());
	self.heros[3].id = "3";
	--ע���¼�
	_RegLogicMsg("SelectHero", self, self.HandleSelectHeroMsg);
end

function SelectHeroScene:HandleSelectHeroMsg(arg)
    --����ѡ��Ӣ������
    data.selectHeroID = arg["id"];
	for i = 1, #self.heros do
		local hero = self.heros[i];
		if arg["id"] == hero.id then
			hero:Select();
			--���õƹ�
			if not self.spotLightGO.activeSelf then
				self.spotLightGO:SetActive(true);
			end
			self.spotLightGO.transform.position = Vector3(hero.trans.position.x, 10, 0);
		else
			hero:UnSelect();
		end
	end
end
