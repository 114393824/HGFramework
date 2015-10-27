﻿using UnityEngine;
using System;
using LuaInterface;
using SLua;
using System.Collections.Generic;
public class Lua_ResMgr : LuaObject {
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int Init(IntPtr l) {
		try {
			ResMgr self=(ResMgr)checkSelf(l);
			var ret=self.Init();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int GetDependences(IntPtr l) {
		try {
			ResMgr self=(ResMgr)checkSelf(l);
			System.String a1;
			checkType(l,2,out a1);
			var ret=self.GetDependences(a1);
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int IsLoadedAssetBundle(IntPtr l) {
		try {
			ResMgr self=(ResMgr)checkSelf(l);
			System.String a1;
			checkType(l,2,out a1);
			var ret=self.IsLoadedAssetBundle(a1);
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int LoadRes(IntPtr l) {
		try {
			ResMgr self=(ResMgr)checkSelf(l);
			System.String a1;
			checkType(l,2,out a1);
			ResourceLoader.LoadResDoneCallback a2;
			LuaDelegation.checkDelegate(l,3,out a2);
			self.LoadRes(a1,a2);
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int LoadScene(IntPtr l) {
		try {
			ResMgr self=(ResMgr)checkSelf(l);
			System.String a1;
			checkType(l,2,out a1);
			System.Boolean a2;
			checkType(l,3,out a2);
			SceneLoader.LoadSceneDoneCallback a3;
			LuaDelegation.checkDelegate(l,4,out a3);
			SceneLoader.LoadSceneUpdateCallback a4;
			LuaDelegation.checkDelegate(l,5,out a4);
			self.LoadScene(a1,a2,a3,a4);
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int Unload(IntPtr l) {
		try {
			ResMgr self=(ResMgr)checkSelf(l);
			self.Unload();
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int get_AssetBundleFormation(IntPtr l) {
		try {
			pushValue(l,true);
			pushValue(l,ResMgr.AssetBundleFormation);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int set_AssetBundleFormation(IntPtr l) {
		try {
			System.String v;
			checkType(l,2,out v);
			ResMgr.AssetBundleFormation=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int get_AssetBundlePath(IntPtr l) {
		try {
			pushValue(l,true);
			pushValue(l,ResMgr.AppURL);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int set_AssetBundlePath(IntPtr l) {
		try {
			System.String v;
			checkType(l,2,out v);
			ResMgr.AppURL=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	static public void reg(IntPtr l) {
		getTypeTable(l,"ResMgr");
		addMember(l,Init);
		addMember(l,GetDependences);
		addMember(l,IsLoadedAssetBundle);
		addMember(l,LoadRes);
		addMember(l,LoadScene);
		addMember(l,Unload);
		addMember(l,"AssetBundleFormation",get_AssetBundleFormation,set_AssetBundleFormation,false);
		addMember(l,"AssetBundlePath",get_AssetBundlePath,set_AssetBundlePath,false);
		createTypeMetatable(l,null, typeof(ResMgr),typeof(Singleton<ResMgr>));
	}
}
