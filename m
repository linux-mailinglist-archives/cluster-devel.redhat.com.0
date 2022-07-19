Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8595793A0
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jul 2022 08:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658213820;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1fTuI2wyKP8f6PsHiLatsmVudriKs8ht48siHMTeBQ4=;
	b=QbIIpFCKRuQphUtBqghJ5cO64z1xONhnUyk4kfBffELuWBhvTGjPv41ASk+pCGJIQncPBn
	PWuMoOFqXMUAbkQyn7Hp0ZSlWGUDZjpL31itubi6ub/oetU3005U2rSUAag4Z5W0qfJ7ml
	WyE/zEjMezWCNvzvuzebNmUZfdBItv0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-fxJHyRCNOt2pdy68FI94cw-1; Tue, 19 Jul 2022 02:56:55 -0400
X-MC-Unique: fxJHyRCNOt2pdy68FI94cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00869293249F;
	Tue, 19 Jul 2022 06:56:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0BC31415122;
	Tue, 19 Jul 2022 06:56:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 37B3B194707C;
	Tue, 19 Jul 2022 06:56:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 697B41945DA7 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Jul 2022 06:56:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 566EE18EA8; Tue, 19 Jul 2022 06:56:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 518D018EB7
 for <cluster-devel@redhat.com>; Tue, 19 Jul 2022 06:56:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35E083C0D84F
 for <cluster-devel@redhat.com>; Tue, 19 Jul 2022 06:56:52 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-_YRtZLqvNNCNYDgX4UZD1g-1; Tue, 19 Jul 2022 02:56:42 -0400
X-MC-Unique: _YRtZLqvNNCNYDgX4UZD1g-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by BN9PR12MB5307.namprd12.prod.outlook.com (2603:10b6:408:104::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Tue, 19 Jul
 2022 06:56:37 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::d01a:8f50:460:512]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::d01a:8f50:460:512%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:56:37 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Naohiro Aota <naohiro.aota@wdc.com>
Thread-Topic: [PATCH 3/4] zonefs: remove ->writepage
Thread-Index: AQHYmyXyDHNdyDhMa0+ObNbTNOm+m62FQxQA
Date: Tue, 19 Jul 2022 06:56:37 +0000
Message-ID: <214559ac-b171-8a83-e9f4-7d8cef3dad3e@nvidia.com>
References: <20220719041311.709250-1-hch@lst.de>
 <20220719041311.709250-4-hch@lst.de>
