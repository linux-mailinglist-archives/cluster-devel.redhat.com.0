Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1650694E
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Apr 2022 13:02:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-Rk6yiO5oOVugUUD5j7575w-1; Tue, 19 Apr 2022 07:02:30 -0400
X-MC-Unique: Rk6yiO5oOVugUUD5j7575w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96525811E78;
	Tue, 19 Apr 2022 11:02:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85AA54104961;
	Tue, 19 Apr 2022 11:02:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F96D1940367;
	Tue, 19 Apr 2022 11:02:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 19705194034B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 05:43:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED442404D2FC; Fri, 15 Apr 2022 05:43:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E82A540E8100
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:43:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C495D811E81
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:43:15 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-htz8mcbBN0ihl3CnNZe7qQ-1; Fri, 15 Apr 2022 01:43:11 -0400
X-MC-Unique: htz8mcbBN0ihl3CnNZe7qQ-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:43:09 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:43:08 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 15/27] block: add a bdev_max_zone_append_sectors helper
Thread-Index: AQHYUIThL7IFGipIVkSGIZfvx5g6z6zwdlQA
Date: Fri, 15 Apr 2022 05:43:08 +0000
Message-ID: <29b7e5b3-172b-c006-94c3-ad23e058e438@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-16-hch@lst.de>
In-Reply-To: <20220415045258.199825-16-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 329d9650-aa25-4c36-bb1c-08da1ea2d25f
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1815F3B93CAD76B7BC5687A4A3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: t6t+OjGUQ1OzaWpmgj6CRMw/oONXIm3UqcwYFA2T2rxL0gmi2gY70ddUD0K6Yoaibu9boOOIqd1sMsP4CbzKPtbQYwM1IuxsKpoKGXVP0M3JkttCknJs8GZDnhcxJgArTJBsyvlZnBqIbkRjFPCLFihtUqT6fV0hVQZNY2BxY2P5UAf5WBOR7I0LhKaVr/CWet93K7A7AXwUD2dYflyjdTdDHm9tcJPkTAXcir/2fpOqvw+eKW2jdnYm7P5aWyirx/3QPcRunm2hFEAIbKyvQGga+6KLFRgexCQ5D/Hih+3RRNOxKCsCZVGzDlSp8zaoD9hXaKgpW+yvFslrcRXDHv2iiP+jaeEB3zaZU7axixGIkNC+6QxEA1W099/MWYtx9krTcvxx8yUJ65Bwf6Vy1QkdXPjwMVMCaTTb5t8AHDKLW+c/4tXcEq+MDjI3vHByOqfK7z0Rd1Rly7qnjDQqcLdHpj9KWhC0LbbG4XgzwGQcQ6TQGEvliw6Y/kToovcBRrI4vpileZwct9UvYcC6islmD0DWSoaNjyHDsTwPQQt7e9A4Syw6quQC/ODj+xrkfNS4L70tSmleGz0qVUkKLjRyWJA5ficWTWVeyDq0jlaeehPKszMYOPXZ/mTOZgJlW883XsU9Ydwb48LBCXutALWEoeiS8UsOIPoHMn9hq1f8HO028tdO+IFYz4749b6dvSCp2+cNqJZWrdJnK6UGvaYqUvnP3sF6fcv0lB1FLdjUHsBTqH5cddPu7xcS/XyS0zo+QyH22wYdQqyV0xXOzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8936002)(2906002)(91956017)(7406005)(5660300002)(4326008)(66556008)(83380400001)(86362001)(31686004)(508600001)(4744005)(38070700005)(6512007)(2616005)(186003)(53546011)(6506007)(36756003)(66946007)(66476007)(54906003)(110136005)(71200400001)(76116006)(6486002)(38100700002)(64756008)(66446008)(122000001)(8676002)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGF4eEVUSDhUZVgvZEFGYUtJdXZaMHp1VnQxYVNBZ0ZpblNkYm1pUUl2SEtM?=
 =?utf-8?B?Nk9KeDNZbHB3aUlYMlhoYVBIdzZNWE4zcFNBaVkxUUFYV0thZzBhRTRQYUNu?=
 =?utf-8?B?dlFwdXRpTFdwbmdZS3MxZDFrV0hFUUxJeGVYNkVnWkVEVDdmRk5QdmpTTjZa?=
 =?utf-8?B?d1Q4NysydjJWWmU2TkZJM2NPempodW54VjFzK2pTVWtMV3Aybi9rNlJMMm9q?=
 =?utf-8?B?ZDlhZ280cSsxQ3ZtT1owK1kxYmo4QmxOVit0cEhwQWsrYmw0RzdFM0JXSGtJ?=
 =?utf-8?B?QWFkVnVFMDJQdGVIMmRIMDVjK0h0bDc2UFIwS0k5bEcreEdjOTJJTXQyc2R1?=
 =?utf-8?B?YWRLZXFza2xabjFLU3dOSHdvSFJKOGZpc3B2ZllvZ0p3Ky85dUx3cVpHYmVu?=
 =?utf-8?B?YktUbkVIZUovMlFxY3FpRFQzUmxQc1BhY3loSGNWcmZ1c0tOSHdIcDVsN0Z5?=
 =?utf-8?B?VmR6dXN4ZnJLUm9adGVkL0pCSGtZM3ZmcURMWU1NTUVGUmRQb2JiUm1UWmFY?=
 =?utf-8?B?TUw4bzBaQ05jbXpqL0hxMTkzTytiN0hMT0NJclZwOWxpQWxzU3ZvYkpBeGVV?=
 =?utf-8?B?cWhiRHBCOHR6b2FtWkFwcWVkcjZRTlVTZ3hNWE9ZeDYxNFEzWHZadmVaYWRQ?=
 =?utf-8?B?TG5VZUtJVnVqZVhGVTJ3RWkxWG5MQWZHemNNMXhwc2hjbkRjbXRpUUMyVExa?=
 =?utf-8?B?c1FNOGhWcm41Rk94ZUhmWlE3M0xCOUZvTFpMcWptdlM3NzhLYzhxaDRMdVAw?=
 =?utf-8?B?UEJxRlB3RUk4a0g1SktnTUJPZjhCcitPbW1UV3BrU2NTTHVwN1Fpd2hSTDBu?=
 =?utf-8?B?Tk4rZ1NMOHg3THZyUXE3T215cGs0NkVSa2FxV0p6ZWhYL29Cc0hydHdoeUts?=
 =?utf-8?B?cjY3RHFYNTlQUFRGajA2YU5VMUJud1A5ZEhleXBFaVB3aitncWVOVlFIWUVF?=
 =?utf-8?B?SHZhTlAzemxBZ2FuQWhQcnI0NktpdE9XY0ZKRURBTDFWeWZmSXNDZTZkRENB?=
 =?utf-8?B?cS9pS1ovV0VmeFRwd1hqVXFCTjMxT3dockhqV1NWeXlxVU04cHNuUnhNYlZD?=
 =?utf-8?B?R2owcFpVbUhMZlI2L3c4a3dublkyTWdzZDQydFJKa04rOGVhZDBFb1JhdE94?=
 =?utf-8?B?dGR4bTYxUGljT1R4L0ZRcTBlbVRyVXZLTGF3emhhZ0VqcmdKTGVEbVlYWXdK?=
 =?utf-8?B?OVZWK3FWRlFqSEp5TDBWaldiQXBGaW9pVXVkRTl4YmpUUkVzS2tMMEZJYkMy?=
 =?utf-8?B?eEpxcVJmQUFPN0dHVTdPSXh6OG1rOE1UUXNRNmU0KzV0M0FkUFh0Z0FHV2Ro?=
 =?utf-8?B?dVAyeHF3RUh3Tms2OWJoTlpyM0pPR2tZcnllZ2hpY2NTM293a1dYUjRuNmNG?=
 =?utf-8?B?VldPK0ViRlBVTG9lTWc1bkYxeUZFZGx1cFoxZTd3YmVxeXJ3OHI3bElRMTRG?=
 =?utf-8?B?ZUduVXVtRzY4VHY2cHlYaTVVRGx5MVBqdkIxTDcwSXA0RC9GeDh4ZDVUeHVr?=
 =?utf-8?B?NUF1dnNwdGp5WXJJNCtrbTdPK2M5TXFEWXJ3UDJmTFZVaEcxYlduNWFmZ2d2?=
 =?utf-8?B?SXNSOXlXOGVjcUpiZmxDRGpaM2xEKzkrNUFPTnJHRllDMkIvN0tZNTR5bG5C?=
 =?utf-8?B?dEpDV0VwRU9wTDJBSnlwTEh1cVN3dzBKS0piN0hwaEVzSWU0a2owcGVBWWZX?=
 =?utf-8?B?QTBCS1dtdnU2OElqam93OFVRRHdaZHBkSXp4eWdQZlNkbXJkOTQzbk1sRmNr?=
 =?utf-8?B?Z3AzTDNTY2NLN3VRVDlqYy9FWlJWb25GZmd0SjF0U3ZoZGtqL01TSTF4MTNE?=
 =?utf-8?B?enIvNkpLUCt2K2hrZ3h3anM1SFBVVnFkTHphaXJMYWlxaE1ycHBxYlo5bEpt?=
 =?utf-8?B?R3puZ043TzlkSDlVSTZmQ1ZQblI1SjJNSlI1N3FXSDBWeUE0bzZBUElWWjg4?=
 =?utf-8?B?Q2Y1YlBic0RpdXhpcXd2TXBPY0llZzhxbWU1RzRzMk92OGQ3bW5yamp4NWhi?=
 =?utf-8?B?SEUyMFBqcDdaa29NTDZFV3ZGVGJjakF5aHFDTGZyU1RQSzZhYlU2d2pDSmpT?=
 =?utf-8?B?Q3NOVnltRDhndzJVMndLWjB4Z3VVSlVqSE84VEFEaGZNdTF0QVBSQXN0NFYz?=
 =?utf-8?B?amhicXhOdE5ybmxnSE5XbTZya3ZFSVcrMUhYSHB6cnJOeDBLdEZja3ZSeUdv?=
 =?utf-8?B?VTVPQ0g0Y1BNVFNJakNIWkl3b1VtL3NSSnVEV0pUR2o0a1V1b285VnVNcVVx?=
 =?utf-8?B?dkZKczUrK0JJOWlEMzRGc1JBVVA2dThsU0daUmtvS0R5VW10VkkyZkNGNjlm?=
 =?utf-8?B?THJORE5zYkl4enJBNTRrMjlYYWJ3U2RoV3lyWUFrS2VvUlhpOFIrZ3JQZ2tC?=
 =?utf-8?Q?9dpsVxsWYuGaBiJZKWvNwYXf0NoBW3MqzIHF/?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329d9650-aa25-4c36-bb1c-08da1ea2d25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:43:08.8277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pI4Ug6p8HtKxYGGTRxGsdbryu83yFMwivmnD9Bi4GdnIIxiVGCQx5DSYPhYLUiIiFyypc2wCWvLHLPzmgBetuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Tue, 19 Apr 2022 11:02:27 +0000
