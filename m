Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF056D0B8D
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 18:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680194606;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Ujby6oeXTC/HDiOr8Ywrt3ySR3sR25UYi6bLRKPiQc=;
	b=OcgREWjTrpZhBN1c6UOv3US62ScgIYd952zmIJ7LVVqkri7xSfqyltqcS+PogTs1qbkcpk
	Q5DHVaP+aszdfSe+lA53ylmuTTqFHZGYB0oY0Rm3PHQsoBS6RhZdA76bvVkABJSORaCE1Z
	DdpQq7NWq6ITdh3UYOXDUDxQ0Zzh0g0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-D4DA_i5tP8GYacBKGOVQTA-1; Thu, 30 Mar 2023 12:43:22 -0400
X-MC-Unique: D4DA_i5tP8GYacBKGOVQTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 737848533BA;
	Thu, 30 Mar 2023 16:43:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE7FE4042AC5;
	Thu, 30 Mar 2023 16:43:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7775F19465A4;
	Thu, 30 Mar 2023 16:43:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 146841946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 16:43:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9D08B492B02; Thu, 30 Mar 2023 16:43:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94662492B00
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 16:43:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BE098030DF
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 16:43:19 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-9TCAcLr_MC2VuHFsBPQGbg-1; Thu, 30 Mar 2023 12:43:14 -0400
X-MC-Unique: 9TCAcLr_MC2VuHFsBPQGbg-1
X-IronPort-AV: E=Sophos;i="5.98,305,1673884800"; d="scan'208";a="231886126"
Received: from mail-bn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2023 00:42:02 +0800
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by CO6PR04MB7571.namprd04.prod.outlook.com (2603:10b6:303:ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 16:41:59 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f%6]) with mapi id 15.20.6254.020; Thu, 30 Mar 2023
 16:41:59 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: "dsterba@suse.cz" <dsterba@suse.cz>
Thread-Topic: [PATCH v2 00/19] bio: check return values of bio_add_page
Thread-Index: AQHZYvSUAQyHSHKcFk6jVy1YtMnDXa8Td2WAgAAPyAA=
Date: Thu, 30 Mar 2023 16:41:58 +0000
Message-ID: <9835fc72-18b4-517d-0861-b5b413252eb9@wdc.com>
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
 <20230330154529.GS10580@twin.jikos.cz>
