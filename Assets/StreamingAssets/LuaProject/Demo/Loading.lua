--���س���
Loading = class("Loading")

function Loading:Awake()
	self.tipsLabel = self.trans:Find("TipsLabel"):GetComponent("UILabel");
	self.loadingProgressBar = self.trans:Find("LoadingProgressBar"):GetComponent("UISlider");
	--ע����������Ϣ
	MsgDispatcher.RegLogicMsg("SceneLoadDone", self, self.OnLoadDone);
end

function Loading:Show()
	self.loadingProgressBar.value = 0;
end

function Loading:Update()
	self.loadingProgressBar.value = self.loadingProgressBar.value + 0.05;
end

function Loading:OnLoadDone()
	self.loadingProgressBar.value = 1;
	MsgDispatcher.UnRegLogicMsg("SceneLoadDone", self, self.OnLoadDone);
	self.gameObj:SetActive(false);
end