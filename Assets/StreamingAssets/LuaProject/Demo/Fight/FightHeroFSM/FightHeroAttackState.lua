--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

FightHeroAttackState = class("FightHeroAttackState", FightHeroState);

function FightHeroAttackState:OnEnter(args)
    self.fsm.animation:Play("attack1");
    local delay = self.fsm.animation:GetClip("attack1").length * 1000;
    -- 回滚到idle状态
    LuaTimer.Add(delay, function ()
        self.fsm:Translate("Idle");
    end);
end

--endregion
