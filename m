Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D9716914
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 18:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685463647;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kQjT5UBv7SWmIm+v0oTD7aUyytFWRQrQeyiqTjx8oHs=;
	b=GgqDGiP7WKjMUL1P03XtDINhpXCEonBwVlJb3HWHDUbLTz2pTaYCgpewEAS6Crp1bRC4Uz
	7H/jcqZIWUueHZpfdgyQAlMR4kJMlItdyPCrI9TPa8/KcN8IaKfGmMXBIhEEaQ/zKrJnws
	ujRvXdENcNm3c2CidhoN+y2n9B+IF2Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-qpD4ll03N6SLFvJav9c0LQ-1; Tue, 30 May 2023 12:20:44 -0400
X-MC-Unique: qpD4ll03N6SLFvJav9c0LQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 565318007D9;
	Tue, 30 May 2023 16:20:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5AE200B68F;
	Tue, 30 May 2023 16:20:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F046B19465B9;
	Tue, 30 May 2023 16:20:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1854E19465A2 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 16:20:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 79D94140EBB8; Tue, 30 May 2023 16:20:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 711A4140E955
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 16:20:13 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DE118030DB
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 16:20:13 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-AuyauagCPamCmQmyrFz9gw-1; Tue, 30 May 2023 12:20:09 -0400
X-MC-Unique: AuyauagCPamCmQmyrFz9gw-1
X-IronPort-AV: E=Sophos;i="6.00,204,1681142400"; d="scan'208";a="231988912"
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 00:20:03 +0800
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by PH0PR04MB8473.namprd04.prod.outlook.com (2603:10b6:510:29c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 16:20:01 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 16:20:01 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Mike Snitzer <snitzer@kernel.org>
Thread-Topic: [PATCH v6 16/20] dm-crypt: check if adding pages to clone bio
 fails
Thread-Index: AQHZkw5zDyZgJf7Gpki5Aq+KksFaXq9y/FOAgAACuQA=
Date: Tue, 30 May 2023 16:20:01 +0000
Message-ID: <ace01bde-4457-5ac3-01a0-96f94772df19@wdc.com>
References: <cover.1685461490.git.johannes.thumshirn@wdc.com>
 <e1c7ed59e2d2b69567ef2d9925fa997ecb7b4822.1685461490.git.johannes.thumshirn@wdc.com>
 <ZHYf5+ocDL0hsud6@redhat.com>
In-Reply-To: <ZHYf5+ocDL0hsud6@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|PH0PR04MB8473:EE_
x-ms-office365-filtering-correlation-id: afb1b198-a48a-42bd-19cc-08db6129b7fa
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: caSTg8y3wfFov1Paw5KCIYg2Alzuvjez73XTu7YJUPzBa+dPCzvY5NhSVj/tKCniKtAKgCTTsXKAa00RbZhFH5WAX948IjEzLnRtXgmTuvuxEcYgcEeuD266D8i2AptZM+NdkX31OcW/3BEGs3F7YFoT/FX6vBA/id/Vte8Kp/wvCPmdrVx74vsZvt+2o4XUeAyC/SjMy3D0aMcGRVCVUyaCo8/MMsfo+yCgWBImbb6Jl1DkFBauvZH1UhpZjSlZL2pyOEWJ1+QUjhT/XRa9uNvUIR63fqtk2rS1y1sQ7yDJoETqYgmQpFK1oV7K0uQLbpnILskWsW05hYr8GUHdyyhLPbnXm6RBedQqia7bLAV3C0FCwm/OJ1igzukdd8b2Fc6KHonNqwIlfWLrrgyA74PfAxu1TCgOzAV13BZmijIETPOBlBFDBG32G9YeqMve+UM4FBoo1BlEWgLVa8GY5UYa26X4umx3ixc0t+LY+KVKFGkmM/lsypYleL8C0L2zDmxqkXT/uaXNhaJMnyp2RVT2bOwd8mYbMhht9vO9Gh0jDYm1A/4FEvCtq5sHYzEcC/ETJ0og55v4RNYV7LKJKhs2dpQy3l/kyABSsKK48Te+oWSSmSHwzLGIatOSQ1YlitfLQvaPNpFXKnHNASBTpx1HhoakUmBvAwckhnf7dMk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(31686004)(53546011)(41300700001)(83380400001)(6512007)(26005)(6506007)(186003)(36756003)(7416002)(91956017)(966005)(6916009)(66946007)(316002)(76116006)(66556008)(66446008)(66476007)(64756008)(5660300002)(4326008)(54906003)(2616005)(478600001)(31696002)(38070700005)(6486002)(86362001)(82960400001)(71200400001)(8936002)(8676002)(122000001)(38100700002)(4744005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWVRWjZEQTQ5OHlQOERmbCtDUWZKNTBSdVBHWnNsY0FoenVHKzY5LzIybTgv?=
 =?utf-8?B?YWJMOG1tK0tiZThRRXJWUHdwbHh0M3FKOEU3SUNEOFZucXQ2bjVJcTlIdFgy?=
 =?utf-8?B?djgwbjJBdnRibWpSQi83TUYxVDhwOFJVck1SVzMrVGdnQW54MGprNm4remxq?=
 =?utf-8?B?elhNakVUVkJOWE1xeUFOZnVoODJSSTZ2dUptYzFCUThtWjR0TmNQZllPRkQv?=
 =?utf-8?B?RGZTV1ltNTdzTUVDcmZ6V3pST29yeldOOEpVSkZWQ2tDaHFKdHRic3lnNENu?=
 =?utf-8?B?NWUrbnIzSjJEaFVtb0h3ZXNPM1hSWnpETkk2NmtVanNCcjRqRzJiZHNFQVlE?=
 =?utf-8?B?dEdnQjYwVmdMQzIvQkxlcWVJelpvZk1NcHJ5N1VTbWJwR044VFd1ODYzRVVJ?=
 =?utf-8?B?V1d0MTJTRlpYUmZoTzgvaG5pandCYW1wdlJpN1FoMy9wcHpjbVJpdzN3aTdJ?=
 =?utf-8?B?TWZ2ZTAyUUgyMlZzbHRtYUxRMGU1WDQ3NVVpN3c5YWRnc1UvZWlocnBkblJD?=
 =?utf-8?B?ZnBVbG1Od3pIdDNOK1dUQWl0VkgxRTc3ZThGeG9kTVZCYkNzMWxqamFqcHhs?=
 =?utf-8?B?MHJxYjBGSXZSaTcybitKMzcyaDEwN0pRMkFwbmNUSkE5amZqTXU0dEdSOTVY?=
 =?utf-8?B?S05maVRPZkt0dlBvTEd2UjZMby9mTUVrdkJ5YmFQMmd4L3ZZVmluRWY1bjJt?=
 =?utf-8?B?dEwyMHA5dlRYWFhDWEZNbExoUlJnaFh0empvMkpYdWtSZ0lCQmhtT1NWZzB3?=
 =?utf-8?B?L25qZmJNVmdEY1k4TnpESDBHRUk1Z0xCVmdKUlJNdFQwVlJRL0Z6aE00UXNE?=
 =?utf-8?B?d3BnWWkrOGdDVjBXVjlsVyt2MVg2ZzZrdkhVbEM1ZkRiekREc0V3QWxQN21i?=
 =?utf-8?B?aFBTSEZsNlNLNmlVeDRWa2lSV1JURm42VlQ5NkpleWhlblpLamVxZWZMYkRh?=
 =?utf-8?B?NlkzM2pGMTdYdnI2SlRsR3kzRkVjeFMvYmVrekljVkhSbEtSM3ZUVzMyM1Vn?=
 =?utf-8?B?ODFUaXhVZGR3NUNQQjlhaDlNVHFyTWNHb2pCUTlFcUFTR3k3eUdPQzIrVHF6?=
 =?utf-8?B?SmdHYVhqUmZ4anl3akNMeER6VXFqQjJZeDYxSjZFRkVVOE1abDh1N2J6Mktt?=
 =?utf-8?B?V0RRdVVZTFZzQk9KNnV1UWxDWGhPbXd2ZEJOM2p0R2JjcWhXbjQ1NGcxaXFq?=
 =?utf-8?B?ekpqR1Y0djgwYW11ODNrOVFVZnl0Y2tnNlc5akZpaThoNjIyNytzdGE0SEMv?=
 =?utf-8?B?Y2hhTDdzcHFUTG9ueURiU1FUSGt4cWx1YXhrZ1B5N0dwQlhJU3ZwZmZXMTJO?=
 =?utf-8?B?U0JyZ2hOTUlUMDJJb1VVRzd3cU1hZC9oV1cybDQ1YkgvWi9oTjNqSHVVcGg4?=
 =?utf-8?B?YkRhWXkzMk1IMmhsU1FIWmN4dnhISlFIL3BBK0xVZC8rQTlTVjZVRjVENkVl?=
 =?utf-8?B?ZVZjNzZqT2pMVUdBSU90aTlmTW5pSm9USnNqaG44RjBvUGdUY2JuNzkwaVZB?=
 =?utf-8?B?UEx0ZzdaRVFPbGRYdGJPMkdnSXErTStUWkQwbUdFS25TQ3dpRVRHVlZVbHZx?=
 =?utf-8?B?RDh6SzZqK3dCam9ZNVNoaE1tQkhnRlFQRXZ2S3BmVmdRUmJYaUx3aFFrVk1O?=
 =?utf-8?B?MmlrUmRQb1ZvZ2RETWhpRkNkakNHQ0xXYzJINzFiRXFjYjdSa2JDNVptSGhs?=
 =?utf-8?B?cE51R2ZnTXdhZitRbEtYdXBpNjcvSDNhSmhINTJXbHljdkcybDBBMjFjMm1s?=
 =?utf-8?B?MUdxdWxZenpJNVBYMFdNNy9CREVoRnV1Tmd4ZEhXd3NJTjlYRTJ5aksvQ0tn?=
 =?utf-8?B?cERadWVFdnNJRm5OUmorelNNYlVJZHhRVTNUS0FTMG1ham12N3JMMkR0VVJm?=
 =?utf-8?B?WGlWN1lMbnVST1YyYmNmekpReVNlUlFVOHVZSFlGb25sbzZ1UVFxQlBsN1Qy?=
 =?utf-8?B?S0dFenhoSWl0ZHY3am0zRWtGazFzSWgxOGRMUloxdHBoZ3laY092U3Zva1Ji?=
 =?utf-8?B?NGFNOG1UVVBPL1RVd2ZQc28vMDhTNmJra0w0SHVXa3M4bHlSUTlmOG9QbEh2?=
 =?utf-8?B?bWpJbU1xTVU1c3RUMWdydHl0Qlg5dkpJeGx6MExWdGp3dUg1YlNkNlFBaGR1?=
 =?utf-8?B?cHFkWEN0anREMnkxd2xjTTZBY3RJUUdyTlhjZkRHUktJYzg4dWFHRzE5NU02?=
 =?utf-8?B?SVE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?QUZhaEI3MW4rOTNkQWdrdjExRzBsWVRjS2hnYVdjZ0lVUGtGS2JpNENmQWVK?=
 =?utf-8?B?dExJMU0vSjlaejdKZG1BMFZveUxlNlhmYVBDNWIvalpnYmhsL3lWUTN3UEh3?=
 =?utf-8?B?SlVRQ292MEdJOHN0Qk8zeEVrNGpxOFlONndNSkI1OGFDS0lLZXBKa3pxWWdR?=
 =?utf-8?B?dDdWS0FJMjVucUNGeXUycHV2QXhxdnVKa3VMNWJ3R2wvMng4VE01VjluekRp?=
 =?utf-8?B?Vk1yOE1uMWhwSTFoNlZLeWFJS1YxVXREbExCTFUrc1oyNzFjVjUyR2ZHeWVQ?=
 =?utf-8?B?T2dOTWl1TFZkYmF5amkvYUpITXhqanZQS0Fnd2dJbm5LdlBlSS9QdFBXejRE?=
 =?utf-8?B?WGpGdzV4RXNPUENLMDkzSVRUb1FSdkpBalUvdmpTSG10Qm9GV0hzenVZekNm?=
 =?utf-8?B?QzVYck9BUVNObktBWVZ0L0pBSXRJRkNndFdsM0ZWcnl4SU1uSjJrc2lZVitL?=
 =?utf-8?B?djl6dUNRV0VVZllQcHZ2bEZ2R0YycTU1dGRhWm42TjhHcFZKMnlaTTB2Z0V6?=
 =?utf-8?B?UlEvTXVvQzVZY2d5ajVWdE53b3ZBYjFhenZtcExxclJiSG1OeUtYK1VCZUJL?=
 =?utf-8?B?ajVVcGFYMVh2QUM3K21ocXh4ZGF0cXpvd1hRbm50QUpmcVJWOGErWFpOUUZ2?=
 =?utf-8?B?cDQ5UkE2OTBrMEZVR1FpQkRSTzdGVU9hTjl5ZytXR2VCMk5QcW5LSFpVb1A4?=
 =?utf-8?B?UlMrMEJpU3ptMUhxR0wxNzMwbmxLVUhxN3RpWFF6WGVyUzdSbnZVU1ZTQmVw?=
 =?utf-8?B?SlJEV2pzOXRvbllBMW5OVzRuVHdkaGxaaC8vWElHVG1iR0NJYkdkUUNzNm9z?=
 =?utf-8?B?cWhDYTYyR2NIc21udFM1SmxOUmh0aXdQVWYxNnFRWWI5QmI5MEM1K05CZ3NJ?=
 =?utf-8?B?a2s5T3E5dWlxdUtNMkRGek5idGNvZWVPZUYzWW1uZzFvNWpxQnNBT2tYQ2h3?=
 =?utf-8?B?M1JKVEZBWW9nelBNcTRoS09USHZOUUdWU0YyMEpxaG5WcncyTXpZRWk4YXFI?=
 =?utf-8?B?am50TXY3eklXVkFIVk9kQXpUTGpIVUtSdjFZUEhzMVY0bm0wNWNsLzZ0dmpD?=
 =?utf-8?B?MWZwNkpPbm5GTmRUYkc0N3VITWtpNEx1ODU3MWVVQmVwclJtYkl1Z25Zeng3?=
 =?utf-8?B?cjg1SjlEaFlnYW81NDlxVU02MGEwYnpsVG9oMWpoaUNBemJYT1N4VnZBOHFj?=
 =?utf-8?B?Sk5RS2swZzMwWjdxTnQrOEtJVDJnVXNBVW1BWXRtSGFDdEtma2x4Z1FBa2xU?=
 =?utf-8?B?bUpOOU1DM3BvQ2JaQWh5b1VodjlMa1BDYUd1dVNHN2lrSC8zSk4wZkIvTEtx?=
 =?utf-8?B?TTZVcDR3NzA3YWhIVlh3N1JsblNMZGpSbVp5YjIxRHNuWGZzYnNTRVB0THBi?=
 =?utf-8?B?V29ob21jdU1nckJWY2JKVVVvdGMwN2l4c0N0THlFRDJBenREb05oQkJ4OHpJ?=
 =?utf-8?Q?KWIAoF/P?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb1b198-a48a-42bd-19cc-08db6129b7fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 16:20:01.0794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVrJYuPPD2ahHIgHRJ0cOU2y/uVYZ2J355XqqG3kIkbA2q/FiXpO1gg4eYzoa6J8mUr6kvHKHpeUTxAP3yZBm4a+Yuu2d33BnRnTVPnDAMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB8473
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH v6 16/20] dm-crypt: check if adding
 pages to clone bio fails
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Dave Kleikamp <shaggy@kernel.org>,
 "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>, Chaitanya Kulkarni <kch@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, "gouhao@uniontech.com" <gouhao@uniontech.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <21F8F7AEF6A7D145AB1DA9A01ACFF1B9@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMzAuMDUuMjMgMTg6MTAsIE1pa2UgU25pdHplciB3cm90ZToNCj4gT24gVHVlLCBNYXkgMzAg
MjAyMyBhdCAxMTo0OVAgLTA0MDAsDQo+IEpvaGFubmVzIFRodW1zaGlybiA8am9oYW5uZXMudGh1
bXNoaXJuQHdkYy5jb20+IHdyb3RlOg0KPiANCj4+IENoZWNrIGlmIGFkZGluZyBwYWdlcyB0byBj
bG9uZSBiaW8gZmFpbHMgYW5kIGlmIGl0IGRvZXMgcmV0cnkgd2l0aA0KPj4gcmVjbGFpbS4gVGhp
cyBtaXJyb3JzIHRoZSBiZWhhdmlvdXIgb2YgcGFnZSBhbGxvY2F0aW9uIGluDQo+PiBjcnlwdF9h
bGxvY19idWZmZXIoKS4NCj4gDQo+IE5vcGUuDQo+IA0KPj4gVGhpcyB3YXkgd2UgY2FuIG1hcmsg
YmlvX2FkZF9wYWdlcyBhcyBfX211c3RfY2hlY2suDQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IERhbWll
biBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQG9wZW5zb3VyY2Uud2RjLmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEpvaGFubmVzIFRodW1zaGlybiA8am9oYW5uZXMudGh1bXNoaXJuQHdkYy5jb20+DQo+
IA0KPiBUaGUgYWJvdmUgcGF0Y2ggaGVhZGVyIGRvZXNuJ3QgcmVmbGVjdCB0aGUgY29kZS4NCj4g
DQo+IEkgYWxzbyB0aGluayBfX2Jpb19hZGRfcGFnZSBzaG91bGQgYmUgdXNlZCwgbGlrZSBteSBy
YWNleSByZXBseSB0bw0KPiBNaWt1bGFzIHZzIHlvdXIgdjYgcGF0Y2hib21iIHNhaWQsIHBsZWFz
ZSBzZWU6DQo+IGh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL2FyY2hpdmVzL2RtLWRldmVsLzIw
MjMtTWF5LzA1NDM4OC5odG1sDQoNClllcCB0aGF0IG1haWwgd2FzIHJhY2luZyB3aXRoIG15IHNl
bmQgb2YgdjYuDQoNCkkgY2FuIHNlbmQgb3V0IGEgdjcgb2YgdGhlIHNlcmllcyB0b21vcnJvdyBv
ciBqdXN0IHRoYXQgb25lIHBhdGNoIHVwZGF0ZWQuDQpXaGF0ZXZlciBKZW5zIHByZWZlcmVzLg0K
DQo=

