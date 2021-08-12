Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B36EC3E9E2A
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Aug 2021 07:55:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-5UQtWU65MECgSyJBFuEi_g-1; Thu, 12 Aug 2021 01:55:39 -0400
X-MC-Unique: 5UQtWU65MECgSyJBFuEi_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7D49800EB8;
	Thu, 12 Aug 2021 05:55:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B975C25A;
	Thu, 12 Aug 2021 05:55:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E724B4BB7C;
	Thu, 12 Aug 2021 05:55:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17C5jFcT016270 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Aug 2021 01:45:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A873113B53; Thu, 12 Aug 2021 05:45:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64930110E9E
	for <cluster-devel@redhat.com>; Thu, 12 Aug 2021 05:45:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD0888D1390
	for <cluster-devel@redhat.com>; Thu, 12 Aug 2021 05:45:12 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-449-zgdMo-d5NKarSv-aWV8ShA-1;
	Thu, 12 Aug 2021 01:45:10 -0400
X-MC-Unique: zgdMo-d5NKarSv-aWV8ShA-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-21-ZQYcTqiSMzCN9c9ZrVkgWg-1; Thu, 12 Aug 2021 07:45:08 +0200
X-MC-Unique: ZQYcTqiSMzCN9c9ZrVkgWg-1
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com (2603:10a6:20b:f8::21)
	by AM7PR04MB6965.eurprd04.prod.outlook.com (2603:10a6:20b:104::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15;
	Thu, 12 Aug 2021 05:45:07 +0000
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71]) by
	AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71%4]) with mapi id 15.20.4415.015;
	Thu, 12 Aug 2021 05:45:01 +0000
To: Alexander Aring <aahringo@redhat.com>
References: <AM6PR04MB6488E4D6F12BFB4B91BE9E45CFF89@AM6PR04MB6488.eurprd04.prod.outlook.com>
	<CAK-6q+hXb=hBHHgS94M94aS7JCeCuUrwVH=05oJoxt3tFatDyw@mail.gmail.com>
From: Gang He <ghe@suse.com>
Message-ID: <74009531-f6ef-4ef9-b969-353684006ddc@suse.com>
Date: Thu, 12 Aug 2021 13:44:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
In-Reply-To: <CAK-6q+hXb=hBHHgS94M94aS7JCeCuUrwVH=05oJoxt3tFatDyw@mail.gmail.com>
X-ClientProxiedBy: HK0PR01CA0065.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::29) To AM6PR04MB6488.eurprd04.prod.outlook.com
	(2603:10a6:20b:f8::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.67.20.87] (60.251.47.115) by
	HK0PR01CA0065.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::29) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.4415.14 via Frontend Transport;
	Thu, 12 Aug 2021 05:44:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d3c44db-401b-42e6-8bd7-08d95d5453db
