Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4670F3B3
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 12:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684922710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iwUHx/mkddptwweO2bpslpk+0R8WWAA6SJCoiOyK3LU=;
	b=XirXf65QWjm0hWbEbjOIUonZQ1Jcb7keTwtxWDzGniotsEU9CgIVgviCUTR3INVkrHeb0h
	4GjkXvTSQbrsjHKGP3lVgkCWScGDFDTmV9dHTcYsJL3JAgljFR/P1pbzG4/r/TtFKPba9b
	6TyAK8kl+J3Q9Zp0sPIrgN74W/rngfg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-y8uCeLJUNeyI5aKApIKJPQ-1; Wed, 24 May 2023 06:05:08 -0400
X-MC-Unique: y8uCeLJUNeyI5aKApIKJPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A157185A78E;
	Wed, 24 May 2023 10:05:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C896F7AE4;
	Wed, 24 May 2023 10:05:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9985D19465B3;
	Wed, 24 May 2023 10:05:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60C7B19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 10:05:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 444E4492B0A; Wed, 24 May 2023 10:05:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C288492B0B
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 10:05:06 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CBD385A5B5
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 10:05:06 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-4SFJTm7XMmit9gVh_ryeLA-1; Wed, 24 May 2023 06:04:58 -0400
X-MC-Unique: 4SFJTm7XMmit9gVh_ryeLA-1
X-IronPort-AV: E=Sophos;i="6.00,188,1681142400"; d="scan'208";a="335996862"
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hgst.iphmx.com with ESMTP; 24 May 2023 18:04:55 +0800
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by DM6PR04MB7084.namprd04.prod.outlook.com (2603:10b6:5:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 10:04:52 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 10:04:51 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH v5 00/20] bio: check return values of bio_add_page
Thread-Index: AQHZfN/AsiDj2VYjN0WoDrrCAoWRkq9LWBCAgABlRACAHZdIgA==
Date: Wed, 24 May 2023 10:04:51 +0000
Message-ID: <54ddc290-0841-6311-2767-bb65b1f3089b@wdc.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
 <1ac1fc5e-3c32-9d62-65bf-5ccbb82c37cc@wdc.com>
 <e56b4f96-a379-f97b-168f-d03f170744b2@kernel.dk>
