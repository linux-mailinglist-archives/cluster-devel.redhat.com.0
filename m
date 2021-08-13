Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0038E3EB097
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Aug 2021 08:50:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-nU-WAJGSNTKf1Fr_YL8tGQ-1; Fri, 13 Aug 2021 02:50:04 -0400
X-MC-Unique: nU-WAJGSNTKf1Fr_YL8tGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE3161082924;
	Fri, 13 Aug 2021 06:50:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5723860939;
	Fri, 13 Aug 2021 06:50:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BA754BB7C;
	Fri, 13 Aug 2021 06:50:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17D6nNX0014986 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Aug 2021 02:49:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DDA020BEDCC; Fri, 13 Aug 2021 06:49:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48C1620BEDDD
	for <cluster-devel@redhat.com>; Fri, 13 Aug 2021 06:49:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD6DD185A794
	for <cluster-devel@redhat.com>; Fri, 13 Aug 2021 06:49:19 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-154-kK2UiE5IPWqXTsbTKXmNkg-1;
	Fri, 13 Aug 2021 02:49:17 -0400
X-MC-Unique: kK2UiE5IPWqXTsbTKXmNkg-1
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-7-LHvudgM8OIK5k2PnEdhV9A-1; Fri, 13 Aug 2021 08:49:15 +0200
X-MC-Unique: LHvudgM8OIK5k2PnEdhV9A-1
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com (2603:10a6:20b:f8::21)
	by AM7PR04MB6885.eurprd04.prod.outlook.com (2603:10a6:20b:10d::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16;
	Fri, 13 Aug 2021 06:49:14 +0000
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71]) by
	AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71%4]) with mapi id 15.20.4415.015;
	Fri, 13 Aug 2021 06:49:14 +0000
To: David Teigland <teigland@redhat.com>
References: <AM6PR04MB6488E4D6F12BFB4B91BE9E45CFF89@AM6PR04MB6488.eurprd04.prod.outlook.com>
	<CAK-6q+hXb=hBHHgS94M94aS7JCeCuUrwVH=05oJoxt3tFatDyw@mail.gmail.com>
	<74009531-f6ef-4ef9-b969-353684006ddc@suse.com>
	<20210812174523.GC1757@redhat.com>