X-MS-TrafficTypeDiagnostic: AM7PR04MB6965:
X-Microsoft-Antispam-PRVS: <AM7PR04MB69653F134FD01FD4CC8EBE8DCFF99@AM7PR04MB6965.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: WJ/Mx+RsmVaq29MhVNSPjx1pE6x2U72938whsIluRTvLmsuYxrcK4kVp4OtsNECYQFuUHCr1zWcvyQOhLkH0ykRNjP1NbrFudDqmbSM7Y+XxWU9m1JYyQsR4gTPNYoT4PTCkNI0WIbTn/iQAHULhTsS23FwMR8rhjcLkNCrR8Jq6yUgMNwUzWXc5NvsCd5b3AvS/gCi5PkyobXmKRx6HT6p8z1H8vM5NfqCZQj3wCZHBI/XXTeKqNrH/I/JT5jVVou0mzOO2ldxejoIvWl/jb3Jgr0DjC6dtvSC6M9gANIfltuvi+FnXW3nKhhm++k7QWgQT3ifB4A6k0+vJyf4SqPUmdz88l09rW0EQXRv9TMeduePz61kvWyYVTrsoGEHZyxIKnYs9CU5e71FHofXor7Vvfb0wHFndGI72qT52DlB7sP+2b6nz/Hs8/H/S8eEQQ5cY03GA0mqxve59YUSlmFMa1e+2SxaRhmQziwGrQtJhqu+Kp8kU7CmuxZGxS6k50jbhQU9U2LHnBt4P57i8WNYLe4P52TX92tx9J6ZTMAL+p1tTJqxhlydzDDggMKeAP5QDpgoLD4BA/rvaR+5jDp2ZbrU5USrXpmaEste3JwGrS+O1wqLd3LscICUUcLtIev1XL+k3dCTSbbyi07OSlYae+gsxzh+CSOqx6c0eRzaZ2K8edfbLIqJLooastANZszkvKGaJJPKmK91m0SEn+vuDTxz6rsfW2KvBAJ30R3FL9C8KGIxo1/oHk+dueyofZ0Ao2FJqScJlf2Uk4dSKqfZ6oohTzf0fUVtc4A1cLUI8OxtJLiDXmhsSIgZ2fGKdcZkNxVKx2+OlO//SvQL9XPp+i1BNWm53SKME5Ahybz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM6PR04MB6488.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(346002)(136003)(396003)(366004)(39850400004)(376002)(38100700002)(2906002)(6666004)(5660300002)(83380400001)(966005)(4326008)(6486002)(86362001)(66946007)(450100002)(53546011)(66556008)(478600001)(8936002)(36756003)(6916009)(31696002)(66476007)(55236004)(956004)(316002)(26005)(16576012)(31686004)(2616005)(186003)(8676002)(10126625002)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVk1Y1hrR0lVdUpvRE52OGtkTlJUNUpPS2dCQXRBdWdSalJRelRoVG1FaCsx?=
	=?utf-8?B?QXdqSURMYWtKQkNXRlFrMDB5Y2h4Z3JYZVFvV2taRzc5ekg5TjQ5a05YVUMv?=
	=?utf-8?B?WEVDUkdyanMvNmUrRGtBT1NvbHpvNWhHNUVHaXlMdkg0MzRXSUlBTDhlZjVY?=
	=?utf-8?B?UnY0Z05nd1BiV2FlK1RxUWhlcUpvUUVGWGw3WEdwWnhWc2FEdHZZVFExNE9L?=
	=?utf-8?B?dENvU2xXellWRFVlb291TU9aTTR2UVp4WXU0cEh2OXoybmhqakZsaGIxVEFh?=
	=?utf-8?B?ZHhMY1kramh2N25RRnloL2ZqR3hFTGJ6VkZXZy84REJFRVpXV0FzVUdXSmxF?=
	=?utf-8?B?ZnBFUlVzbkxjZVAyNHRwRzV2ZEFVQzkvV01HendPaTh1MlFrSVZPYndjeFVq?=
	=?utf-8?B?VHRxVDFKdXplSjRWYzZweS9mbEZsYVVhS1U2a1J3cUwvNjVsbVlyeWcrUm41?=
	=?utf-8?B?RFp4MVpwL3lHSWY0SDNqZFYxbTZZNnhCSFpmZThrTm5qbUU3NGZSOWNMdXdY?=
	=?utf-8?B?NkUzcXc5dGhrck9iQkRQcXBtWjcwa1lDajIxOEFQV0E2Vk1ZN1VaVzZJZCtE?=
	=?utf-8?B?Y3ZnWGczRzlmdDBYcWkwRjdPSmM1VXI5dlc0VFE1WjRlN3ZjazYraFExTElk?=
	=?utf-8?B?QUN2OEppRjUrU2xxbzA1bEVYN1gzQWt1NU5SL2NQZ29HS01GcDZZTWJzZEN6?=
	=?utf-8?B?VGcyek4xWDBocVFlNlJ6Q3lEYXI5Tmp2aE91bnZiYXJpcTJtTFNyUnlPM0hD?=
	=?utf-8?B?RHVjM0tuRkhMMHlwMktqeHNTVm8wSEZBSkFuMGZaclRRZnhKcVFMbVk5R25B?=
	=?utf-8?B?VmRjQ2hILzdDUFVCY0lQTnh6UXR3bG85cGg5ek1sdGx1cXl2NThkMHBzSFYz?=
	=?utf-8?B?MUpSMnFMQzJjN0QrSkZMT0Y4cDVpbjd6enVGR01Ja0VHSS8xYi9hRTNacld3?=
	=?utf-8?B?Zlh4NzRzQWRNWVA1M1NQVnRxV2p5Wng1OWo0b0pRK3JoV3k4RCtXTkFySTg5?=
	=?utf-8?B?UlU0cFRYYWVrelNEVCsxYjl2Q2ZYMlc1bFg1aFZuWm5Nd1pGekZnZm9Od2I2?=
	=?utf-8?B?YWpRSEpSTm1lM3oxTkhwZUg3SHpGVFNyVjlocmVkSHJoWEFlSHU0V3hmb3lB?=
	=?utf-8?B?V1JLZ3RLWXFFZUVZQSsyVDhjTitGV0xEUStrQk8wQmE0QWRsU1ZwRjMxY3Vw?=
	=?utf-8?B?L2RMQ2duUXJDbFpnL0VWTHlRM3Fpd0hJdW5BOGh2am1GcTlzOWZuUjdvdWsx?=
	=?utf-8?B?UE1TTi9BR3ppVlk3MDA5aVhQbUdZUWZqRmVGdlI2TnphOTNCMzQ2bFgrZzVy?=
	=?utf-8?B?RDQraGxva1JZNDFDWFg5QlQrTDNIcjlFR0l2NGJ5VXlEcVFRSGdYa1pMMy9Z?=
	=?utf-8?B?UzJXV2xPSGZpdWpJdm81Qk9uay9IYnBmbmQ3RzhaZHlrR3puT2phYlJ1Ly9r?=
	=?utf-8?B?dForZ3lpdm9YRytLWnB4WE5NSEJjcXplU05heGtidUhWT2t0aXU3RGlPdU4y?=
	=?utf-8?B?TXVkYkVyRlMrQUVwRFBoZ2dNOTc0cEtDL2x6OFBwYlorVnByK2xTN01OTzZT?=
	=?utf-8?B?Mnl3MmVNYm9EcWYzcTlLWUlVbGU3bWhqaktSSW94aldwcWFZNmpjSG80Wks2?=
	=?utf-8?B?cFlNMXM1YWI5aTNvV2ZIa2dxYzNGRlppRmh4WUgvc1Vkcmk3b3FyTExlUWNz?=
	=?utf-8?B?VWkxeHdwMVBDR1Y3S1FSWEh4b2ZMemxId0JJdklVNW9WMml6WmZETkdBL0kx?=
	=?utf-8?Q?B2ml04w4uGeWr+7UqYU812gEUTqLSfyWe/DF0XO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3c44db-401b-42e6-8bd7-08d95d5453db
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6488.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 05:45:01.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lv9C1/e6QJ/W4sxL74KTZyow7TyHMhsGoWBY68Ou+rUPRjFWo6DPlb3pBWW7ZsYE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6965
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alexander,