In-Reply-To: <e56b4f96-a379-f97b-168f-d03f170744b2@kernel.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|DM6PR04MB7084:EE_
x-ms-office365-filtering-correlation-id: 262b5e88-09e9-4ae5-6bc5-08db5c3e50e2
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: QJ4op+BnwfHn3AP+9sIauJQNaYps3ktmVVetj9mILRlqvELrc1fDTLEwLdiN8grAS6qymUjT5zQ1w8BnnfkbuBjscOWvmcKTWYRs3gz6aBj6eapCNUckWdUX+up1BA5Sn/sHhGP3J07NFGTBmohAqz6Vv11qY0ZZXFDD6N1cuV5t/Ys2WOs04Fh/l/z1rvuNXGDPbWC4j8u1VZMYIRrj17dNwUSHY4G9HT/7zdzBFVOoknVAkPwIDLmzAMv53AQgRGOkwrFx9qRhXvneFNJKbnFOd6sbTnwmFfHA+WkhV4t0WyAf/v90FJnhBG6IbwEIq5s/g7l+lUI4fsknmduaq7Tbhi9EjVA2nOOezCKCeFP1bxRR/zEpjZK+htZwFd49yOunsnm+/k2x+eVrJkljvh7Ocfw6WbTPDQcArED4rUv8lT2YCYAQNU5xBw6kJ44rh5yZtmkIZraghsfNsqI9zlwZhh+q/awOxEboGdy6uklejsOOIOrTKPX0d3hgI/peGYZWy1zv71hmOa0eWLYXeEn8QE/TxKNU0xJk0j+xOHu3LA8Kdo49J1T9//QvtADaC61nEUROHoLTkj1lzj04288yCrbKL1zV1sVKkwbYPcu3Kv3PSSSOmZy63UmFRbVh/74Mo8Jc7ESkDoj5FDWTGHEhAEvIsvVXx9/dPu8T5QmB1DVJ+XHRqXGx9oc7VCck
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(2906002)(2616005)(36756003)(186003)(7416002)(8936002)(8676002)(5660300002)(6512007)(6506007)(26005)(53546011)(478600001)(76116006)(66946007)(66446008)(91956017)(66556008)(66476007)(64756008)(6916009)(4326008)(31696002)(86362001)(54906003)(38070700005)(31686004)(38100700002)(82960400001)(122000001)(41300700001)(83380400001)(6486002)(71200400001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEc0YjA5WlhoRGZNL05VaFhGbmUzL3BOcENuY2JlUS9PS0Q3d3kyRmpsdkRH?=
 =?utf-8?B?ckcreEV2bWZJVzdmcDAzdk9hUXF6cVpMSU9JcDNCVVh5Z2FWM1RYS0pWNzN2?=
 =?utf-8?B?TEdxeWVwWDlGRGxKNGVOUVgxY2t5WlFrWFNCRDlBMEtlQ2tZUUw0MHJyeDlm?=
 =?utf-8?B?eDBVVGMxZmdDT0tvRzJOYzljcG5rVEUvNWlmM01lcE05cFVKVVJET0NSb3FP?=
 =?utf-8?B?M3FJdzk5WHpXVjhjN1FKUS9UUmpzSnE5UDJ0cXhyWjBaRWpmQmtkaGo4OUlZ?=
 =?utf-8?B?VU9jbEdVVm1oYktyT1k4NEpXcUdyN1pJVytnMTVUOG1uUjk3UU9DdGhTbTNF?=
 =?utf-8?B?ZDJTZHBHVW5TU2txUmtGTFlEL2xYTUsvWDJjU2tBU25KNEpLc3dZcURsMFJM?=
 =?utf-8?B?ZXdNTFRabENkdFRYZ3JRdjFiYnEyeGwraFBiMmdKeEVVVDJlZ3k2T2dsNld2?=
 =?utf-8?B?RXNtTm5uSXk5ZnVxcTFpc3BRNVBwT3FtM09UemFvdnlrMWwxRWJpOGhPd0JS?=
 =?utf-8?B?V01jTmdJWXZVSlNwV2tWdzArZmdiaHpsVjZBcGF6WHB6eUJHTGVyelFRV2JJ?=
 =?utf-8?B?OFVPTTVjYVpreDNxbDVPeTlLSUY5UW10bEV6SmRFU0M2UXhIQU44eWw2dk5t?=
 =?utf-8?B?QjgzWi9mRDdDMXNyRkY5SC9aVmpvbzlZSkdDU1ExMVZCREh6cnE5amVleEpC?=
 =?utf-8?B?NE1tdVRPdGZuV0VJcHAwOTN2cXNLYUV1RERmVzg4Q0VtbE5ZcVlUNEJDMTE5?=
 =?utf-8?B?WitjbDBTOWU2NFhkdlVibllNREc1N3QzajYxY1p6WXpjN082WUJFT2FlYjN6?=
 =?utf-8?B?cithbEcvQ3k5ZThFMlA1N1Z3SEk4WE1NeTRLME5OUDlXaUc2UWxkZUNicnR2?=
 =?utf-8?B?NmFnUFUrOWlpWlVMTzV0RVFDLzlPZmlXMmV1SHc2RW9CdjNaVkpCT3Y0M2pD?=
 =?utf-8?B?YXd0STFUQ2FoUmlVOWFIbWFDTW02dGR4TVlxTnd6UnBGOUtQeWJycERUN25n?=
 =?utf-8?B?SFhEYXZWQ3pUSXRQb3dOZmVSdlRMVlUrUFZhMHdNdDNzakx0Mmt6KzFRbUNx?=
 =?utf-8?B?MDQ3TzVHYVRta0ZVZUdvUU1wK1l2eHR3UnU3a1czQks0ck1SbUhtMkVYL2Ew?=
 =?utf-8?B?R2xpRmxMbE5WRjdBaXBQL1dudU9YNktaelFUU0pvVS96K0xsbFNVZnVKamhO?=
 =?utf-8?B?YTdLajlzL2plSWdjNk9nREF5M2MzWlVSb3czai91czFoTjJOK25QdEJIUklV?=
 =?utf-8?B?NXBlNHhLd1FZUUpXUGxqSUcyUVVCVFFnQWsyc3lVbWdybENaN1Q4WkphbzBk?=
 =?utf-8?B?bUJ2UEUxTmowT0FJYjZzT000WHJYSk8zVE53QVZkNnhkMHJLWEVjT1pDTm05?=
 =?utf-8?B?cHBTVmVyKzJJanJwYlJEcGhYOXVmQW9TeUJ0OUh1dHNLYUxhZzM3LzZqUjhy?=
 =?utf-8?B?c2REYmlWVXF1MVRRV2I3TnpxM25BbDQyYmliZm5wUFpDdzR5WHpTekthR2Rl?=
 =?utf-8?B?TERNalc1OHBtRzVIdXdwcmJ6dGJvU09tRWQ0bnFCRkhLQjROcWUxQVpSTmU0?=
 =?utf-8?B?MTRZM3FTejJKZ3FKa0pSMTlSckZralhRM3BSWUovQjl6cHQ3cmpmMVEwVjVG?=
 =?utf-8?B?Sm04WlpTSmxQSTZkckEzRkptY2wrb2NPUlpGNGRVVzgvZkhKdW5vM0RxeXdE?=
 =?utf-8?B?TDdMMjJHdDRXS1FQL1VTdUJBUDBhekxWUUw4VmxpRHUyQ1RPaURFRlRyZW5u?=
 =?utf-8?B?dmhZU1Z6dkZIMFVCWStwQUNPa2dZeFpxUWhRV0h4aW1zS0c4Vm5idC9HWG03?=
 =?utf-8?B?UTN2ckdIeTZyTmdlTHJHWnp0REtBak03VW1hUy9RbC93Szd5clh0Nm1yM2pV?=
 =?utf-8?B?NUxRVXhJY1ViOEg5NkcwRG11cFZxZVJGNmQ3MVpBdm5mWndJaTR5cDcwS3Jz?=
 =?utf-8?B?Y0UyR2V0YmdGdG5ueXY4TUtiMVRBekwyMW5yTVByZ3lqa2dyV1lZd1lXSTZ2?=
 =?utf-8?B?djFDZ1pWbVZhZHBJTjdlS2l1VUtBS1hscjJQckV6VXZHOUxHaEZHWUNnTVE5?=
 =?utf-8?B?SGNjcHBvQjBwWjN6bnY4REFzK3VhTHpQekdnQzZTVmpvSGdYaGM2bVA5Rm5o?=
 =?utf-8?B?RmdGQ2J4b3VTTjJmQ0djNFdkRVpEM3BsbG5waVUwZ1hydE41OXk1OVZ6RC9N?=
 =?utf-8?B?N1E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?aEVQUzFCd3VIc0EvVDZOaCtuTE9WeHVIWUVoV2FMdVkrOS8wbm44bGZtSmhW?=
 =?utf-8?B?QjNRUXVHN2lqWUJZSHFXUExQNFdjcCt4S05TRXFKSEJZbFNXeVdxOXh3VFBn?=
 =?utf-8?B?dll6cHNzaThid2FROS94Qll1SUl3UGxaQVBLWjd6K010blcxQk1JVFIxd3Y0?=
 =?utf-8?B?alFYQjJOTEU5UEd4aHlGK1EzRHdCTW44QzlSMlh3TkJGeGhyVXFqVlAxSFMx?=
 =?utf-8?B?S24rYnpkQTVVa0tNa2djb2pqd0lRbC9Takw1S0FMQ1QvWWpEeDRIWW51SHZa?=
 =?utf-8?B?V3A1NkFDbG9UMllMSzVIV2hYc1NRNEtBdit1dXQ5ZnZWazFoSTVCOGtSVXIy?=
 =?utf-8?B?WjF3YmdsRzRuWkQ2d25uRG5SbnZEclF5U0FoR0JBclZlUzdpTTZuekRzaXhx?=
 =?utf-8?B?NUpSSnY4MUR6ays1a1Z5VWw3bVBwdHgvMnMvdjNCR2g2Q1RmaEloWEdjZW9C?=
 =?utf-8?B?Rmp2VHV0WFVFdWVFOS8vQ0tybzY1eXZXWmk4d3MyVWZ5ODhhMFF1R1VGV002?=
 =?utf-8?B?ZEtmVHUzb284UVFtRjJhZGFRSWNUK0VrSW5JRktJQmVpd1hJMmpnN2JqNnlR?=
 =?utf-8?B?a3U2dDRIR2ZsOXVNQ3Q3aHpSKytIaGk0b0VEZDZhaU10VUIzRVRwalFkNGZB?=
 =?utf-8?B?Yk9FLyt3UnJ4VytRVGF0azNYVzFIVGF2Q1BxK0p4Tm81cGtvTTA2aGpyKzk1?=
 =?utf-8?B?UEoxVjhVYVNtcktOQVpITGFzMzNiMUgxVmVPdm5jSHVJbHRxOEFZR2xPcWVo?=
 =?utf-8?B?NFRtYkhrM3ErZnFnR0V2cmxLWFFVaTJWWGJQVWJBcHBvR0ovSXF0R25HOW1m?=
 =?utf-8?B?K0dobkpWbXNKUnNuSVVEbDhyT0lzUXEzMENkZE04bENnUkdDTzB6QUpRb2Q5?=
 =?utf-8?B?Zmc3QWVlY2hPd1FuZmhOYW1uMXpidGovRzlBNUdJaDk5VnBOZTNIM2cybk1z?=
 =?utf-8?B?K05aRE5YZk1HM1dwR3dhTVlsWGFTVzgzdU0yMTR0UHdHQ1I2VjNndVRtV0Zp?=
 =?utf-8?B?Nzh0QnE4Y0ZoWU9TTWJZaXNXUUFXQnNTSW5id01HM2hDdTJHdXpqWjhBWHk4?=
 =?utf-8?B?cElZMVFLdW1ENTY1UVFBUkxDNW5rbFdBTE1qRHdKRjFzbkpNYUxoblpBenRl?=
 =?utf-8?B?REU5RXl2MHpBYWJXOGNKZks0VGJMTVVyUDhwbUFWaVlUMnRqbkxPb1VielI1?=
 =?utf-8?B?amVkaEpPL1VSUEF5cTJqUFd0WHBZS2NvRE5Wd2FIWDNwc3ZmOVFrK1NlNEVt?=
 =?utf-8?B?WVhyMEVqYXpsdWM2dUk4ZWx6bzRUR1RXZU82ZlpEMzIvMENHdng4NUNzOTNj?=
 =?utf-8?B?RlJjWlRLM1lLZUxhWUs4NE5ISCsrbENyZ0Z6NzEwVUN2blJRYXUrM2M4RklE?=
 =?utf-8?B?NTVvQXNTbS9zRExEQWZhZjIyc083bUtZN1Yrc3Z5K010SnZJcmRkSTNnZExa?=
 =?utf-8?Q?Y9fq9wqj?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 262b5e88-09e9-4ae5-6bc5-08db5c3e50e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 10:04:51.7717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VozgkTsI0CL0LEFam+6i9yjWBGwiLP3fXs/RJbD7eYFaUorPGutW5eD3DaJJ5Oyg8UQpPJbogB/j2sFLfiJRKt53r9qmhxKUO2FotDyyAgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7084
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v5 00/20] bio: check return values of
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
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, "kch@nvidia.com" <kch@nvidia.com>,
 "shaggy@kernel.org" <shaggy@kernel.org>, "song@kernel.org" <song@kernel.org>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>,
 "willy@infradead.org" <willy@infradead.org>,
 "ming.lei@redhat.com" <ming.lei@redhat.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D085CFAB0618A84DA213ED2BB24DCB14@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMDUuMDUuMjMgMTY6MTIsIEplbnMgQXhib2Ugd3JvdGU6DQo+IE9uIDUvNS8yMyAyOjA5P0FN
