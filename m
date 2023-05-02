Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D34036F431F
	for <lists+cluster-devel@lfdr.de>; Tue,  2 May 2023 13:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683028516;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FdWLgHzChMvEqWmkkdWNNPQcspsCHzDrBOXCYhoC5EQ=;
	b=ekCjQUjXp3cZklvmSbxXQsHxtPn2GNkyXAcQBlGoI6yi6qbTcxcqrFHcDUtmSMFGEh4inZ
	eAyxF2jCw1mHltOk9C0yMA1nsvPm+YEYZbGjZhOHvNVsjRlusibzoWwBVhJ9c2pXh9RYqm
	CkrsHIFa/gnHPqJqrGOYBRW01MbS+Go=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-Tzt7db0_MYayPHsBW4q8Dg-1; Tue, 02 May 2023 07:55:12 -0400
X-MC-Unique: Tzt7db0_MYayPHsBW4q8Dg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67EC4109DCE6;
	Tue,  2 May 2023 11:55:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54F032166B26;
	Tue,  2 May 2023 11:55:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0CE1C19465B2;
	Tue,  2 May 2023 11:55:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 045D719465A3 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 May 2023 11:55:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D7EE71121331; Tue,  2 May 2023 11:55:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFA81112132E
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 11:55:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CAB528004E8
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 11:55:09 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-IdlVZZqfP1SwtYWpNtBH2g-1; Tue, 02 May 2023 07:55:05 -0400
X-MC-Unique: IdlVZZqfP1SwtYWpNtBH2g-1
X-IronPort-AV: E=Sophos;i="5.99,244,1677513600"; d="scan'208";a="334142206"
Received: from mail-dm6nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2023 19:53:58 +0800
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by DM6PR04MB6748.namprd04.prod.outlook.com (2603:10b6:5:247::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 11:53:56 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::8c4d:6283:7b41:ed6f%9]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 11:53:56 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Bob Peterson <rpeterso@redhat.com>, "axboe @ kernel . dk" <axboe@kernel.dk>
Thread-Topic: [PATCH v5 09/20] gfs2: use __bio_add_page for adding single page
 to bio
Thread-Index: AQHZfN/ah0SwlMtQ0kSzU0wxjKFb7a9G3voAgAAA0gA=
Date: Tue, 2 May 2023 11:53:56 +0000
Message-ID: <a8a8ee20-7783-e955-aef7-edb5a24aa0ae@wdc.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
 <20230502101934.24901-10-johannes.thumshirn@wdc.com>
 <5f3ddda1-2c7d-811c-ffd5-5fc237def2eb@redhat.com>