In-Reply-To: <20220719041311.709250-4-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 695cc60f-e5ec-43d9-a775-08da6953d320
x-ms-traffictypediagnostic: BN9PR12MB5307:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: cijGX04QNnJOnzEHj1IkREtSc7e/sqRBtW3Tm09dniOHkWd7xos7M0+Nes72JAkIyL/cl1+Dy1hqcUDGu+CQDGWAk1TWwC0G2LCasYzIGX/fr9WlO+lMp0r30SEd4wXex8/QQkBlU04nGjiojf5+e3tGUPhM9eUnf0LeMKScHM55ahXEkTokgs4OuktaRY0y1KCRDCReMvdiNAw18waAjv3IW/Y0VUldPoPgoTqBTrATWahkuHJil8F7Qo/ZW5rrPZi95XJcm8KfaJeiWuEzFUg1r+0PXNTt3YfFK7le4Y3/tnWGMKZw6NiKT/vovPMdVUdoKRRQmkSKzlNB/fxKOfkC8xnJnm2yY8PvzOwA29bKsapCcSmZZ2eVAqszd9DiSjadJODgAZuFh/1lynxpVD5ZQddKq5Xo9+J4sdsnrjzS8MLI5caDOM5tJ0nxrwZwJJ8SSmtVbNvxIhO3BLJqbjmo2yy2XuM/jFfz/++fd6Y12jiRnaWh94UssGXUNj3kamWQZBr92WS5xBhcreWCACgZIExSbaSxSn53e9EfOX94OZjP4Il02416MWDUvMEWiSftFiQDqLyBCKh1JVgroXuQr2PwPy8uAbEwvbPBMUfdoAqDhzydPGqLf0XFIHuqOTS40yNbM+grnsEEQG4yXr2/50traL3g04UIeQbDJXRDOxIHRp6/paXE1S2boJY6YWuPJ0RqRfx9PWFQl5kkXONpy7+6J1yKLJmPG34ZbaKGdcvIOq/3jS+9V5FhpJZMDXwVVZWHO5x+JLmZvDrTEvVZL/fRDgQ/tL1cpF1lvwZGNeVhWnkKoPNpRZkh5KjUXnc8XKoNUy3VxuPPf/6TVb/C1CFjPsOfSuMtgV/YPsq/SbhiwN2AnsCAR8w7D8xI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(54906003)(64756008)(53546011)(91956017)(41300700001)(6506007)(6486002)(71200400001)(2906002)(6512007)(4744005)(110136005)(8676002)(66476007)(66556008)(7416002)(66946007)(316002)(66446008)(478600001)(5660300002)(4326008)(8936002)(38100700002)(31686004)(122000001)(2616005)(36756003)(38070700005)(86362001)(76116006)(186003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG9TK3FwUTZSMXNCV1lkUjZCU2JnNDhwZGNPdk83VmJYYmRtenBvZ0VwSFIx?=
 =?utf-8?B?RjFybUQrQUVvcTNsckpjRHNQYkZIRFNXb1hsM3dHZXg1OFdpNjJuN281Yzkw?=
 =?utf-8?B?NjR5VWFMOEFvMmxRSnBsMDF0U2pWN3FELzBOamlHSjdGejlyMHNpbzY1Q2Zr?=
 =?utf-8?B?b2YwWkVtU2R5bFJNeU43czczVmtqek9xUjlRT2tKWFJwVjJDMDllT2V5eWlC?=
 =?utf-8?B?d3h1UDhlQzl3N280WmNERDNCZXVPczRlVHZoK3pPeWR4clozR0Jia05NNHF3?=
 =?utf-8?B?UStTQTlOUmdYdUVOcmVzdGp6NDhQc2ppWk8zRG9tQzN0VnlXYUlXakVKZW93?=
 =?utf-8?B?K251Nlg0ZFRVVnJXOXpHUE5FMlhidDE5UFJMaTNBUk5mRTJyeTI3clFBb2dN?=
 =?utf-8?B?eFlNakJzdklsWmY0NzN6eCs2bHpuc1g3QTZKcWhpTEhpUlY5MmZRSHJLUWZ3?=
 =?utf-8?B?MlNnaXRSZDluaHhMU0krdncxL3NhNXRtQ3l4cnRLTitLNGFEMlM5dE9DN1By?=
 =?utf-8?B?OUQ2akZVSStYNThOT2hDTmorTytzTW5FZUpJQmJiS0liTC8zWDRVSTVhSDhq?=
 =?utf-8?B?cGI1TlRZUWlyQ0hXbThVSXJxZTJRbXlYeE5wOWN6ZmtjNlBlZTErRWxRbmJl?=
 =?utf-8?B?a2U5V0EwMElRTStoZzNrcWliNnpIUWNOSmdENVgxQVlrdnkzM05PUHVJdXQ1?=
 =?utf-8?B?U3RLWnBtbk9FcGlzd1hjNmYwcStMd2VjWmNXbzQvOHgvY0h4a1pRSkJZaE9F?=
 =?utf-8?B?bjJQVUtvUE94WkpBMVJaaGc0dWFTODV0UHBWL1NZUVl1b0N5TkR2QnE4cnlm?=
 =?utf-8?B?VXRZdEp5ME9jQWt2dElkQzNaR1Jwb1Zlb2tsN2Rlb2I4NmNnOG1ETVpQenY4?=
 =?utf-8?B?ZEtVV2F6L284c1BNT1h3MHQrN2c5QkEzVnZYS2V2TnlZVUViWko0SWV5MHIv?=
 =?utf-8?B?ZEhLRGUrUHk3dUpEN2xOS0pGS3NKektOSW5nZzcxM1hUbCtxTS9uSkxCRFdi?=
 =?utf-8?B?TGNBTlhWUklUdlZHUlJhYktNcnc3WTlVVEtxZGVzSHdFR2ZuZ3hYU2UzNUlz?=
 =?utf-8?B?N0pNaXdUbkg5Rldjb1Q0YUkzSEdoaElyVndkbzc0eVIwL0RNVFRsUDRZbWh3?=
 =?utf-8?B?eDlJcFp5S3YrL0NVMlhIS0pDK1dhdXQrUVQ0MWJ2UkZycXdDUFh6YlBqOSto?=
 =?utf-8?B?SWlibkZuNTlSWEt5TDdYTXQ3M29hRUlkalEwR3IwMzZycGcrRzlLUUZNbTFj?=
 =?utf-8?B?VWFoL05Lbm83MU1sT3EzUXNEcWFNS0JzYklPU0kvY3BBWGZFakllYm5tcXhw?=
 =?utf-8?B?WVhlbEUwQXZWdjljbnNZQmp2dWlHWlR3RkRjVVZVcEFZdzJpblMzdXJ6Zmsy?=
 =?utf-8?B?MGhoaG1pRWtiY1U1U1gybDdjS1ZLay8vSU4zYXpGZFoxMG9SdjdUSndHRnJB?=
 =?utf-8?B?cHh6bnQybDFkdjJBdjRhbHFUSURabm1zcUVZUVYrUit0WjdOa1M5aEZhT3VB?=
 =?utf-8?B?NUpjSjkzNXA3WVAvbmQvVnpwdEF2UCtmUVpOc1AwVEU1ZmZyd01kMDMwYkJk?=
 =?utf-8?B?K1RERkphVTl0OElIYXpGUGVyR1Y5TXo0UE9VbWRSNkVUSHBvYURUUGlzelQ0?=
 =?utf-8?B?R3V5WDNpdzR6YTJiWDl6b3NMWXZOSGg4Yi9hQklZbUZkZzNtcVNqWlVwbksx?=
 =?utf-8?B?d1F1TGxJVzhHZTNBdDlPY0hGWFVCQWVYWEpEZHVqMExTaW1tcGhqc3RaVERO?=
 =?utf-8?B?T2Z2R2pVaWJtVVFwYXd6SUhtYUlmWTlOMW4wNjBpdmYxaWdLWkJuNWwvM1Fo?=
 =?utf-8?B?NkpUemRFZXZSK2VzbGlqRm9VNGZKRThZQWd1YW4zbkZUUnRlcFIvOEZxUmFN?=
 =?utf-8?B?QXV6RkFrWWFFbmV0TmROcXVLTC9UUzY5a1p0T2JEbVZPL204SUhqWm1zUG9Z?=
 =?utf-8?B?cEhFeTIzZ05rZ2dsK3hVVjdhbXRmWjBQWWYwNjZhTjVQeHo1NTA0a1gyakkw?=
 =?utf-8?B?cU1ucDVyRTNYWUphdytBdE0zNGluYnVFUzlkRVRyN3M4WHhaUnk0dHBGZ203?=
 =?utf-8?B?V0huNFh2NGV3N2RyM3Vrd3Y4SnBVdU43Y2VJOWw4TVZ3TjA4a3dMUVFpbHZz?=
 =?utf-8?B?d1FpTyt1Z3pVZ0ZSZlhrSk53SHVZZFpiZWkzejdLbU9odEZOZTBOa3U2RVp6?=
 =?utf-8?Q?VOBPyoWlR/st3Y9g3ItbCxd2oY42Tz19Zz+thZ71IBXQ?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695cc60f-e5ec-43d9-a775-08da6953d320
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 06:56:37.1056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: II9VUMI39p/1Hui9BPQJvJdggKK9sediG9eKZ9HNswJeXEd/t/5cKZrrk6mIhw0khKt91MZIE6alw5+KAYEg5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5307
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 3/4] zonefs: remove ->writepage
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
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <36683F4C632B7542B968DC044F270D4F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gNy8xOC8yMiAyMToxMywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IC0+d3JpdGVwYWdl
IGlzIG9ubHkgdXNlZCBmb3Igc2luZ2xlIHBhZ2Ugd3JpdGViYWNrIGZyb20gbWVtb3J5IHJlY2xh
aW0sDQo+IGFuZCBub3QgY2FsbGVkIGF0IGFsbCBmb3IgY2dyb3VwIHdyaXRlYmFjay4gIEZvbGxv
dyB0aGUgbGVhZCBvZiBYRlMNCj4gYW5kIHJlbW92ZSAtPndyaXRlcGFnZSBhbmQgcmVseSBlbnRp
cmVseSBvbiAtPndyaXRlcGFnZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4NCj4gUmV2aWV3ZWQtYnk6IEpvaGFubmVzIFRodW1zaGlybiA8am9o
YW5uZXMudGh1bXNoaXJuQHdkYy5jb20+DQo+IEFja2VkLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFt
aWVuLmxlbW9hbEBvcGVuc291cmNlLndkYy5jb20+DQo+IC0tLQ0KDQpMb29rcyBnb29kLg0KDQpS
ZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5pIDxrY2hAbnZpZGlhLmNvbT4NCg0KLWNrDQoN
Cg0K