In-Reply-To: <20230330154529.GS10580@twin.jikos.cz>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|CO6PR04MB7571:EE_
x-ms-office365-filtering-correlation-id: 43ad4c16-aa6c-40fa-e2e0-08db313dae47
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: PtdD2Kz1jfCg0E30W3vADGsaI5S/V/twHIgZucKSCJYD1avQLYUxTPgK9LR0dMeNPdAms2dtx1ZavrTRZJC3ATZnVTJyhjVwhhFpt9pfd1LjKgD82a4JNe2E9hl82ZOPyMl6+TctY+iNVANkT+BtTBKSSDVz+eG6oRdWEN1YijkBzBSSLkyIj5VrmZB3FuNsVP22immeZEEl67dkDOpLRJuH0QRXsZ32Zost2nu48pZ5j4scdggTvy0OafNkK38FN9BYZbgPANlkPkzwTc92m2+CKNE8yC9YvgLuQojN8iOpmj1IhJ7ZicA3slIE4tXrPz5ZALYljwbvYaGN6rsjodfVtklYpoy8t28gMMStF7a3ZOWc/le42Nt9OrnkSaevUJki8kIXoEaD4N6GffuIDvI3jM46jNHXUd+ZUA6YOT/8TlwUZ5tV4nACG1xFtAsKGL8gUaUaV/JJALajaTYy8i3CAhzAwJB2H9XhwSvyqKR5Rq7CRBLTIB0VTqaljApCRmOdH9kRzdOccosBREyW3R+7O3hSD+sTMuAInIJXG4n9ABck+cc7CE/rOweFTi2dI3+8g8T562M3RlzFCgiQwLMcJ7mqgTXn4e46OECUYT4agx7X28KzP2Jcm70wQ/tevnT5bu9IJCjOXdrmnYXT0ZZ70/TjWGoBoLKD5QYxdXC7IJSuE/0HHhYr2L8mGQCC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(31686004)(36756003)(6916009)(38100700002)(4326008)(5660300002)(8936002)(7416002)(122000001)(86362001)(82960400001)(38070700005)(66946007)(76116006)(66476007)(41300700001)(66556008)(8676002)(66446008)(64756008)(31696002)(6486002)(2616005)(83380400001)(91956017)(6506007)(54906003)(6512007)(53546011)(26005)(2906002)(71200400001)(478600001)(316002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akt6QlpraDkxUVRGMGdjUktRcmUxZ0xkOW9MYXhUamI5Tk90bzZWUURhanZI?=
 =?utf-8?B?YU9Fa1dFS2Q2V2J2QlRZRXdFVzAxbXFOeDl5SWJieDVpTzFGN0l2N0x2enNq?=
 =?utf-8?B?Znltc2VyUXpFMmZEMkdkcVJQTTBzMnhVNHhFYmtabW14SmJMNWtjMmd5aXli?=
 =?utf-8?B?cnV0UjZyYVpPS3E3R1Axc1ZxVEZRR1MvU2xrZXp0T0NSb1o1SndkV2lES2hX?=
 =?utf-8?B?bmlCaTFyNlFqK09LMUxnZXBZNFl4eng2clpXUHVsa01jUlEwbHJDVjhKSTYy?=
 =?utf-8?B?QnI3MmUwUXVDRHIrSWFvTGRPcTh6ZWJ3MDRKL21hWlJQa01QeU40eE9aQTI3?=
 =?utf-8?B?MWV2cHZpUVpONFFaLzB0enZjaUhuYjFrZU1uOXQ3R0VvL3hkMnhjR2xpTktr?=
 =?utf-8?B?YUplTm1mYjNrS2Z3NEpWOEZCMEovTVlLQkhySU9zc250NSt5M3FMT1BiRnE2?=
 =?utf-8?B?ZE4zSzlVaUNSZzJWcU80ZkVSbGxnVG9Ubkd6amFNQXlvT2xnUXZOYm4wK2Mr?=
 =?utf-8?B?UTZCS3R0NUpJbGZLYit5UkVCRHlhMnRjOGZFaUhlN3FyQ2pIcnhINGlZN3lp?=
 =?utf-8?B?NktqV3MyZW1zK25Kdkk0Qm1KLzh0b21Xb29DRThJMHBwOHg5Q1VjTFRSQzh6?=
 =?utf-8?B?QXc3QzdRQ0UrK0JLN2JLS1ZHT1BhaWpvaFdzUStKL096Q2JpQVg5cTJFNFJB?=
 =?utf-8?B?UW5xb2pzMTF3TWR0YVE1cUo4alpxUExFQThmTUVvQmdDa2dMOStBVU03Q3cz?=
 =?utf-8?B?Q2pacDdGbmxHQnpjczNDNm9WL1BDMFhhQ2dhamd3ZkVsa29YNlZxN09Zd2Yv?=
 =?utf-8?B?aUpuUGRvOWdGdU5QaUc0K1d0bnZGVG9TelhlOUJ0Z0M4cTEyaVF3cUVTYXNu?=
 =?utf-8?B?ZjlQaFpTbGhCUnpjWEVZUHBtMk9GS05GNFpOZGhoeG9CaHlZT1l6d2tqaXRk?=
 =?utf-8?B?MGlaMkM2N0NTSDdlV1doUnhoQ1pPaFlPUjFnV3UybnV0V3VjZTdVOE1HNDFC?=
 =?utf-8?B?aEN1aHY0THN0SmVVQjdNaTZ1eDJiNjZaajZ0RTI5ZlZJSENDcDBpTGtSU0ZC?=
 =?utf-8?B?ZFRQMHdzUVJJd3ZsdXZPRE5yQS9SN1VXTktKbGd4ck4vc3BIOWpYZU1nMHh0?=
 =?utf-8?B?Zld5MmQwMHRhUlRKUkVyZkhnRlFSUFdUaFRLWUVXRkMxNzFZeWdZMUlIVXZ1?=
 =?utf-8?B?bVYwZjV0WGNUQ0o2U0VLTlo2YURSczhtT0ZpU3NDdnljdk90Wnh6cHhOSzV6?=
 =?utf-8?B?UHowVDVOMEJTUGErYWJRaENId1A2dG9jZG96bzRNbUM4cXVqNEdNaEdvendj?=
 =?utf-8?B?TGlFb0JsUGlEQ3RLK0ZmZWE3Tmp6QkhGV1lYamZpSGE0Y24wbUxWbGJvSkpP?=
 =?utf-8?B?a0VOZXlyanFnVUhXUk5tcUwwNTZiU084WGx2NWd4UVpVK2xIMElBWDdXcmR5?=
 =?utf-8?B?ZzhOdzNZdUh5QWJFTjJxQUI0V0YzWURZQmVpR2pTL2xvQ1RaWDVyaVRuS2E0?=
 =?utf-8?B?UjNQbHBDMExpcTFTZE1VTWlSQWRhK05DR0lHQ2JKT1BjUXIvT3VnZnFiRU5F?=
 =?utf-8?B?VGRuRzBmeitxdDFKSVZ4VXk0S01XY2ZpQ0h0b2lBNjEyYlR0R1ZsVk1FbTI5?=
 =?utf-8?B?U2NiclFEYkdHdlNVY3U4bFdXeTR1SzZhS3FzTWtTclBMSHV1RndybG85NkJZ?=
 =?utf-8?B?Z0RqSzU1NlFUZldVWlBza0ZmYXV6QlhnN0dpZW5LVjlnQVVtVWpJdTVyL1hE?=
 =?utf-8?B?ZTFRVHNFMURUaUs5SEovUUY4Q2p3ZUduTDh5bHNhSDNrRVJEeEx3TWExalpZ?=
 =?utf-8?B?MEs1UTYzdUVQWlM2SVJGTVgvc2hTd3BhQjBrRjBhKzYwL1gvcUFQWTd2MEli?=
 =?utf-8?B?MjIwMWdLUzR6eGYydXVXamwyYmUxVU82NU44eWdUTGhNejRuTlpHdzl4UkN6?=
 =?utf-8?B?b1BmM1pHNmwxLzFPamIyL2xMWW4zYXFEOGxSWFZsdnl3a3ZxVmtWZWVzSm14?=
 =?utf-8?B?ZWZaTDlxS3B2MkFpc3Z1bFFRR3JnTGloSmJkeHpyVUptcTAybVJBOEd4SnlE?=
 =?utf-8?B?RVVITWRHbUhHaWZqTmxZaWgrZDdPcGF3MzRKVXgyTnBCQVFKWWgzTnJQYmFD?=
 =?utf-8?B?TjQ4cVdOL29qS2V1ZWphQWNaOXRoRjNwazQ4a0FzSTlWQVhLWW9makNYQllY?=
 =?utf-8?B?eXc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?TmZIS25HNkc5cGhBclV5WTNDbmNiaEcvSEFFNHNSbVJJSktJeDZtN3A5QjRp?=
 =?utf-8?B?S0s1TWkyeWtSQndENENYTXhLdmh4QzZvTHJ0TStSeVNvWXdKZnFqckZUVU5Z?=
 =?utf-8?B?N1BPUDlvL3JzVzZFZkFFRHk5ZlFoNkc0a25JYzByeEdjbFBMbzhaaWNMc0xh?=
 =?utf-8?B?UytFbVU5bnJQbkc2ZzgvN1p1bXNNZFdsNU9VK0k0czczMW9VbWU3U2lvb0Fm?=
 =?utf-8?B?NGJQc1Zwb0xPUk5KQXhXVG56ejBEdDFCM2pRMHNvcGJsTi9KOWpvaHhHQjd3?=
 =?utf-8?B?S0p6MUtYakptZzEvRCtUdlBGN29BaVZKM1cycXpJVEFsL085dWJ2QUl4UzV4?=
 =?utf-8?B?M1NGOUVPWW14WTA5WXZxbkxBUlo1bzV5dUh3SkpHVG5FOHNETTFGd0NhSUxR?=
 =?utf-8?B?M00zRUFlcHZPa25ONk1UNXR4MHIzWFRvSEpNR2J6aTRCVG5KNlU5bjlwTEVS?=
 =?utf-8?B?dlIvMndBQi9ULzN4aVJzNkFtZ0VOa1hoSERxQ2o0QW5CWWF6aGlhSmJNcUpv?=
 =?utf-8?B?Q2dkaFFjV1pibW5LNURRUy96bXRRY2ZENnpJV1B5RjA3bVRLUHhNNzRXcXU0?=
 =?utf-8?B?bFhkTXBwZlBxajExN0cycXNNMkxlWTNnOTY4UjRLcEw3MG5Lb3hOWVBwTzV0?=
 =?utf-8?B?NXI4Yk1uNENiZ0RkZVhwc1FXdFJzSGtKVVNEQVBzVkU5MzlBb00yY0F1MTgr?=
 =?utf-8?B?T3dqWmFmazFuNkhxTjBtNHhBR29oQml5Mml6ekdZdVBXaVRYTWlwbkRVdS83?=
 =?utf-8?B?VXJROEhabHlGRTZLaExSdzdXWFV3SWZ0TDdScHE4QzA3TWxOQ003Szl1b0FC?=
 =?utf-8?B?YVdWVHdOMkZvbDlYQ0poRVlvZFV6L1dLRy9rRnB1NUhFTnJLR2MzNVMrMEZU?=
 =?utf-8?B?TmpQQlFHeVFSN2MzcWVjUURrUXk1SjFic2tiRmlmK1lsekxZYXVRS0xhQlRk?=
 =?utf-8?B?Z1N4RjNsTVNVaWdMQm9XZzFaa0FoeE1DRWhwK0toanBGM2tkVjFXUFJGZFVm?=
 =?utf-8?B?eEMwTW1NcjY2YVpBM0I1M1BSV2xTTXZCRmVyenF3T2VyODVKQ2o0TXRwUkRp?=
 =?utf-8?B?WmkvZm9PTnk0ZUZGREdBVXA3QzU2akhhclhhSHduTllCZlB5cnZVekVZemha?=
 =?utf-8?B?VXhyVnVlZWJiQ3pTZVRYNXJMc2Y1TngyZUpWbjRidGR5ZjlHeXVkV3pHOCs2?=
 =?utf-8?B?TjFJNTNXVEdSaFdNbTFjVVV5Q0VDZzRjcGVSSnBBUTY3Zy8rVGdYV0NobDI2?=
 =?utf-8?B?SXFPMFlERXRMNnJ6WFBHVk9CWWRaYU5NdVVGelovWElWUUZONEY5WHBVYUVY?=
 =?utf-8?B?TitSakc4UURJWUlvbHh2dGVUZHhaTmR5RTg3MjBPRmQ5M2k2Vzdja2NZeTNO?=
 =?utf-8?B?ZEsrYi83T3MrbERPaFZoS0NwOG8yVTR2TElBaGpmNXUyajVoSmJGWkgyVXRv?=
 =?utf-8?B?MURBd0tmWUN5S1B6eS9MWGc0aWhpRlFiTFUzSWRucnNaVXhlREJqMFRVYUdT?=
 =?utf-8?Q?6+BOFg=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ad4c16-aa6c-40fa-e2e0-08db313dae47
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 16:41:58.9496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chEw+vZ3Vslb0AdV/m7+G5hXZ9rEEZd/HKDL5yVbaw91onQ0ZDwiIGDwU4VJncO9sbLUX17zjyJTTMMlWSq1OH0SzV3MEZa/69Wuh6wkj4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7571
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v2 00/19] bio: check return values of
 bio_add_page
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Song Liu <song@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, David Sterba <dsterba@suse.com>,
 Hannes Reinecke <hare@suse.de>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7D3AB49B075CD469A230F2483958329@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMzAuMDMuMjMgMTc6NTIsIERhdmlkIFN0ZXJiYSB3cm90ZToNCj4gT24gVGh1LCBNYXIgMzAs