LCBKb2hhbm5lcyBUaHVtc2hpcm4gd3JvdGU6DQo+PiBPbiAwMi4wNS4yMyAxMjoyMCwgSm9oYW5u
ZXMgVGh1bXNoaXJuIHdyb3RlOg0KPj4+IFdlIGhhdmUgdHdvIGZ1bmN0aW9ucyBmb3IgYWRkaW5n
IGEgcGFnZSB0byBhIGJpbywgX19iaW9fYWRkX3BhZ2UoKSB3aGljaCBpcw0KPj4+IHVzZWQgdG8g
YWRkIGEgc2luZ2xlIHBhZ2UgdG8gYSBmcmVzaGx5IGNyZWF0ZWQgYmlvIGFuZCBiaW9fYWRkX3Bh
Z2UoKSB3aGljaCBpcw0KPj4+IHVzZWQgdG8gYWRkIGEgcGFnZSB0byBhbiBleGlzdGluZyBiaW8u
DQo+Pj4NCj4+PiBXaGlsZSBfX2Jpb19hZGRfcGFnZSgpIGlzIGV4cGVjdGVkIHRvIHN1Y2NlZWQs
IGJpb19hZGRfcGFnZSgpIGNhbiBmYWlsLg0KPj4+DQo+Pj4gVGhpcyBzZXJpZXMgY29udmVydHMg
dGhlIGNhbGxlcnMgb2YgYmlvX2FkZF9wYWdlKCkgd2hpY2ggY2FuIGVhc2lseSB1c2UNCj4+PiBf
X2Jpb19hZGRfcGFnZSgpIHRvIHVzaW5nIGl0IGFuZCBjaGVja3MgdGhlIHJldHVybiBvZiBiaW9f
YWRkX3BhZ2UoKSBmb3INCj4+PiBjYWxsZXJzIHRoYXQgZG9uJ3Qgd29yayBvbiBhIGZyZXNobHkg
Y3JlYXRlZCBiaW8uDQo+Pj4NCj4+PiBMYXN0bHkgaXQgbWFya3MgYmlvX2FkZF9wYWdlKCkgYXMg
X19tdXN0X2NoZWNrIHNvIHdlIGRvbid0IGhhdmUgdG8gZ28gYWdhaW4NCj4+PiBhbmQgYXVkaXQg
YWxsIGNhbGxlcnMuDQo+Pj4NCj4+PiBDaGFuZ2VzIHRvIHY0Og0KPj4+IC0gUmViYXNlZCBvbnRv
IGxhdGVzdCBMaW51cycgbWFzdGVyDQo+Pj4gLSBEcm9wcGVkIGFscmVhZHkgbWVyZ2VkIHBhdGNo
ZXMNCj4+PiAtIEFkZGVkIFNlcmdleSdzIFJldmlld2VkLWJ5DQo+Pj4NCj4+PiBDaGFuZ2VzIHRv
IHYzOg0KPj4+IC0gQWRkZWQgX19iaW9fYWRkX2ZvbGlvIGFuZCB1c2UgaXQgaW4gaW9tYXAgKFdp
bGx5KQ0KPj4+IC0gTWFyayBiaW9fYWRkX2ZvbGlvIG11c3QgY2hlY2sgKFdpbGx5KQ0KPj4+IC0g
cy9HRlMvR0ZTMi8gKEFuZHJlYXMpDQo+Pj4NCj4+PiBDaGFuZ2VzIHRvIHYyOg0KPj4+IC0gUmVt
b3ZlZCAnd29udCBmYWlsJyBjb21tZW50cyBwb2ludGVkIG91dCBieSBTb25nDQo+Pj4NCj4+PiBD
aGFuZ2VzIHRvIHYxOg0KPj4+IC0gUmVtb3ZlZCBwb2ludGxlc3MgY29tbWVudCBwb2ludGVkIG91
dCBieSBXaWxseQ0KPj4+IC0gQ2hhbmdlZCBjb21taXQgbWVzc2FnZXMgcG9pbnRlZCBvdXQgYnkg
RGFtaWVuDQo+Pj4gLSBDb2xsZWR0ZWQgRGFtaWVuJ3MgUmV2aWV3cyBhbmQgQWNrcw0KPj4NCj4+
IEplbnMgYW55IGNvbW1lbnRzIG9uIHRoaXM/DQo+IA0KPiBJJ2xsIHRha2UgYSBsb29rIHBvc3Qg
LXJjMS4NCj4gDQoNClBpbmcgYWdhaW4/DQo=