Subject: Re: [Cluster-devel] [PATCH 15/27] block: add a
 bdev_max_zone_append_sectors helper
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
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CDFF86F90989C4A95462B2BEA592E1A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gNC8xNC8yMiAyMTo1MiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IEFkZCBhIGhlbHBl
ciB0byBjaGVjayB0aGUgbWF4IHN1cHBvcnRlZCBzZWN0b3JzIGZvciB6b25lIGFwcGVuZCBiYXNl
ZCBvbg0KPiB0aGUgYmxvY2tfZGV2aWNlIGluc3RlYWQgb2YgaGF2aW5nIHRvIHBva2UgaW50byB0
aGUgYmxvY2sgbGF5ZXIgaW50ZXJuYWwNCj4gcmVxdWVzdF9xdWV1ZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPg0KPiBBY2tlZC1ieTogRGFtaWVu
IExlIE1vYWwgPGRhbWllbi5sZW1vYWxAb3BlbnNvdXJjZS53ZGMuY29tPg0KPiBSZXZpZXdlZC1i
eTogTWFydGluIEsuIFBldGVyc2VuIDxtYXJ0aW4ucGV0ZXJzZW5Ab3JhY2xlLmNvbT4NCj4gUmV2
aWV3ZWQtYnk6IEpvaGFubmVzIFRodW1zaGlybiA8am9oYW5uZXMudGh1bXNoaXJuQHdkYy5jb20+
DQo+IC0tLQ0KDQpMb29rcyBnb29kLg0KDQpSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5p
IDxrY2hAbnZpZGlhLmNvbT4NCg0KLWNrDQoNCg0K