From: Gang He <ghe@suse.com>
Message-ID: <a8800dfb-a253-5b43-f47c-bd5b9076c2ae@suse.com>
Date: Fri, 13 Aug 2021 14:49:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
In-Reply-To: <20210812174523.GC1757@redhat.com>
X-ClientProxiedBy: HK2PR02CA0152.apcprd02.prod.outlook.com
	(2603:1096:201:1f::12) To AM6PR04MB6488.eurprd04.prod.outlook.com
	(2603:10a6:20b:f8::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.67.20.87] (60.251.47.115) by
	HK2PR02CA0152.apcprd02.prod.outlook.com (2603:1096:201:1f::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14
	via Frontend Transport; Fri, 13 Aug 2021 06:49:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5935be6-4ec7-4f7e-072d-08d95e267682
X-MS-TrafficTypeDiagnostic: AM7PR04MB6885:
X-Microsoft-Antispam-PRVS: <AM7PR04MB68853784584F04E6B8A314CECFFA9@AM7PR04MB6885.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: WBs4PSvfYJd4CGLd5kmSx7JS2Q8EgM1fgtmYKu/3QoFTCgKeUYqtku04beWrdNLWEHDizxSHIYdbxQb4lFidp9zWVnzfxhh8sQIHpojIN4h0oTEUMmIGKauqRDgrFTZWqRqNoz+5OxVIlC2GHWfxc0oFAoQN2Xa14lickdl+dnojNTGzYgnLgCSxgiTsz4c/MXfRKN/7IcF2o0hz9ppA7yE+glyFu4t05zna4qbEIJUJfe0Z9KSfT0OMHgFVmxRx0yD4V0TlvQ6+HTxzhw119CVKr+U160SQiZ1uA7QujN+eh0+ANWl4+hmdSoe+uDa9fUUBmCFTkoC9AyiLb1sD7AZgsTRj57O7MMFIgP9X8bw8kUPSBdQVltf9nD5QAU45YVQcLdtFarm5tqoyVWb/n3n6zpp1ulhMb48n2RvPrbB+5xjHQMjzV54qsM0Gv/RnbLVCxVuHb5pb0FyewBvX/msjHfFaJHLBs6wd7ZjQ2DLU96jdId1RtfJslieNGBKU+YuX07mfRLFd5omwaexzuo7wgQ+uEq/7osvv3Oz+F/vgb1oqU8f9O2SmfolprH248hSj0f72hLCQTVZOdln0ybBS+phBoaxkXcjTuPAZgdaLVM7RhsP1c1VTnz2G7ebB9j2joh+hYSFmk7GyUT/yIsEeqbA9kbw1YRrZxX6w1xCSRcFzFv87gFMoKvf0Rjo1Sveij1JITllfbx4mUnove33FxDuiIEg0sqlcbgeedpc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM6PR04MB6488.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(346002)(136003)(396003)(376002)(366004)(39850400004)(36756003)(31686004)(450100002)(26005)(66556008)(186003)(66476007)(2616005)(956004)(2906002)(31696002)(316002)(6666004)(38100700002)(6916009)(5660300002)(478600001)(6486002)(16576012)(4326008)(86362001)(55236004)(53546011)(83380400001)(8936002)(66946007)(8676002)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnhiWStkaDlTYlBnZ2d2WWtlaTYvTHEvQkNCVDVUNGVQUHcybUd6VmliQzh5?=
	=?utf-8?B?SUMvOW82cWoyd3pnU2JJZnRaWHFxOWcyelY0NkxSd0hxVDJ5aFhIZ0pVVVMr?=
	=?utf-8?B?QkUwMTFlMDl4VWJqN0F4Q05wbWNpZUc4MXBBVFV6dVpxSVZZUmFwNVhuZHR3?=
	=?utf-8?B?cTVLR2RISlEvWTI2R3NmbnZXeUJrKzFTb3FEL1AwNCtadVA4VDZiMGtXanp1?=
	=?utf-8?B?VjVuR1Z2cXNnQTZxNU5jSVc5SFlTNUtjemF1ZHoxdW11QnE5ODFxNzF1am4z?=
	=?utf-8?B?UVFXSXJMS3hQTmlZamowSzk2a3dPc1hDRmhod3NMY3pLWU1IVnM1WG5UaE04?=
	=?utf-8?B?TEFUcXpDbWJBS2xZRFh5citFVE52NXcxRC91TEhJRzBoUmxtQ2FwSWI4UzFs?=
	=?utf-8?B?QSttNlA4enlXNWZBMUViQXhxYVVIaGpMaWUyWFJUYXhBT2NWVmUwR3VMeldO?=
	=?utf-8?B?TE9qblFHOStUTEIyR2RTSjhEWGtXQ0Q1WXlhSWxMa2pUZWJGemdKUHFseUtM?=
	=?utf-8?B?VUEyejFvU25yWFVEYTVQSnZBWTM1dzhwbWZYay83bmZVK0dtd2lEZDc1aDNR?=
	=?utf-8?B?NGQ2aEZlaTFZS1crRitqc2ZFVE0zeHd0YlV6NVBheWJ0RHdYSERIOEtTTWMx?=
	=?utf-8?B?S3oxWDY5cGxRWFFUanFiSTEvQklSQjlHOGJjQ2FYbzFnNEN1NithaFppRGQ1?=
	=?utf-8?B?NWsxT2REUFhORmdxNWdVWEd4MlpkdXUxaDNVRUlVSEJDcFU0MWdYcDdZcFE5?=
	=?utf-8?B?eUhXSytNd0pYcC85dDBUTmZ6c0dNWUZMMVpYNUgza0FkSWl5WkYyRkN0Z2tp?=
	=?utf-8?B?U1o3dzFBU2p5Q2NvemxXa20rekIrajFZSEROME1mVGtidFllZlIxVUMvVitz?=
	=?utf-8?B?VlNVN29LVDFMWkVBd0JyRGdhMHJIbjBtdklGL2ZmYWZQSzkzYUdhaWFwbnMy?=
	=?utf-8?B?M2xXaXVRZVJ2dnpmbXlpWTQwbG1xaFpwS09tMFREUXpYSmY1SVhjcnJ0eGFF?=
	=?utf-8?B?Zy96QkhydmNDb2RtZVVyOVM4em5PeWY2bHBsNHRWNnpWdVI2VmZ5NG1lZGI1?=
	=?utf-8?B?T0h6Z0JBblVzcFRiTTlEU1MxQnRRamE1QWJxNDFJclNKMXZ2cEcxaGhZT1N0?=
	=?utf-8?B?ak13Z0FscDV1VWF0Tll2V2pQbWYwdnR4TDBvV2FUQndUbVhtUkdNTUVpVEs5?=
	=?utf-8?B?MktZaWNUUFU4em0xd3AxUHFXL2o2aWxUSHdVcUdEYWRTTWdOaWdtYm5sTHVw?=
	=?utf-8?B?ZkpSem0xc0JxUnhTMEMzZUdmWnBtL3dRcXlFSmdSMVlXYXV2NGJRd1hEamc0?=
	=?utf-8?B?NThhUXFqUkFUY0ZxSDV5VEs3RFpRRk43RTNBaitaQnorSTBDaE5kY0pLOE55?=
	=?utf-8?B?SitmUnVmZUlGTExRRDJFNnNGWDhOWFBqblI3czV2ZGdBU2daQTljdXphVDhr?=
	=?utf-8?B?MVZtMThvcVVLY3V0ZWVRblZPc3AxY1VTQkJ4MXVNYVdJOURES0RVWU5pc0lS?=
	=?utf-8?B?MXU5VzJTY3VlOWhOSVRERHZPMGpRaDFBYUhIYmVVQU4vT2FINlhoeW5RbDNY?=
	=?utf-8?B?Qnh4Ny9tblo5T29RZHl0M1hzN0tPOENmcWVVTVI4Mkt6MlppUkY1RE96TG50?=
	=?utf-8?B?RjkvZDVabHpEbHNoOGJjSlFDb0JNOW5xMVZoamQwcDFOU21oS0hRU1lKYjhj?=
	=?utf-8?B?K0RkT2c0TE0wWTVPcmYva2c4bEhISTlRU3N6c0Q1ZEk3SDlvbFErZW5KWFo5?=
	=?utf-8?Q?LOCtTl+r/h1thJ/geQsSKInwUCWRGUveqCLcQ1U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5935be6-4ec7-4f7e-072d-08d95e267682
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6488.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:49:14.2615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eomjCK3/Kz4F8akmv09bQOGwTatng+IexVIlU2lBED8fEE2Bl+I1XvbblkOqHV9u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6885
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Why does dlm_lock function fails when
 downconvert a dlm lock?
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi David,

On 2021/8/13 1:45, David Teigland wrote:
> On Thu, Aug 12, 2021 at 01:44:53PM +0800, Gang He wrote:
>> In fact, I can reproduce this problem stably.
>> I want to know if this error happen is by our expectation? since there is
>> not any extreme pressure test.
>> Second, how should we handle these error cases? call dlm_lock function
>> again? maybe the function will fails again, that will lead to kernel
>> soft-lockup after multiple re-tries.
> 
> What's probably happening is that ocfs2 calls dlm_unlock(CANCEL) to cancel
> an in-progress dlm_lock() request.  Before the cancel completes (or the
> original request completes), ocfs2 calls dlm_lock() again on the same
> resource.  This dlm_lock() returns -EBUSY because the previous request has
> not completed, either normally or by cancellation.  This is expected.
These dlm_lock and dlm_unlock are invoked in the same node, or the 
different nodes?

> 
> A couple options to try: wait for the original request to complete
> (normally or by cancellation) before calling dlm_lock() again, or retry
> dlm_lock() on -EBUSY.
If I retry dlm_lock() repeatedly, I just wonder if this will lead to 
kernel soft lockup or waste lots of CPU.
If dlm_lock() function returns -EAGAIN, how should we handle this case?
retry it repeatedly?

Thanks
Gang

> 
> Dave
> 

