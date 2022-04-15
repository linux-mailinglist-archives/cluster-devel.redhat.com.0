Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27019506952
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Apr 2022 13:02:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-l8OGjN9SNlC8dzKTK6GHZw-1; Tue, 19 Apr 2022 07:02:32 -0400
X-MC-Unique: l8OGjN9SNlC8dzKTK6GHZw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98600811E9B;
	Tue, 19 Apr 2022 11:02:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 890CA4029C4;
	Tue, 19 Apr 2022 11:02:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51D961940347;
	Tue, 19 Apr 2022 11:02:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC58919451EC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 05:41:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8B8A8C28109; Fri, 15 Apr 2022 05:41:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86CDEC44CDD
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:41:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6774380159B
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:41:53 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-UqqnNpK3MRyoSYWfut241g-2; Fri, 15 Apr 2022 01:41:49 -0400
X-MC-Unique: UqqnNpK3MRyoSYWfut241g-2
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:41:46 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:41:46 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 12/27] block: add a bdev_write_cache helper
Thread-Index: AQHYUITdob/Ugwum8EaYZwRM1yM7v6zwdfMA
Date: Fri, 15 Apr 2022 05:41:46 +0000
Message-ID: <cf0b3178-8823-4cb2-c987-db76e005ac4d@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-13-hch@lst.de>
In-Reply-To: <20220415045258.199825-13-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48830246-69de-427d-1f12-08da1ea2a179
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1815BFF38ECDB61E066BCE78A3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: QukpvFRWGEJB2QMDxopY+7PehX7V0MCO16Kh18N7kY4LOzr9YuBq8I+WJa8MvCoM5twpadFcdPxd+GRpk+xryAGpEsKBOtHwdFoHJSkkARPlYe13Te+9szYCWxaNM/i8IRBLCZxqh1GJ30cPMCf9I+ua9PzkMxrJIFIsHawZ1toOQCPTN3GsLd7BronqU3M9pLSvHmxKCVfGHnuxLHaMvcysmwRv1lTdiKN++/TAKBYwtptwP0kT3tVJB1Xh0KzR3m/pBOgR8es4hNmVTf6QzA+RFLSk+P3bZHwY6wX5nDfSFZtmtt740wSmNkMIdD++XfLcRV0X4jwL5qba1Tui2KcPBPz8S5wyx3RmD/YxTxFI9ZhP81i9HPrY5m3kkP6EobNmIYtVi+X5db7S68Z1A1RnZoawXaSALScymo19klGFGU4il16B+3AoRk9pNOSfJ+q0/jcfJsbO3ftz1JrKnkLWDs34mDZyRcmcEqxE2nsNTl63HJ7Pz0OhK5YKWCL1QvH+pVK1qvS/ZHQRCqC7cqfHmDOZqAOvoi6Jx4WT7AWoFG0cXsMwCzZrQN9nj062h2CbUX6EdW4xQgty0PGht7c3U7fKr48E8zApO+g+NpHOISkyfSXJxb0C1Tyr2hA11F9Q+TnT18ReXZLRWu1ToFYQK75baOmk5HMrOFAM3fLJRyug6J95Nkh+gWiDtSa9twCfF1M9EXacFEk9cl5dpXFezGiAlPle5HX2rjSTdoU4GPrIA4/u/0V1SVv5Uxdg3fWlCfeHiNwRGj8lO8uNfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8936002)(2906002)(91956017)(7406005)(5660300002)(4326008)(66556008)(83380400001)(86362001)(31686004)(508600001)(4744005)(38070700005)(6512007)(2616005)(186003)(53546011)(6506007)(36756003)(66946007)(66476007)(54906003)(110136005)(71200400001)(76116006)(6486002)(38100700002)(64756008)(66446008)(122000001)(8676002)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHN1U0pkOSs4MDNHMG1yMkhRTUg4b0M1Q0dRTUVSWGRyYXc3NlN6NWhVcy9q?=
 =?utf-8?B?V1NoZDdFVjdycXdrRDVMQUVGa1B0TndSUWdhNE90ZEh0ai9Pdk4veWZhcDd6?=
 =?utf-8?B?cXFmVTdTU29YV2hFcGpSQlpxMEpvV3o5M3lZelJTUXN0d2w2N08wZU1EOTFS?=
 =?utf-8?B?ZjU2d0JneUdXR0owQUk2RUlmNHZqZlo0aTgrQTVFZUdKRTZjL0NNT0RyTzVY?=
 =?utf-8?B?OU1NZ0xmNVVEQ0laalFsNDVYMExkaklTSTI2WExpTVA5UGwybk1GTlZYMjZS?=
 =?utf-8?B?dEtBU0NOWU5sblRkRGJrdVlGNVpsYlNUK0srUXBVdGdFdHVURXZCd3ZrYmVS?=
 =?utf-8?B?ZHZnQkVYSkJRdlFlaDArMUJQUjhsMDlKdFJvTnF4OU53OUVHamtkUnZ0OUNq?=
 =?utf-8?B?b01GZzJlQk9BMFkwb01INi8vbmdUUGl0Q1lvc2Q0SExxUVJkaFVuUHNSNUdC?=
 =?utf-8?B?Rng1b2JMNjBlTnFuWEgyNGQ1SGcybVV3Ykh1YlU3Q0krbDVYYnFLUHhYWXV4?=
 =?utf-8?B?YnJKMElIRE1SQUY1VHc1YVc3SDcwd21hZzJPZUdGWXhzR1c4ZEpPSXB0dDhM?=
 =?utf-8?B?b0Z4dFVBOW1tR1Q0YUR0aXBWYTlCeG1RVFpXVHorWStVK3VJRFY2L0hhdklR?=
 =?utf-8?B?bHR2bDliamh2WElncUJ4emFZVjJRejRZMDV2KzhhTW45eU4wNGRPSC9qVGZs?=
 =?utf-8?B?d2RXNWlXbmhUbHBzWENxcGhuRUZTbFcvTU1RUzRjdzFiOGNaSGhZM3A4Vkd0?=
 =?utf-8?B?NkphNkpONWFuNmg0UVlFdjZVK0w4OGd0WjlTMWJvRTRNRERsM0ExN1NTallZ?=
 =?utf-8?B?bWVhVVVOS25ldythMUN0NHlnR1FpbENUV1RpcE1Qb0hEemJzeis3UDhtN2Qz?=
 =?utf-8?B?bXZZMlV2RGc0dHorUHF4RmluSmd1SmZ2SjBKNmN2NmJKendtMGFqdE04U2x0?=
 =?utf-8?B?Tk9mWWowQ2IrNWVtTTRtZmNNRitVaHcraXZOODAreXVYTGw1MVJROXY4c3Z4?=
 =?utf-8?B?MzdzWlVBaDR6UGJrSDBuQVZYcWVPUndOSGl5dklGQlZ6V1hKL0prME05aFE4?=
 =?utf-8?B?MERSbVBMNEdLZm9zUWdBQS83Yzg3VmN2WTk0NEFzc1NYRUZpdnlOYXBCakxq?=
 =?utf-8?B?N3krcHpSQTB2R2s5Q2d1VFQwc2FsSlkwVlVpQy9BWk52b0lyamExYTdNejhn?=
 =?utf-8?B?SXIzNldFZ0JvVUtIRmNQUlhmWHVwczV0cE8yRkJHSEE1UXNnZm1oNzJBK3Nw?=
 =?utf-8?B?aW1yaGpXYkRod1lJcVo0MzFTdlNCYnZETHptOFY3ZkdDV0pIaVRsMFJiblhE?=
 =?utf-8?B?UzNhbytweThWanJvZVl5cXRwTmlKTkJxNytGNkdsRUNnN21USThYV2JuZXhJ?=
 =?utf-8?B?SVUwUjNlT0t5TDc3YXYwdStKS1EzZ1NvVjB4TGhTQzBnd1c4VmhOZy9RRkMv?=
 =?utf-8?B?aWhWZVBUUDkzcDlJcGkvOFpYNnBkTGFWOU40WjRzckxYaHdmL3RhaWJnYUZw?=
 =?utf-8?B?Mjk0UUFSTlp5eWZ6MEVockpJWTE0TmtzTjhXaDI1d2h2V2pqU1k4R2FxODRT?=
 =?utf-8?B?eUxLS1hVQWEzVzZFR1hQOXh5Q29mZ1NJQ3NYS1U4SHQxMmpXUjkraWxUQ0gw?=
 =?utf-8?B?eC9RbWVsMFFKUTVoNDhJMHhyVXowbkcrSml0RWx4S3BzQTBpWFlmYTdXOGpZ?=
 =?utf-8?B?endhcXN3anl3OFY2TG5DSERySE55eGpyaVVwbklMSlhhVW5DN3UzZEFRZUg4?=
 =?utf-8?B?VVhQdzAzMUI5UUFRRzBtZDEzdlZPOVlkd1FSMmdwRERGMzJYUmhzN3ZKU3RL?=
 =?utf-8?B?QnBxeWxodGRJQ2N6ZExJcjdyS0FoaC9PaHhyaWNjRGc0SzRPOERubzVvbyt3?=
 =?utf-8?B?emYzL1U2WENJblEwL09QYWVLYmZZTlJST3hra1htSTRINnBJbG01OGJZWVo2?=
 =?utf-8?B?WXFSZ1JPd2lBQXRiNmVycE0zVko4YjNTOThsYjl5MmtPK3FpOWsvc2hQUEE0?=
 =?utf-8?B?SW5xMFV5eEplQUlEdFdxR0NEa1NSR3gzNm9QdUpHZGdQbzdTK2JsSG41QTBZ?=
 =?utf-8?B?TEJSS1planUrZk12eEtjeXh4TkNLelNNK2ErVlUxbWJ3dlZHaCsrMUxHSHZ3?=
 =?utf-8?B?eCtFLzBnOWl1UDhRcWlEcE9neGRJdGtFVkZmd01iWVZuTVRodUgxM0JhZ0hQ?=
 =?utf-8?B?K1FwTlE4bHd5RWRrb2pxaUxXajNmK2UvZ3hUb1h4T3dGRk9QdUVyQjFoSzFD?=
 =?utf-8?B?WVUxODNxcnF4Tk9uZVBGOThiTkFzSTJveHlzbWU2TnJ1bVZ6SzVrY0R2Q2xL?=
 =?utf-8?B?Um5kY1MxL0NhaHlYTm5ZSnB5em8xSXVqSWdYMnhSVUM4OWY5RmdGSmNiMFgw?=
 =?utf-8?Q?yoCsm6uWvQ1a7EMM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48830246-69de-427d-1f12-08da1ea2a179
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:41:46.7857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1I/HGrTepjPrJfyDJXvAhA0IGeyaOEbNK+YAiCNuMMlAxhtbd6TSpK4UrJ9KB71YHciDco0PVv/pgbmfpPENTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Tue, 19 Apr 2022 11:02:26 +0000
Subject: Re: [Cluster-devel] [PATCH 12/27] block: add a bdev_write_cache
 helper
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
Cc: "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 David Sterba <dsterba@suse.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <80FC9A4858701045A17542A9B486AED5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gNC8xNC8yMiAyMTo1MiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IEFkZCBhIGhlbHBl
ciB0byBjaGVjayB0aGUgd3JpdGUgY2FjaGUgZmxhZyBiYXNlZCBvbiB0aGUgYmxvY2tfZGV2aWNl
DQo+IGluc3RlYWQgb2YgaGF2aW5nIHRvIHBva2UgaW50byB0aGUgYmxvY2sgbGF5ZXIgaW50ZXJu
YWwgcmVxdWVzdF9xdWV1ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPg0KPiBSZXZpZXdlZC1ieTogTWFydGluIEsuIFBldGVyc2VuIDxtYXJ0aW4u
cGV0ZXJzZW5Ab3JhY2xlLmNvbT4NCj4gQWNrZWQtYnk6IERhdmlkIFN0ZXJiYSA8ZHN0ZXJiYUBz
dXNlLmNvbT4gW2J0cmZzXQ0KPiAtLS0NCg0KTG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IENo
YWl0YW55YSBLdWxrYXJuaSA8a2NoQG52aWRpYS5jb20+DQoNCi1jaw0KDQo=