IDIwMjMgYXQgMDM6NDM6NDJBTSAtMDcwMCwgSm9oYW5uZXMgVGh1bXNoaXJuIHdyb3RlOg0KPj4g
V2UgaGF2ZSB0d28gZnVuY3Rpb25zIGZvciBhZGRpbmcgYSBwYWdlIHRvIGEgYmlvLCBfX2Jpb19h
ZGRfcGFnZSgpIHdoaWNoIGlzDQo+PiB1c2VkIHRvIGFkZCBhIHNpbmdsZSBwYWdlIHRvIGEgZnJl
c2hseSBjcmVhdGVkIGJpbyBhbmQgYmlvX2FkZF9wYWdlKCkgd2hpY2ggaXMNCj4+IHVzZWQgdG8g
YWRkIGEgcGFnZSB0byBhbiBleGlzdGluZyBiaW8uDQo+Pg0KPj4gV2hpbGUgX19iaW9fYWRkX3Bh
Z2UoKSBpcyBleHBlY3RlZCB0byBzdWNjZWVkLCBiaW9fYWRkX3BhZ2UoKSBjYW4gZmFpbC4NCj4+
DQo+PiBUaGlzIHNlcmllcyBjb252ZXJ0cyB0aGUgY2FsbGVycyBvZiBiaW9fYWRkX3BhZ2UoKSB3
aGljaCBjYW4gZWFzaWx5IHVzZQ0KPj4gX19iaW9fYWRkX3BhZ2UoKSB0byB1c2luZyBpdCBhbmQg
Y2hlY2tzIHRoZSByZXR1cm4gb2YgYmlvX2FkZF9wYWdlKCkgZm9yDQo+PiBjYWxsZXJzIHRoYXQg
ZG9uJ3Qgd29yayBvbiBhIGZyZXNobHkgY3JlYXRlZCBiaW8uDQo+Pg0KPj4gTGFzdGx5IGl0IG1h
cmtzIGJpb19hZGRfcGFnZSgpIGFzIF9fbXVzdF9jaGVjayBzbyB3ZSBkb24ndCBoYXZlIHRvIGdv
IGFnYWluDQo+PiBhbmQgYXVkaXQgYWxsIGNhbGxlcnMuDQo+Pg0KPj4gQ2hhbmdlcyB0byB2MToN
Cj4+IC0gUmVtb3ZlZCBwb2ludGxlc3MgY29tbWVudCBwb2ludGVkIG91dCBieSBXaWxseQ0KPj4g
LSBDaGFuZ2VkIGNvbW1pdCBtZXNzYWdlcyBwb2ludGVkIG91dCBieSBEYW1pZW4NCj4+IC0gQ29s
bGVkdGVkIERhbWllbidzIFJldmlld3MgYW5kIEFja3MNCj4+DQo+PiBKb2hhbm5lcyBUaHVtc2hp
cm4gKDE5KToNCj4gDQo+PiAgIGJ0cmZzOiByZXBhaXI6IHVzZSBfX2Jpb19hZGRfcGFnZSBmb3Ig
YWRkaW5nIHNpbmdsZSBwYWdlDQo+PiAgIGJ0cmZzOiByYWlkNTY6IHVzZSBfX2Jpb19hZGRfcGFn
ZSB0byBhZGQgc2luZ2xlIHBhZ2UNCj4gDQo+IFRoZSBidHJmcyBwYXRjaGVzIGFkZGVkIHRvIG1p
c2MtbmV4dCwgdGhhbmtzLg0KPiANCg0KVGhhbmtzIGJ1dCB3b3VsZG4ndCBpdCBtYWtlIG1vcmUg
c2Vuc2UgZm9yIEplbnMgdG8gcGljayB1cCBhbGwgb2YgdGhlbT8NClRoZSBsYXN0IHBhdGNoIGlu
IHRoZSBzZXJpZXMgZmxpcHMgYmlvX2FkZF9wYWdlcygpIG92ZXIgdG8NCl9fbXVzdF9jaGVjayBh
bmQgc28gaXQnbGwgY3JlYXRlIGFuIGludGVyZGVwZW5kZW5jeSBiZXR3ZWVuIHRoZQ0KYnRyZnMg
YW5kIHRoZSBibG9jayB0cmVlLg0K