In-Reply-To: <5f3ddda1-2c7d-811c-ffd5-5fc237def2eb@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|DM6PR04MB6748:EE_
x-ms-office365-filtering-correlation-id: 00cbf530-5240-486b-99aa-08db4b03e8ec
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: MX2VmU4azCp50HFyOIRsRl/07ncpM7doGZZbvlI2RSE+BCCi9nSoO6uILoFAt5DnKMTh7fvZkwe0AWm+IFw6gWPjS14kyp+TPxdlOtXeEvJJBB23jbsA8gLhGDlEl+r2Ii0uFUhlpGlDdc85DyGZYCNaZuz5AEtgUor5Outgx8+56kWSoYb+BkFh348YWb5LUm/egaUJxFsPWdXaR3xekYc3XroVyy8WskWBdyJ+4hZNpl4zXei2ZZCh0/m1Hh7ZKTm+aoBTZUq4S+FIgk0w9hQhEf4uwvqJczx+WBk/obL+tRRsQUtMh6vxeeFT/rBrYUwDFzgsvcVxqgg7QIXd3neqX28YLiG71nn5I9vUDyWS3xkP4sv+QbUPL3jcm4hPUFAKa38HACY5Kwg9IvR6mjJaI8tBz6worfgH0AIkVsUkp6uPNXDagiR0KiaTXrtCK8SXVodJknIid6k5o9FVn6EIN/BLYjb1839PIf4qbD5t1bJStfbMweb0RRVmEoBc5EgbuX3xHcgzZHVMlKQsUkbL40B0sQLklU93oaB9k5xyhRM6HiQ0/rbXVd9LI2smlR7KvDuF91Mm41uCZsK8ZonXMhIlH8WRjqXIEAnNh8s9PrdjporWVzCI08goQm8q5rp/IqZMJsbRTeJ31zmoCmXdKqiDpdQPJpMx7urFMys=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(83380400001)(31686004)(6486002)(71200400001)(7416002)(38070700005)(122000001)(82960400001)(36756003)(53546011)(6512007)(6506007)(2616005)(186003)(66946007)(76116006)(66476007)(64756008)(38100700002)(66556008)(86362001)(41300700001)(4326008)(66446008)(478600001)(91956017)(316002)(2906002)(5660300002)(110136005)(31696002)(54906003)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2hUdHVTOHF0Ukh0MmtIL21UMjdrV1dOdjU0QmVrdFJxa3JvK2dHWXQ4bis2?=
 =?utf-8?B?TG1YR3NVbG5UY1NJQkpIem9TZmd1SHRwZzB4eDNuOFMzYkdOem10NUdxWlA4?=
 =?utf-8?B?SXljaCt2bGY3MlA3d0o3SE02K1dLWWdJM1RFMGNmc3lwSSsybTdrd21wQzFR?=
 =?utf-8?B?eDAxUDloUVZQc0FnTzJvMkxMRW0wcHNPUkxMVG1ZdGNRdWpVcUNiZVBkQnNE?=
 =?utf-8?B?N1pqS0U3NE1NenNpUUMyS1ZLWG0yZ0swejQyOGhkbE5EZUtCRzVpZ1I1cGJB?=
 =?utf-8?B?cWVKT21VMVk5ZFM1YjFBNE5OT1lsQkVOc3ZyYkY1SGtXdXd2SEJ3Z0d6WEJu?=
 =?utf-8?B?QWd1cmZXVjFYL1pXVjNZSUg5RUE2MTEvQ0tkVjhRaG1rcVNpd050WWZ2b0Q4?=
 =?utf-8?B?eFNCVk9PNlhUcXQ5SjB4ZnpzK1dRNVVZTEJXNndWNlR0VEpMNk9DVkVDWE10?=
 =?utf-8?B?RWpONncvaUViVG9DTjVqaTRlT1pwTGdweVVqZzg2eXhCWDErcXFUNEdlRzh3?=
 =?utf-8?B?RzMxN0tUSHErMDNTWklLbFpGbHFkZ1RXWlZYampqNG5rTy9HVGpld3o1RHpt?=
 =?utf-8?B?NkdUWHdnQjY0M050MEVBQXUvSlBuMXlsYTBIdW5aNFk4aDRjWXkwZ2o2QVhw?=
 =?utf-8?B?bkdBaXV5YXRmVGFzSG5abjI4LzkwOUloQysyMi9sM3Uyek5VTGdTMnA5NE5V?=
 =?utf-8?B?WGFoUnlDSmhLS09zbm1uTUNqRWVjYzV1b3o2MUNsbFp2cFptMUFmRzJyNDdv?=
 =?utf-8?B?dmVqRnNRTUh1SVc2YmRmM1hFYVVaNWtVNkphamZONFRpNkJnLzBDTmNPdVBs?=
 =?utf-8?B?M0dJb3ZrSkF0b0ZObUExcWh2Zzg2eVJ0ODd0UFl5TW54dm9XWGtYbUZtdTBG?=
 =?utf-8?B?ekUxaU02SllmZnZnTjBpeDRxMGhKcEJXZEtidHhWUXcxd252bm1TaWNiUzBV?=
 =?utf-8?B?UFlLRGpURzh3V0lqUk5JWm1GM1pKM3ZmQlJXQ01TRGRJVkRwQXVXclJZS045?=
 =?utf-8?B?QVA0NnJqVlpXQUhLREVNbHViall3MTdYOWZDaVo3bU9PSEhrbHN5WWJjM3ph?=
 =?utf-8?B?NmdBS3RVdGhxZkxwWlJGVjVHWFRJZmorVFUraCtObGJyeU95anRlUEl5ZDRk?=
 =?utf-8?B?NDY3NTI3NjQwZHVGR2p3YnE4RjUrUEd0OTVuN1VvY0Q5MUJiVyszRFV5QlRh?=
 =?utf-8?B?eE93MzJMODZPQ2tkTHQzQWlHRktyYlBQTkFUYmVIRUF1SDZXZm9rMW80Um5R?=
 =?utf-8?B?TkZUajQvQjBYQ3JVTDhJQlBFMXJLSGFYREkrVWNvZ3cxbUpVWE0yTUNyVjhY?=
 =?utf-8?B?SGR0dDRmUjIrcE5UNmNHUDFHZWFOYVlMUkt2RzZDQ01HUGxNNnFOaEFESjNP?=
 =?utf-8?B?SHBCK2hkZzJ0bXVVZXN3NHgrN0N0OTM0di9MdmRTMFQ1WHFPaFFiSG1GL3hv?=
 =?utf-8?B?dnRCOHJDaXJLbnZNbzFwb0hGVCtlcTduajdzcDRZOFIrNXNMN0VzSE5ZNWd3?=
 =?utf-8?B?THdrSndDS2Z2RTdsekF1RUhCY1BVWDNRWjNuc25sSFY1N2RiZytYOWVhekl2?=
 =?utf-8?B?em1SMnhEYmUrd0RHWHJORkVUNFBzMCtpZjBRQ2FPaWVaOEtOMXRhR1c0VWtY?=
 =?utf-8?B?L1RTdjljRXZWUGw3QUhYc3pTNEdNZy93Q3ZXZzBzUWQ1VmxLRzAwa2hyNEZw?=
 =?utf-8?B?ZTMvR1g3QUdmc2ZrVzdVc2Nadk41KzViTi8wWHRHdytyZVd2NXZaVENUODQr?=
 =?utf-8?B?NVlKYkpaRVliVDc3cStsM215UDBiVWZmZ2dtWGVCeGZMTmFpeVU5L3BtQmNu?=
 =?utf-8?B?MnlWL0wyc3hqcUhJTHROK3diQ0E4Sk5yeXVQaS8zYkw3V3RvRStOUnl6Skw0?=
 =?utf-8?B?NVZQOEpoaDRtMENxa3I5STNCMitKbFNkY3ZiN25Mc25kTzhNajZQa1grSEx3?=
 =?utf-8?B?RmFyZ3dlZm4zWjFFejN0cGFXazR2M29lUThCbzZaTEFTeE9uSTNxa2tRL3dk?=
 =?utf-8?B?YldYdWNPN0ZUTDBQNzVXNDFtNnNCdWp2WTFzQ0Z2RHpIWUU2Wlk3c3BVMm0y?=
 =?utf-8?B?ZGVrQThoVnBKNzB1TnFkL1c1aThUWmhreHhIRG84T2RydXNxV1BVZDdQb3h1?=
 =?utf-8?B?Wm8yUmhnaVl5RkxKMkxnaFVSQnM0R05Ic0lGVG9jK3ErWHFkUHJtOUN1MVBK?=
 =?utf-8?B?WjNGdW94MkFsQnZENmJBNndYU0U4WUdvd1F6Y1U1Vjh1MFNyeVcxb0ZVVWRm?=
 =?utf-8?B?eFVsQlMrZmJpd0FlSS90dyt6Q293PT0=?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?QXJaMmZ3RWFWbjQvWkxEOWI3TW9MTGtCckFaNDBLMkxiNnp1bWpaNHk2SDVr?=
 =?utf-8?B?aUphZGQrR2hpc2xGclh1MmRBWVp1U04vSW1hT2JvenNTaXhpd1RBRTQ3emhI?=
 =?utf-8?B?TVlEbHpyNFR5TEVwQWJ4SVdmMlhCRVhaK3Bma3A5QjN3YWxtQmoyTDh3OURO?=
 =?utf-8?B?aDB5UlVxWlZBbUppa3ZId1FtclBQckxYNUNmVmRGTEpHVEtFRmdjT3duK1hy?=
 =?utf-8?B?b3Eza29McFRhWkhOZDI2bTI3ditTSTlQemxWZW1rQjZKV3pzYk8rcHVmZENn?=
 =?utf-8?B?ai80a2QyNEtXVUt6OFpQU1gyWndNOWkvRUR6c2J5M05CSHhKODdFY2xyUjdh?=
 =?utf-8?B?TDk5S2Qzcm9HaWJUeENpWFVuODBCT2Z1U1RzWFJybGxsQjVVQVN4L3ZpK2E4?=
 =?utf-8?B?cU5wTEZ1bjByb3lIM3JmUnA3azBucUZ5eGMwbzRYWlJJNGUvaEV2MCswR2NW?=
 =?utf-8?B?NEpNV2xFWE5IVUdueUVYSldrMVdhcFFJc2hMWFFXS0xiSVBjd2F5SlNoMWY4?=
 =?utf-8?B?ZU9zcXJoUmRjclQ2anBQcnpmTDlaYUcweTc1VW5lbmI4cEZsQjNmSUNmZ3Y4?=
 =?utf-8?B?OGZsV2s3WFVpWkVlb2xjckZIdWdVZUZlZ0pzVWNwcU1aQVR1Q1AwR255NTcz?=
 =?utf-8?B?TGk3TWpBbFF6NHdaRnhVbHkwcWxFVU1ha1FiYkhBNG8vZEtmb3RmUzhzRkRJ?=
 =?utf-8?B?MU1RQklnQXlQSHBud2FRNS9FZWUyY2VMdDRxQnFIYkpKNUg0cmdHQXVBdjN3?=
 =?utf-8?B?SW9iS2d2NmFKOThRekpWaTZpaEJWb0ZrK0w5TFJ0UkJ5aU9acjRRUTEzR0FZ?=
 =?utf-8?B?bEpOUi9CQnA4Y283WU9oWk9yeEpPWVkxOFBOZDVtQVV3TFQzYWd2bHpMcG0w?=
 =?utf-8?B?c2dsU2tMZVZadDgvRjczdWhoR1FKNkVKM1YxUzllQUtLemVoS3VUbDNmdHMx?=
 =?utf-8?B?ZnZuWkpJOHh4dUphZFZOUURVM0VIUnhaMnBhSmVRcCtZai9WaEQ5YVNQU2NG?=
 =?utf-8?B?UHlqSlYyLzBsVGIzMEtTY3hDQWU2TDFCdzB6aEowajhJWWR3SXFnY3NkcU4z?=
 =?utf-8?B?ZU5UMjg5QWVYMmlLbDRIZllVK3dpY0lleFNMMDJ1N2ZPblpkS3p4dGU4RzFU?=
 =?utf-8?B?Nmw5ZUtIYlpSTUpRaTY3eFhoR3FzVEVVQ1pOMjd1YXNsNy83OE5zQXVyWmdB?=
 =?utf-8?B?dE00dHVlNm8rU3FpdExPaS8rSGtoUXhSYm1sNDFLbGhFQlNqZ2dWZFMwQVRR?=
 =?utf-8?B?bDI0VHJOUkc5TGRVMEU2OTl4bEtUanJSMlovc3ZUcFJMMjFRRmxSaUhDSTY5?=
 =?utf-8?B?TFkwT3Z2RjlCcGdxNG5iWHFYQ1piNzQ1bU1FOEwzS1N2SzNxSmF3Y2xCcytt?=
 =?utf-8?B?bWx1V0Z1YnBMTE9PTmlWYWJ0SW9nNXNobk5vM2FoVDZVRTh0elBibUdSS3Fv?=
 =?utf-8?Q?gubjguKl?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cbf530-5240-486b-99aa-08db4b03e8ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 11:53:56.7643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aS1eWRQhy2Os/KFc30sguNt2+jURZps93pgn4SF/CvCI8b8nTcGlw/ovLRj9a9/2IllescQlRCXz4W0jLUp7QUT5hUrx/l2Qtu28cq2MDcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6748
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v5 09/20] gfs2: use __bio_add_page for
 adding single page to bio
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
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D43DC35A1F2CFE4184421B1C012C98B2@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjMgMTM6NTEsIEJvYiBQZXRlcnNvbiB3cm90ZToNCj4gT24gNS8yLzIzIDY6MTkg
QU0sIEpvaGFubmVzIFRodW1zaGlybiB3cm90ZToNCj4+IFRoZSBHRlMyIHN1cGVyYmxvY2sgcmVh
ZGluZyBjb2RlIHVzZXMgYmlvX2FkZF9wYWdlKCkgdG8gYWRkIGEgcGFnZSB0byBhDQo+PiBuZXds
eSBjcmVhdGVkIGJpby4gYmlvX2FkZF9wYWdlKCkgY2FuIGZhaWwsIGJ1dCB0aGUgcmV0dXJuIHZh
bHVlIGlzIG5ldmVyDQo+PiBjaGVja2VkLg0KPj4NCj4+IFVzZSBfX2Jpb19hZGRfcGFnZSgpIGFz
IGFkZGluZyBhIHNpbmdsZSBwYWdlIHRvIGEgbmV3bHkgY3JlYXRlZCBiaW8gaXMNCj4+IGd1YXJh
bnRlZWQgdG8gc3VjY2VlZC4NCj4+DQo+PiBUaGlzIGJyaW5ncyB1cyBhIHN0ZXAgY2xvc2VyIHRv
IG1hcmtpbmcgYmlvX2FkZF9wYWdlKCkgYXMgX19tdXN0X2NoZWNrLg0KPj4NCj4+IFJldmlld2Vk
LWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEBvcGVuc291cmNlLndkYy5jb20+DQo+
PiBSZXZpZXdlZC1ieTogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuYmFAcmVkaGF0LmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaGFubmVzIFRodW1zaGlybiA8am9oYW5uZXMudGh1bXNoaXJu
QHdkYy5jb20+DQo+PiAtLS0NCj4+ICAgZnMvZ2ZzMi9vcHNfZnN0eXBlLmMgfCAyICstDQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9mcy9nZnMyL29wc19mc3R5cGUuYyBiL2ZzL2dmczIvb3BzX2ZzdHlwZS5jDQo+
PiBpbmRleCA5YWY5ZGRiNjFjYTAuLmNkOTYyOTg1YjA1OCAxMDA2NDQNCj4+IC0tLSBhL2ZzL2dm
czIvb3BzX2ZzdHlwZS5jDQo+PiArKysgYi9mcy9nZnMyL29wc19mc3R5cGUuYw0KPj4gQEAgLTI1
NCw3ICsyNTQsNyBAQCBzdGF0aWMgaW50IGdmczJfcmVhZF9zdXBlcihzdHJ1Y3QgZ2ZzMl9zYmQg
KnNkcCwgc2VjdG9yX3Qgc2VjdG9yLCBpbnQgc2lsZW50KQ0KPj4gICANCj4+ICAgCWJpbyA9IGJp
b19hbGxvYyhzYi0+c19iZGV2LCAxLCBSRVFfT1BfUkVBRCB8IFJFUV9NRVRBLCBHRlBfTk9GUyk7
DQo+PiAgIAliaW8tPmJpX2l0ZXIuYmlfc2VjdG9yID0gc2VjdG9yICogKHNiLT5zX2Jsb2Nrc2l6
ZSA+PiA5KTsNCj4+IC0JYmlvX2FkZF9wYWdlKGJpbywgcGFnZSwgUEFHRV9TSVpFLCAwKTsNCj4+
ICsJX19iaW9fYWRkX3BhZ2UoYmlvLCBwYWdlLCBQQUdFX1NJWkUsIDApOw0KPj4gICANCj4+ICAg
CWJpby0+YmlfZW5kX2lvID0gZW5kX2Jpb19pb19wYWdlOw0KPj4gICAJYmlvLT5iaV9wcml2YXRl
ID0gcGFnZTsNCj4gSGkgSm9oYW5uZXMsDQo+IA0KPiBTby4uLkkgc2VlIDYgZGlmZmVyZW50IGNh
bGxzIHRvIGJpb19hZGRfcGFnZSgpIGluIGdmczIuDQo+IFdoeSBjaGFuZ2UgdGhpcyBwYXJ0aWN1
bGFyIGJpb19hZGRfcGFnZSgpIHRvIF9fYmlvX2FkZF9wYWdlKCkgYW5kIG5vdCANCj4gdGhlIG90
aGVyIGZpdmU/DQo+IA0KDQpIaSBCb2IsDQoNCkJlY2F1c2UgYWxsIHRoZSBvdGhlcnMgY2hlY2sg
dGhlIHJldHVybiB2YWx1ZSBvZiBiaW9fYWRkX3BhZ2UoKSwgb25seSB0aGUNCm9uZSBjb252ZXJ0
ZWQgZG9lc24ndC4gQnV0IGl0IGFsc28gZG9lc24ndCBuZWVkIHRvIGFzIHdlJ3JlIHVzaW5nIA0K
X19iaW9fYWRkX3BhZ2UoKSBvbiBhIG5ld2x5IGNyZWF0ZWQgYmlvLg0KDQo=