On 2021/8/12 4:35, Alexander Aring wrote:
> Hi,
> 
> On Wed, Aug 11, 2021 at 6:41 AM Gang He <GHe@suse.com> wrote:
>>
>> Hello List,
>>
>> I am using kernel 5.13.4 (some old version kernels have the same problem).
>> When node A acquired a dlm (EX) lock, node B tried to get the dlm lock, node A got a BAST message,
>> then node A downcoverted the dlm lock to NL, dlm_lock function failed with the error -16.
>> The function failure did not always happen, but in some case, I could encounter this failure.
>> Why does dlm_lock function fails when downconvert a dlm lock? there are any documents for describe these error cases?
>> If the code ignores dlm_lock return error from node A, node B will not get the dlm lock permanently.
>> How should we handle such situation? call dlm_lock function to downconvert the dlm lock again?
> 
> What is your dlm user? Is it kernel (e.g. gfs2/ocfs2/md) or user (libdlm)?
ocfs2 file system.

> 
> I believe you are running into case [0]. Can you provide the
> corresponding log_debug() message? It's necessary to insert
> "log_debug=1" in your dlm.conf and it will be reported on KERN_DEBUG
> in your kernel log then.
[Thu Aug 12 12:04:55 2021] dlm: ED6296E929054DFF87853DD3610D838F: 
remwait 10 cancel_reply overlap
[Thu Aug 12 12:05:00 2021] dlm: ED6296E929054DFF87853DD3610D838F: 
addwait 10 cur 2 overlap 4 count 2 f 100000
[Thu Aug 12 12:05:00 2021] dlm: ED6296E929054DFF87853DD3610D838F: 
remwait 10 cancel_reply overlap
[Thu Aug 12 12:05:05 2021] dlm: ED6296E929054DFF87853DD3610D838F: 
addwait 10 cur 2 overlap 4 count 2 f 100000
[Thu Aug 12 12:05:05 2021] dlm: ED6296E929054DFF87853DD3610D838F: 
validate_lock_args -16 10 100000 10c 2 0 M0000000000000000046e0200000000
[Thu Aug 12 12:05:05 2021] 
(ocfs2dc-ED6296E,1602,1):ocfs2_downconvert_lock:3674 ERROR: DLM error 
-16 while calling ocfs2_dlm_lock on resource M0000000000000000046e0200000000
[Thu Aug 12 12:05:05 2021] 
(ocfs2dc-ED6296E,1602,1):ocfs2_unblock_lock:3918 ERROR: status = -16
[Thu Aug 12 12:05:05 2021] 
(ocfs2dc-ED6296E,1602,1):ocfs2_process_blocked_lock:4317 ERROR: status = -16
[Thu Aug 12 12:05:05 2021] dlm: ED6296E929054DFF87853DD3610D838F: 
remwait 10 cancel_reply overlap

The whole kernel log for this node is here:
https://pastebin.com/FBn8Uwsu
The other two node kernel log:
https://pastebin.com/XxrZw6ds
https://pastebin.com/2Jw1ZqVb

In fact, I can reproduce this problem stably.
I want to know if this error happen is by our expectation? since there 
is not any extreme pressure test.
Second, how should we handle these error cases? call dlm_lock function 
again? maybe the function will fails again, that will lead to kernel 
soft-lockup after multiple re-tries.

Thanks
Gang

> 
> Thanks.
> 
> - Alex
> 
> [0] https://elixir.bootlin.com/linux/v5.14-rc5/source/fs/dlm/lock.c#L2886
> 

