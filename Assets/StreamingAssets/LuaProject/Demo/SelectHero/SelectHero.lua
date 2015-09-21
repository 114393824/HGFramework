--ѡ��Ӣ�۳����µ�Ӣ�۽ű�
SelectHero = class("SelectHero");

function SelectHero:Awake()
	self.anim = self.gameObj:GetComponent("Animation");
	UIEventListenerWrapper.AddOnClick(self.gameObj, self, self.OnClick);
end 

function SelectHero:OnClick()
	local arg = {};
	arg["id"] = self.id;
	MsgDispatcher.SendLogicMsg("SelectHero", arg);
end

function SelectHero:Select()
	--ͻ����ʾ
	self.trans:Rotate(Vector3.up, 180);
	self.trans.localScale = Vector3(1.5, 1.5, 1.5);
	self.anim:Play("attack1");
	self.anim:PlayQueued("idle");
end

function SelectHero:UnSelect()
	--������ʾ
	self.trans.localScale = Vector3.one;
	self.trans.localRotation = Quaternion.identity;
end