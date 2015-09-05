--�ñհ���ʽ��װUIEventListener�ӿ�
LuaUIEventListener = {};

--ע�����¼�
--gameObj: ��Ҫע�����¼�����Ϸ����GameObject
--self: �ص�����table
--callback: �ص�����, function
--�ص����������GameObject
function LuaUIEventListener.AddOnClick(gameObj, self, callback)
	if not LuaUIEventListener.CheckCallbackNULL(gameObj, self, callback) then
        return;
    end
	UIEventListener.Get(gameObj).onClick = function ()
		callback(self, gameObj);
	end
end

--ע�����ֵ�ı��¼�
--progressBar: ��Ҫע�����ֵ�ı��UIProgressBar����UIProgressBar
--self: �ص�����table
--callback: �ص�������function
--�ص���������ǰֵ
function LuaUIEventListener.AddOnValueChange(progressBar, self, callback)
	if not progressBar then
		Logger.Error("AddOnValueChange progressBar is nil");
		return;
	end
	if not self then
		Logger.Error("AddOnValueChange progressBar is nil");
		return;
	end
	if not callback then
		Logger.Error("AddOnValueChange callback is nil");
		return;
	end
	EventDelegate.Set(progressBar.onChange, function ()
		callback(self, progressBar.value);
	end)
end

--popuplist��value�ı��¼�
--UIPopuplist: ��Ҫע��popuplistֵ�ı��UIPopuplist����UIPopuplist
--self: �ص�����table
--callback: �ص�������function
--�ص���������ǰֵ
function LuaUIEventListener.AddOnPopValueChange(popuplist, self, callback)
	if not popuplist then
		Logger.Error("AddOnPopValueChange popuplist is nil");
		return;
	end
	if not self then
		Logger.Error("AddOnPopValueChange popuplist is nil");
		return;
	end
	if not callback then
		Logger.Error("AddOnPopValueChange callback is nil");
		return;
	end
	EventDelegate.Set(popuplist.onChange, function ()
		callback(self, popuplist.value);
	end)
end

--ע����ק�¼�
--gameObj: Ҫע����ק����Ϸ����
--self: Ϊ��OOP��table����
--callback: �ص�����
function LuaUIEventListener.AddOnDrag(gameObj, self, callback)
    --TODO �������Ϸ���
    if not LuaUIEventListener.CheckCallbackNULL(gameObj, self, callback) then
        return;
    end
    UIEventListener.Get(gameObj).onDrag = function(go, delta)
        callback(self, go, delta);
    end
end

function LuaUIEventListener.CheckCallbackNULL(gameObj, self, callback)
    if not gameObj then
		Logger.Error("AddOnClick gameobject is nil");
		return false;
	end
	if not self then
		Logger.Error("AddOnClick self is nil");
		return false;
	end
	if not callback then
		Logger.Error("AddOnClick callback is nil");
		return false;
	end
    return true;
end