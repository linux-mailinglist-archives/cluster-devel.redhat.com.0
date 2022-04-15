Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE00506957
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Apr 2022 13:02:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-rbxVCRlvMK6npw_psub4GQ-1; Tue, 19 Apr 2022 07:02:32 -0400
X-MC-Unique: rbxVCRlvMK6npw_psub4GQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97A0B19705B2;
	Tue, 19 Apr 2022 11:02:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 890F4492C14;
	Tue, 19 Apr 2022 11:02:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 41CB11949762;
	Tue, 19 Apr 2022 11:02:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0615319451EC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 05:36:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D60BAC44CD9; Fri, 15 Apr 2022 05:36:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0EBCC28109
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:36:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43873802809
 for <cluster-devel@redhat.com>; Fri, 15 Apr 2022 05:36:17 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-UFpgIQbvOESe_3ZQMNVoXA-1; Fri, 15 Apr 2022 01:36:15 -0400
X-MC-Unique: UFpgIQbvOESe_3ZQMNVoXA-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:36:12 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:36:12 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 01/27] target: remove an incorrect unmap zeroes data
 deduction
Thread-Index: AQHYUITCWfO5Vbexo02RhnP7B3Qt7KzwdGUA
Date: Fri, 15 Apr 2022 05:36:12 +0000
Message-ID: <673afa25-cf3f-616c-6bcd-16de35b307b2@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-2-hch@lst.de>
In-Reply-To: <20220415045258.199825-2-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c41c8b1-f98c-4a0c-d430-08da1ea1da48
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1815025F04E67817416EF431A3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: FFcKzlLusYcihPuQmtr3t8KbNF6ZULdsUk3VDGoPU5Bzoim7x014V7OQAcQDACuimx2k4yREtr5B6uvJ2a8+1Uhd2xpAsmFn/qLBWU+QmZXIapLZyFQRTQOeeiEfFoms7bv0O8TA2h1Sa8MwWLeGYXuS1/E3RvLIoTNRVuO9UzRcZWyZWSQFxTMOL12Qns3v9NVdUfPovTVZiFDfTwJgyfqWPItknrB6PQlFJeMVHgxGslTmq350gxs5qs+xG+OVxS/DQedOy3ltIFpHUiPwk72NY7m7PE0ZlBBrkJb3u2+zh2ymtgCOaG+bowFhrlWJOiQ1OwDOMlmF5ns3rKS8XvTN/YJYaWqL8TEOp2RpLN5OL+mrCAx8hNrBZ0paAaO92k0nRjvEM6m4d0Euaf1ZzgMt2pH+HMEHp2QtyXP9V5w9mNVIo/cpWEyM9aGG7CEQ6NufsCVtLrmceiZK+BBSOVVx6Kuriw3HemolNu69pRP3r+/ON7gJqNR9OqkQgD2pVbeubVClHb9mztUeZpd652FKmn3k9GUpqg5Fe9lm5bEDvx0Aoq1f8yqjfX3ghiHmqp6YVLYwCamze5SKJVglv1TzAO9lFIT8BZ8sXV5+npwVYd84V645TVbI7wxZVK4gtOuLWMNwXfLbt49QpuuJyb/uGDLz+jrZrlKAeP6Fj4tVN/dOdqRK/YGL4BDamm/r2o2eVfWnzC0AYh4B4aDJjdm8z4b0LqHcyk5IYJaMM56QV7Z2E1G1LDpAAKpMl5MZM530+NFxKIwbYkKX2GXdiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(76116006)(6486002)(54906003)(110136005)(66476007)(36756003)(66946007)(38100700002)(31696002)(316002)(64756008)(66446008)(122000001)(8676002)(83380400001)(4326008)(66556008)(86362001)(7416002)(91956017)(7406005)(5660300002)(8936002)(2906002)(53546011)(6506007)(186003)(31686004)(2616005)(38070700005)(508600001)(4744005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW9NMHpPcWJ5Mm9hcGpGT1lSZXc4SlQ0Y1FhTUpRNUYrZjArajhyN1lGNUk3?=
 =?utf-8?B?SHM3OU5IZVNYNktNNHdzUzBGNnJjb3RVRnhzR3czakQrdWxtYlAwNTNOcUk2?=
 =?utf-8?B?c3Q1YVpZK1FoUjZ5andsZnpRbmFZUUNhb2gwek1MQkFWNld1ZFloQWRldzRw?=
 =?utf-8?B?T082RjhBTVluRDNORENwQW5lTHFOUmlNNHFhbm1QWXJySi8ydER1dFZYS0FT?=
 =?utf-8?B?YzJla20zODFTQzh0cytmNGU2eEpLTVp1YXlTYzZKUzFjSjFuYjErYWRMTHJD?=
 =?utf-8?B?cUpRa2tWaG9zYkN2QUI0dWppcnlXS29mWDd2ZUVPNjlLdmUwM0V6cUxlK2x1?=
 =?utf-8?B?ajZwRlJEWi9QQ0YvQXR6MUtRTXVoRzFMK3grcmdLSTk4WWZFVXZDbEdYZkZH?=
 =?utf-8?B?YmZuTHpuNEdCeXczMjlza1ZHS1NveU1tSVR5MkhwUUREbTRRMXdVT0FWWlFv?=
 =?utf-8?B?V29DSDdlUXZRdGZObHNMOVk1d2puWkhOWFFpY0FBUHVZTzJkNU5Wd01xL05o?=
 =?utf-8?B?SlN3a2pURnV4ZnZWRVRmVUcvU2hrK3h5ZnE2aFN2V3lRMnBJODlLaTFzWGh1?=
 =?utf-8?B?cUNCWGppN2hUWVRKTy9ManRxOGdtSFRxclFPSFh6aVh6ZnVKRURJQm9VVm9l?=
 =?utf-8?B?VnJtRWYrYkFUOTBoTmZEWXFGSHIzcVdyWk84NEZvVUNxTGdYbEllbEF5Nlpj?=
 =?utf-8?B?S2pONlQ2RnFIcE4xZDdpQkFtZmt0dUdEaWhKUWVvKzY5YmRYOXlrb3B5ZGhJ?=
 =?utf-8?B?VVpJSkZ2bWd3OXdubDdYZ0I3K25sVU4yOWQwMXFYS0ZzMjJONWtCaFpGYmRV?=
 =?utf-8?B?MThGc0Z1NVI3U2FvakFEcHplWVRqK3R4cXFLbyttR3ZtQW5zQk5wZndsc3FY?=
 =?utf-8?B?WE9PdUpwL0w4WjdMSURBNExMV1U5NUY4SjRUS0dwTXQ5TlBOT3RIUUVrTm1l?=
 =?utf-8?B?eC94djVmVHRIc1hBRTcvcUoreGlQMFpHNUVTbkR4UVRCTDQ4OFZ0Nm80L2Yy?=
 =?utf-8?B?WnRYREczdnpzRkJiK1hnQmg0cTFXUzk0L2o4dFppY0gyMElscDVtL2dNZTdu?=
 =?utf-8?B?QkUwSFNuU1VBMXhLNXNTTW82WVF0dmtZcm1BYm1iSjc4TFl2OU1sRkxTN3VM?=
 =?utf-8?B?alVrL1ZZOUF0Mm05alNiNjhKYVNZZW15T1hwTkVKWXZVcTJSUDllcFFaY29T?=
 =?utf-8?B?YkppVUFRU09lWTZWeTV4RUVDelJRbnpLbzBzbWl3NzVsenJNNGVSeDZVbE1m?=
 =?utf-8?B?N2o2MGdpNTlQOWNEazFWajFNQTVvUjlZaS9BbUZoMFJWL2JCR0pIbzJFandM?=
 =?utf-8?B?eG1WdkdKamY1ZlJwZlp2aFplbm9DeGpsY3dudWE3OUhXSm1rQ2pUcy9YcmV0?=
 =?utf-8?B?dzVUVlZNYkp3d2FtanhWcmZocHlLRW5BZ1BTMU1yTDVaWVFPb0pCL3Z6T2JD?=
 =?utf-8?B?eEx5ZE5nNVNpQ016TGI2TkYvV3VPNlBNMFFndmJ1OXI5REQ3ZE9DNVN0T1R5?=
 =?utf-8?B?cDl5WjdJNWpyaXV4cEFyUVpNTkZ5RU9hZC8rNnNVQWsyeWkvaU8vSkhOSTlQ?=
 =?utf-8?B?ajlnZDd5NHhlbUFWbm9WZ01lUGxDTDY3dTFLc3hob2locXpxWVBLYVpNNEhB?=
 =?utf-8?B?MExOaXBCU2xOeGxRMkdnU2s1ZU5vVlFQREpaRHJKVHh6M3dCdGozTUR5WTFB?=
 =?utf-8?B?UUxoSTlNM2tneVkwODlVSWNQVGpOMmpURStJVmVxYmxTUTloSjVaWUZydTlW?=
 =?utf-8?B?L0lsYS9TeVJHVExDdXpMa2tHOG5HZzJmNmxVYXMvZzlVakd1eTYveVdraC9N?=
 =?utf-8?B?UU9rSTl4VzI0OEJMUDRQS3VrY0VUSGNlbk1wcnA2VVNoc3RxNmkwSCt6WWk0?=
 =?utf-8?B?dEwrbUhnTzUvaG12YVp6bzRrMmJQWStmQ3oyTzNUYmlqbjU3dkdPZnlDWEh4?=
 =?utf-8?B?Z05maEErSG1uSzBLNTM1dEZCTmVUVVJNVUVxalVhRFFtTEdGUUdyS3ZvcXI4?=
 =?utf-8?B?OEs1VXNtWTRTd01uTzVVYXpLaU1JcU5ETTB4ZXpnZitEMDkzVTRqOXdPVjlm?=
 =?utf-8?B?YVZlTS9pWHVJV0ZzR1ZONzVrMFVlWHhOa1hvc21YSGFCZDRxSVcxeWVXSmdB?=
 =?utf-8?B?YkRyNHpEMEREdUhXWkh2Vk5pUmFoaXMrSXpqVGlYVzljMWcvZHRObnpDRjJo?=
 =?utf-8?B?cDd3YVdKMWZlNWtGYWVleFBGOW8xME9QTTJ2VzBzWGNCT013enJHOUh2dE83?=
 =?utf-8?B?WDBWWjlaUjRXU2h6TExEL1djWDdFVW1kSm14UmhLQ0VwNW1mWWNlNmd2Y0h0?=
 =?utf-8?B?d1lPQ1k5Z09rYkZ2QjNBMC9TSk0zaUExcTE2TExpdGM3Wm4vSE1oUXM5Z1dn?=
 =?utf-8?Q?3cEYgCOzwmgBAk9I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c41c8b1-f98c-4a0c-d430-08da1ea1da48
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:36:12.6026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2FweSrSmTAGEteeg0PCeGV7la14HH5hz8rms25Vojja8JCsoAbp7ZNFYuPk0ZPEHv+6sDcSZkAYz2to/Dl6Vg==
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
Subject: Re: [Cluster-devel] [PATCH 01/27] target: remove an incorrect unmap
 zeroes data deduction
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E802A778DDA3DB47923030D024586109@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gNC8xNC8yMiAyMTo1MiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IEZvciBibG9jayBk
ZXZpY2VzLCB0aGUgU0NTSSB0YXJnZXQgZHJpdmVycyBpbXBsZW1lbnRzIFVOTUFQIGFzIGNhbGxz
IHRvDQo+IGJsa2Rldl9pc3N1ZV9kaXNjYXJkLCB3aGljaCBkb2VzIG5vdCBndWFyYW50ZWUgemVy
b2luZyBqdXN0IGJlY2F1c2UNCj4gV3JpdGUgWmVyb2VzIGlzIHN1cHBvcnRlZC4NCj4gDQo+IE5v
dGUgdGhhdCB0aGlzIGRvZXMgbm90IGFmZmVjdCB0aGUgZmlsZSBiYWNrZWQgcGF0aCB3aGljaCB1
c2VzDQo+IGZhbGxvY2F0ZSB0byBwdW5jaCBob2xlcy4NCj4gDQo+IEZpeGVzOiAyMjM3NDk4ZjBi
NWMgKCJ0YXJnZXQvaWJsb2NrOiBDb252ZXJ0IFdSSVRFX1NBTUUgdG8gYmxrZGV2X2lzc3VlX3pl
cm9vdXQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4N
Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBLLiBQZXRlcnNlbiA8bWFydGluLnBldGVyc2VuQG9yYWNs
ZS5jb20+DQoNCk5vdCBhIGdvb2QgYXNzdW1wdGlvbiB0byBoYXZlIGZvciBzdXJlLg0KDQpMb29r
cyBnb29kLg0KDQpSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5pIDxrY2hAbnZpZGlhLmNv
bT4NCg0KLWNrDQoNCg0K

