Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6D6F7E64
	for <lists+cluster-devel@lfdr.de>; Fri,  5 May 2023 10:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683274183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Iz/H+ZBxCfkS6Lf28z9lYdEy/mLDJr1S9apLE5DgGhk=;
	b=bPXBj3HMcBp9dVyL1xEl0VS89SF1DcMLfuFuyaL9lbxtjfz531uvxPuGz7aoAsRMVh7eTT
	2ysglSijA9PNpTtImuKEbdxkVRvjt35Bn3KmKibmslKHhHKoSU8EMUuheEbCdkG7Sgn5Bi
	FJM1eCuURu5jZBdSTUq0SQnJJi/F8JA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-LI3q6W80Nm-k62SxI_4cyg-1; Fri, 05 May 2023 04:09:38 -0400
X-MC-Unique: LI3q6W80Nm-k62SxI_4cyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FE5B293249B;
	Fri,  5 May 2023 08:09:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A42563F91;
	Fri,  5 May 2023 08:09:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3290A1946A54;
	Fri,  5 May 2023 08:09:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C93391946A43 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  5 May 2023 08:09:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AE0ED492C13; Fri,  5 May 2023 08:09:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A624F492C3F
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 08:09:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87611857DD9
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 08:09:35 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-vpXCx-pgN7SxQIvr1zLFrw-1; Fri, 05 May 2023 04:09:31 -0400
X-MC-Unique: vpXCx-pgN7SxQIvr1zLFrw-1
X-IronPort-AV: E=Sophos;i="5.99,251,1677513600"; d="scan'208";a="341985589"
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hgst.iphmx.com with ESMTP; 05 May 2023 16:09:28 +0800
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by SJ0PR04MB7789.namprd04.prod.outlook.com (2603:10b6:a03:37e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 08:09:26 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f%9]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 08:09:26 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: "axboe @ kernel . dk" <axboe@kernel.dk>
Thread-Topic: [PATCH v5 00/20] bio: check return values of bio_add_page
Thread-Index: AQHZfN/AsiDj2VYjN0WoDrrCAoWRkq9LWBCA
Date: Fri, 5 May 2023 08:09:26 +0000
Message-ID: <1ac1fc5e-3c32-9d62-65bf-5ccbb82c37cc@wdc.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
In-Reply-To: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|SJ0PR04MB7789:EE_
x-ms-office365-filtering-correlation-id: b816bb53-c728-4795-462b-08db4d400b33
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 4AMGp92j19UBZNXDdTzVhLLpOZVznAaCyjJMCxcXSaetz2HulRwiia3lrBJcVpt2qOiMmVnBAiPHrxGLMTWBY4plc75VBDuPO8L7OzT7oDKITDpAlcxqASGMJCUmDmMPG2aAhDIeQSExQoKCQTA2LaNmMhelrlhXcWUyjDIhXnegtk3JPTxoahrRiROG4Dcvokg7i0WNWVbP4M1xs6oNKKFHaM4y49K4rcCNTFMkgIriC1iPTj224AoKu+xfAWoSB1vjD8BRfncWxEoD5UaL4C+ybK399wFh+XVcPvl+KIezMbUrOe2coEs3iOrW6uJnye9zlZ+PxATsqpWZeSvkHD4jlrSz0adUe177Xikfujt65bS9M8ZJ7/lXZAGhp65ckWzGHwBnlScNNtgq180R9aOJ5EDU74LPr4ZtjOJfDt8nkXHHfpCmK7Gngw/I0i8SIeztIUIY0fHFMQCu7MJyZNr4+zKrt4laLLiQC6V3uZepAEM8LWXQDIuoCR4Ovj876wpg1meUoCkGHuv3F++c5hyERvjVXIjyWMW4CoSLJ6dHCvgnqbFAK4FuozMGP4J39orW/NGl6b1tCaP9MssukW+Tj3petCjgY/5/7ZPBZcL+kcng2yJ+63ZKCXphAHZrlO9lSh1U1JZ36/gAspErconMRbTBGNDNcHKVQfv6FFEP2IOt0mfkla3vJJsUk+T9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(31696002)(6486002)(86362001)(36756003)(71200400001)(54906003)(316002)(91956017)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(76116006)(66946007)(478600001)(41300700001)(8936002)(5660300002)(8676002)(2906002)(7416002)(38070700005)(82960400001)(122000001)(38100700002)(186003)(2616005)(6512007)(6506007)(26005)(53546011)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RU5NY2xDeDBkRGR6aDFlbS9MbFBKSTh1TWxEZVNzYVE4ZWZvM29UUWN6Mndj?=
 =?utf-8?B?OGgvcUpQS0YxSXYrMnIrVndRczZua3NvRWxFMTFiTEg4U3E1Qjc5cUQ0M3B5?=
 =?utf-8?B?NFNXbmJzcjlVcEJvS2dHK25qYlVGT1lWSVFwanhJd1VmZEhtOWpBVUtJSDFS?=
 =?utf-8?B?b1d6WVIzaytOVDJoanFuZzFoN0JmOG1VMU1lZ3lJcGNaMnU2d1FHbVpWVS9j?=
 =?utf-8?B?L1hkb1FnMkRZOVlUMit5Y0R0Rzd5bWM1blhJVkl1UUFSZmZnd0pQUWtaRXpV?=
 =?utf-8?B?WjVsT1JDZEZXTzVqenFMNTZ6dnMxai92SU5mRk16a2JDZW5teFlHMDVDSHNr?=
 =?utf-8?B?Q3grRGk3K01WNStndnNCa1F1S0ZpTUZXWTVhSDg5ZlJ6bHMrQ0JUNFpJWXI1?=
 =?utf-8?B?RzM1aE1wUU12RU9WRlZwV3pWL1ZCTGR2eHhJMm5UMkttRGhRZUN6dTdNUmxC?=
 =?utf-8?B?RGN0QkZLRlNOMDJ5d1NWVDFoaTZTWHBjZkpmYU42ZXRqYy93T2h6T2JzcU9u?=
 =?utf-8?B?QzRUUCtKM1lKZ1hCaEtuUlV0dE16anhxS24waUNQOEZOcVhyWll2WXJ0TWZr?=
 =?utf-8?B?MDNzVjZWbUtTTGkvRnRuMEErUzlsWTlKZnV3eGMrNzUwUzk0TElwdkFEYk1F?=
 =?utf-8?B?blBxL3QxVHhnK3V1aDNuU3FtVVhKYllyRFl0K1lhZjY2alJCbDI3VVMxWHFi?=
 =?utf-8?B?RmNPOU1LUlMrR2hEUmVQSDhUanl6MXJwYlJjKy9DU0xKbklNT0dDSXVxTlp6?=
 =?utf-8?B?TXVaRHdDSDFKdTJGS0N1UlR5WTVzczR4cVh1TXlkWERMaWpwd3lRMnpxa0tN?=
 =?utf-8?B?UFpsbWF5WEgwUThYbnhGQk0wRTNFZ1hqaHA1c0pGbkEvdnRtNkFCS2trYzFN?=
 =?utf-8?B?NE9KZDViL09vS3U2b2pRSldpOWJGRWFQZlZCSlBFdTlvZk45N2ZxTXBYeUR1?=
 =?utf-8?B?SERMWWZFdzY1WlpFZHBtc3kyRVkwOEFWRDRUZS9rdnYrOFU2OTFJdjFqSStC?=
 =?utf-8?B?c0U1cjc5UFNXQkN0bnFXSUVObkc0UDNIY2ZJUlRKWkhBM0M5SUVsU0hTNDMv?=
 =?utf-8?B?bHNCaFdTclNwdXBmaVg0aVliTk5RVkdxUjc3aVViNEVFWVkwWnpNK1p0Nkcz?=
 =?utf-8?B?Q1M0QnAxVmREeVRjM2YwZy9DZ2tHNUx2dkxQWUtaQy90ZFhrSlIvc2dIU0F2?=
 =?utf-8?B?WFJ3ay9oSy93TVQzYlNIcDN4QlN2Qk5pUjVEN1RTTG02cCtOZ2MreDlKem5t?=
 =?utf-8?B?eEFaWEFDY2E4eVRONVlVdDJlUWlUS0NhbThCQ1MrRWszMzdOV0Y4QnA0MkYv?=
 =?utf-8?B?S3pjMEsveGZRNTZSRkR6TUVreWhKYlBOc2ZDZ0REOCtYaVY4RytPdjU3aEJs?=
 =?utf-8?B?aSs0VkxTeVZPdmR0WVBiZ25rUmRKSUhidnoxRU1vV2lvckgxcXFjb2VJUFZO?=
 =?utf-8?B?RUYvU281QXJpK2J3WWNGdHNtR1hZWGNIQXBoc0l3dEtGNElmWFdDN09ZNTRU?=
 =?utf-8?B?TnNrR0JxUTVYV1lwT0hOQnFRNGw0M0IxWXF4TUUrTVlBNVpveWMyZG0xUlRu?=
 =?utf-8?B?am9GeHM1RnMrbzZnNzU1bUZSbHJDRFRjWlUzK21Nc0xnV2xhMWFxRVFrbGVX?=
 =?utf-8?B?WGE2eFppRERMVlZ4OEplbE5OSU1aRGdkcTdtdC9jOXZsclBzZi80T2hwNEVK?=
 =?utf-8?B?V2tGTktWT0NyZ1FsVE1UYWhoL0NhdFYxS3R6OVk2TGtVcVpjMGppbUFvaFZY?=
 =?utf-8?B?Vy92dllBNEYvUnB3TnNXeWhqbUMvN01xaTBGeHlScUtCS0JOYkVLYmcxRHor?=
 =?utf-8?B?R3pPWW5BcG1Id0RWREpKTnFjMW15cElTam9iTEYzVUpJanlodGdkaThxSUpj?=
 =?utf-8?B?cVVoSUxJRVZTMWF1TVpRU24rdDIyb1UvakdvWGlFaml0R3EvRnNtbHU0Z29j?=
 =?utf-8?B?S3pQMTRCSktGYURBcDdWUHlqWmdvbytQWTdEejZjRHdValVGdS9wOWNWaTFI?=
 =?utf-8?B?dk5kcHpLeHNzaHFWQkFRaTN1WDhma3liaDBKVjRzODAzaGIySVgrcWt3L3NY?=
 =?utf-8?B?bHBvQ1JDRjY0Unc4aVN2TEdkcmltaW9DbGRZZyt1aEdmWGlxdG52VkxIZmxI?=
 =?utf-8?B?RE1VS2lvekxQV0JCMllLeGRqaVpQVWpGSUxrb1pHQ2JINFBQenJPdjZoZEpk?=
 =?utf-8?B?Qmc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Z0xobHV3UUtiNkNVeEdmYWphQml4WUJPenZDblJqNjFyb1htUWxyNk1KeVNN?=
 =?utf-8?B?YmxUSzZQWmEzU2VKYldENkZHaU16QXp5RkpxR2FVQStIUFJUSmY4ajMzejJS?=
 =?utf-8?B?VFFRTms4QTBhdjFTVExtWktST1c3LzZ3eUc4cStwUTV0TGdBdndGWWZLNU9h?=
 =?utf-8?B?T3NWc2ltUTRTQitXaWk4K0lCZjlBTkQ4OXVXVnlIOG0yZ3lwcStlUndieTBu?=
 =?utf-8?B?TGpZaGhwRVBhRWRKNkRhOEl6b0tpcXk1a0o5RXE1RndrWDY1Y2prS29LVVBp?=
 =?utf-8?B?d1JGWml6UzNXZG03WVpVdTVpYmNtVXRPVkxNQWxiQkkrYzJ3WHdLTGVid3RZ?=
 =?utf-8?B?N3pidk94YysvZE9TTDJITmN5TnU3cHlHYktWSnkzQUw1cXFhQ0hUalp0TjFy?=
 =?utf-8?B?RnFLdzM0WHNPdHhUOU9FaEdrRmxXTEN0b3VEZThsSnhzblJRb3VnZ1FXMGZO?=
 =?utf-8?B?R2toQzl1WGNHR2hwajl5eFp4eW1SRmpzb3hFRk83SmgxT3VMQUJSWlhlZUJ1?=
 =?utf-8?B?YUtka0xXcTBLSkdpTXQvdVpLdXJyZG5SWjFLSG5kQmhURHNrQmdxcWtZR3Q0?=
 =?utf-8?B?RjkrUjJqLzJDeG15Q0RpT0ZBOFJDS0wwNERRU095NU9yQ0QzY0hQc21EaUFr?=
 =?utf-8?B?M2xjQmtWQk9oN3JxRmxHWExiWUg5VzhJaXovQkhzZkxubTVhblQ0ZmVGUW9H?=
 =?utf-8?B?SXEvMUZPa3k5ckFGWU9oRllnWjdUZXAzNVhmYUQwVUkzcG1DY0lJOEY3MzNZ?=
 =?utf-8?B?Y0E2VnV6T0d1L2twVFczcHFjTm1hdDBTMzF4Y0tOMlpCOXhGaytYNmE3VTNo?=
 =?utf-8?B?ZFdCWDRFSWR1WlJhTnp4QzJMSjNBcVdoam5ZdjhOcm1JQU5JOUwzWFdKUGk0?=
 =?utf-8?B?Um9PMmJFRFpTV2RwMCtIS0lKTG1nb00yOGdJUlIzdmJXNVZkVG5UK3c0alJa?=
 =?utf-8?B?cDFYSkExdVZuaXM5Z1I4NGRjclJEeUZkRFd0T3JtRm5WUVRwZ0IxZi9rMHhi?=
 =?utf-8?B?L2h2Qm9IWFZaTnpZUWFXL1NWeGFpbXA4WTB6WkNZWEdKV2orNEZiWmJIUVZN?=
 =?utf-8?B?VXhlcDJvckxLYnFxclh6enZMWnExMmFVSzFBVk1KbzNvU3ZrRGhGTVFzMzlU?=
 =?utf-8?B?QVh4aFY3SU5ld0VxWmE4Rno1b0w2WDdzRU5UVVkveUp3V0kvNzkwVmJTSEJJ?=
 =?utf-8?B?ZjlMZFpVQVBMOWlPR2xYelE0bzVHZlRFM091cVVXZi9pSUx0N0N6VFVoRDRO?=
 =?utf-8?B?ZUlhNzJWVEhQOWtGVDQ1Z3pMRmxNN01DbFF3QjdldHNyRkJrUS9EMVhYSnpn?=
 =?utf-8?B?WXZpcmJtb2tZKzBFTWJwdElObjFrd0FMRHNFWEhRejQrSFQ5SXVCSEJJS3ls?=
 =?utf-8?Q?BgHtTMA8SnCtLPj+7rWPbVaqxeJlYhGI=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b816bb53-c728-4795-462b-08db4d400b33
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 08:09:26.3758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9FcFv04fNHEmzePUQq8DNn9WkFi9HX3bApreEe0T0e8AZgZIV7ME78AdVTGItDuhA6CkGyA6TUbo/cZoh0soroRy3YbuL0p2pU2KfnmF9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7789
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
Content-ID: <8B44041DF394F64F9C60DE91013289E3@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjMgMTI6MjAsIEpvaGFubmVzIFRodW1zaGlybiB3cm90ZToNCj4gV2UgaGF2ZSB0
d28gZnVuY3Rpb25zIGZvciBhZGRpbmcgYSBwYWdlIHRvIGEgYmlvLCBfX2Jpb19hZGRfcGFnZSgp
IHdoaWNoIGlzDQo+IHVzZWQgdG8gYWRkIGEgc2luZ2xlIHBhZ2UgdG8gYSBmcmVzaGx5IGNyZWF0
ZWQgYmlvIGFuZCBiaW9fYWRkX3BhZ2UoKSB3aGljaCBpcw0KPiB1c2VkIHRvIGFkZCBhIHBhZ2Ug
dG8gYW4gZXhpc3RpbmcgYmlvLg0KPiANCj4gV2hpbGUgX19iaW9fYWRkX3BhZ2UoKSBpcyBleHBl
Y3RlZCB0byBzdWNjZWVkLCBiaW9fYWRkX3BhZ2UoKSBjYW4gZmFpbC4NCj4gDQo+IFRoaXMgc2Vy
aWVzIGNvbnZlcnRzIHRoZSBjYWxsZXJzIG9mIGJpb19hZGRfcGFnZSgpIHdoaWNoIGNhbiBlYXNp
bHkgdXNlDQo+IF9fYmlvX2FkZF9wYWdlKCkgdG8gdXNpbmcgaXQgYW5kIGNoZWNrcyB0aGUgcmV0
dXJuIG9mIGJpb19hZGRfcGFnZSgpIGZvcg0KPiBjYWxsZXJzIHRoYXQgZG9uJ3Qgd29yayBvbiBh
IGZyZXNobHkgY3JlYXRlZCBiaW8uDQo+IA0KPiBMYXN0bHkgaXQgbWFya3MgYmlvX2FkZF9wYWdl
KCkgYXMgX19tdXN0X2NoZWNrIHNvIHdlIGRvbid0IGhhdmUgdG8gZ28gYWdhaW4NCj4gYW5kIGF1
ZGl0IGFsbCBjYWxsZXJzLg0KPiANCj4gQ2hhbmdlcyB0byB2NDoNCj4gLSBSZWJhc2VkIG9udG8g
bGF0ZXN0IExpbnVzJyBtYXN0ZXINCj4gLSBEcm9wcGVkIGFscmVhZHkgbWVyZ2VkIHBhdGNoZXMN
Cj4gLSBBZGRlZCBTZXJnZXkncyBSZXZpZXdlZC1ieQ0KPiANCj4gQ2hhbmdlcyB0byB2MzoNCj4g
LSBBZGRlZCBfX2Jpb19hZGRfZm9saW8gYW5kIHVzZSBpdCBpbiBpb21hcCAoV2lsbHkpDQo+IC0g
TWFyayBiaW9fYWRkX2ZvbGlvIG11c3QgY2hlY2sgKFdpbGx5KQ0KPiAtIHMvR0ZTL0dGUzIvIChB
bmRyZWFzKQ0KPiANCj4gQ2hhbmdlcyB0byB2MjoNCj4gLSBSZW1vdmVkICd3b250IGZhaWwnIGNv
bW1lbnRzIHBvaW50ZWQgb3V0IGJ5IFNvbmcNCj4gDQo+IENoYW5nZXMgdG8gdjE6DQo+IC0gUmVt
b3ZlZCBwb2ludGxlc3MgY29tbWVudCBwb2ludGVkIG91dCBieSBXaWxseQ0KPiAtIENoYW5nZWQg
Y29tbWl0IG1lc3NhZ2VzIHBvaW50ZWQgb3V0IGJ5IERhbWllbg0KPiAtIENvbGxlZHRlZCBEYW1p
ZW4ncyBSZXZpZXdzIGFuZCBBY2tzDQoNCkplbnMgYW55IGNvbW1lbnRzIG9uIHRoaXM/DQoNCg==

