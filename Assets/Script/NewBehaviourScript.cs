﻿using UnityEngine;
using System.Collections;
using cn.sharesdk.unity3d;
using System;
public class NewBehaviourScript : MonoBehaviour 
{
	void Awake () 
	{
		ShareSDK.setCallbackObjectName("SDK");
		ShareSDK.open ("api20");
		//新浪微博
		Hashtable sinaWeiboConf = new Hashtable();
		sinaWeiboConf.Add("app_key", "568898243");
		sinaWeiboConf.Add("app_secret", "38a4f8204cc784f81f9f0daaf31e02e3");
		sinaWeiboConf.Add("redirect_uri", "http://www.sharesdk.cn");
		ShareSDK.setPlatformConfig (PlatformType.SinaWeibo, sinaWeiboConf);
		//微信朋友圈
		Hashtable weixinConf = new Hashtable();
		weixinConf.Add("app_id", "wx4868b35061f87885");
		ShareSDK.setPlatformConfig (PlatformType.WeChatTimeline, weixinConf);
		//拷贝图片
		string imagePath = Application.persistentDataPath + "/0.png";
		Debug.Log (imagePath);
		if(!System.IO.File.Exists(imagePath))
		{
			Texture2D o =  Resources.Load("0") as Texture2D;
			System.IO.File.WriteAllBytes(imagePath, o.EncodeToPNG());
		}
	}


	void Update(){
		if (Input.GetKeyDown (KeyCode.Escape)) {
			ShareSDK.close();
			Application.Quit();
		}
	}

	void OnGUI()
	{
		//分享微信
		if(GUILayout.Button("weixin",GUILayout.Width(1000), GUILayout.Height(100)))
		{
			NewBehaviourScript.TryShareMessage(PlatformType.WeChatTimeline,"Unity3D接入微信 测试。",ShareResultHandler);
		}
		//分享微博
		if(GUILayout.Button("weibo",GUILayout.Width(1000), GUILayout.Height(100)))
		{
			NewBehaviourScript.TryShareMessage(PlatformType.SinaWeibo,"Unity3D接入微博 测试。",ShareResultHandler);
		}

	}
	
	void ShareResultHandler (ResponseState state, PlatformType type, Hashtable shareInfo, Hashtable error, bool end)
	{
		if (state == ResponseState.Success)
		{
			print ("分享成功");
			print (MiniJSON.jsonEncode(shareInfo));
		}
		else if (state == ResponseState.Fail)
		{
			print ("分享失败");
			print ("fail! error code = " + error["error_code"] + "; error msg = " + error["error_msg"]);
			
		}
		else if (state == ResponseState.Cancel) 
		{
			print ("cancel !");
		}
	}


	public  static void TryShareMessage(PlatformType type,string text,ShareResultEvent ShareResultHandler)
	{
		string imagePath = Application.persistentDataPath + "/0.png";
		Hashtable content = new Hashtable();
		content["content"] = text;
		if(System.IO.File.Exists(imagePath))
		{
			content["image"] =	imagePath;
		}
		content["title"] = "创世比特公司";
		content["url"] = "http://www.baidu.com";
		content["type"] = Convert.ToString((int)ContentType.News);
		ShareResultEvent evt = new ShareResultEvent(ShareResultHandler);
		ShareSDK.shareContent (type, content, evt);
	}
}
