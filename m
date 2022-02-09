Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784E4AEF7F
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Feb 2022 11:46:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-pnQNVS4uPo63NBFwGYKuaQ-1; Wed, 09 Feb 2022 05:46:32 -0500
X-MC-Unique: pnQNVS4uPo63NBFwGYKuaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 382A41091DA1;
	Wed,  9 Feb 2022 10:46:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42A807B6E7;
	Wed,  9 Feb 2022 10:46:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66F3B1809CB8;
	Wed,  9 Feb 2022 10:46:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 219AkLIZ030836 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 05:46:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E56B62026D46; Wed,  9 Feb 2022 10:46:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB15202699A
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 10:46:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D3861C05B18
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 10:46:15 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-647-L6xhyOu2Pcqmk74ZLJLzXg-1; Wed, 09 Feb 2022 05:46:11 -0500
X-MC-Unique: L6xhyOu2Pcqmk74ZLJLzXg-1
X-IronPort-AV: E=Sophos;i="5.88,355,1635177600"; d="scan'208";a="304404218"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2022 18:45:06 +0800
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
	by BYAPR04MB4342.namprd04.prod.outlook.com (2603:10b6:a02:f3::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11;
	Wed, 9 Feb 2022 10:45:04 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
	([fe80::c8f4:8499:a5fc:1835]) by
	DM6PR04MB7081.namprd04.prod.outlook.com
	([fe80::c8f4:8499:a5fc:1835%3]) with mapi id 15.20.4951.019;
	Wed, 9 Feb 2022 10:45:04 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Lee Jones <lee.jones@linaro.org>
Thread-Topic: [PATCH 1/1] Revert "iomap: fall back to buffered writes for
	invalidation failures"
Thread-Index: AQHYHZKAZQ1UEr0uOkW3jy3YFI7yZ6yLCQqA
Date: Wed, 9 Feb 2022 10:45:04 +0000
Message-ID: <425511ee-8845-45b2-8750-db42e82938ae@wdc.com>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
In-Reply-To: <20220209085243.3136536-1-lee.jones@linaro.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a368c7c3-2e6a-49e7-4bc6-08d9ebb93b41
x-ms-traffictypediagnostic: BYAPR04MB4342:EE_
x-microsoft-antispam-prvs: <BYAPR04MB4342CBC9115C538F626E779FE72E9@BYAPR04MB4342.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1265
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: gPH14BuyDgkZm1vEP2QA9HXbbH0diAfpy50tuy9jopcvL0l2zm+aMT7D0yzz2Mv5nX4xqbvDNE1rDdW82vEfbw6ew6eLPgXe0d/F6NmFO8pJLvHC4SSk79MQ4v+lfRWTmkZQFb8KZtBmjfwaea3VXoBitwREQLqphbgiNjW1Zqzp5IU06Xbhv1wW/iuEJGDVenhx32lZnG0aECdjx6ktivivIAgPDJ6xy5ktZUv8imjvA8cc6o58KDroVgvValfG3DOKt1JjObHwsuo6yfXisjoShMZTBPDsyGVu0KEg8qbeJVhJWMhs2zuYMtP3R4kdYfsOFh3BbPuxXnIL9zZsC0+J8FrE9NpRttUrK2/vQ6BbjK52r/relDnzpCqZ5T5NzbZrzr7skhTN4NGifh4I/jWh873Jc1agvkTqPOYj2DdJrJSFIdkTDEytUq6F4hVqwJTauCP7vEa57HiagNR8D+USwTeVupzxpQlQFDlkbUIocsbwbOp1+Gvmn8/EAUVHLIlJYckCdGYmHy0wCbIWVMPxD8C4PSF3fp6+Ha6hPu85JmhyjacZhvkKn+CFONreEhYSoatB+V6one75505uX0DibQFeWomYoo+u20vN3rKvJZ2rt2tqnSCndHTiXrVvY+DG/cecpPAbqtDnDzPk4ltKARZlqE1dbWSjKct+mGw3hLbpHNiNNlFxU03MnaGH7/4gtdjvEjWS8nuYJNduMnbqJ/h4bk1cXaKxmBKRUj0jZ6rI7aXdAivaOcX269XhW2ZhySRB65aeLO1tjIF3ppjynO9+zkBCy18K5gKvS0/iFsSMK4An25atXoOvGaELaMEiZY13rTvDTXBKcux8L8bxPW/97/OvGipjnh6F9UdW6Eb5mANE7+ACLSPYAYBT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(66476007)(66556008)(66946007)(8676002)(76116006)(4326008)(38070700005)(64756008)(66446008)(122000001)(38100700002)(2906002)(31686004)(5660300002)(8936002)(6916009)(54906003)(91956017)(316002)(36756003)(7416002)(31696002)(6506007)(6512007)(53546011)(26005)(508600001)(186003)(6486002)(966005)(2616005)(83380400001)(71200400001)(86362001)(82960400001)(99710200001)(43740500002)(45980500001);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnhJMmtmWUpkbklPbE9oSGlrUWx6WUJGYThvT3FYdGpRVDRtRU1ENHZqY1pD?=
	=?utf-8?B?RnlwL1QwRTIxaXRuWGlxK2JTTlczdGJrdWpsZ2FZQnVYS1FBeUtRNktvZlhz?=
	=?utf-8?B?bXZVU1RNTC9JQU8vbkYxMG9oZnNWZDAxUDEwb2NEYUJmTXRkU2VkUWtzTlpy?=
	=?utf-8?B?WlViWjZ0dTlkcnVmTHlNVUJDS0haMWc0ZzJjNkVNeWt3eWNxWlVaMERnK0h1?=
	=?utf-8?B?SkxHWWdDdmJUMmFEYmVodm9VN1hJMDk5TXdvQ0hudXIzdkxLSGRkYW5pWXMz?=
	=?utf-8?B?YllJRlNCZjJwTHY2dzBFd2FkTVB3UC9CQzNSSVhUOHhBMThGTGdMQ2pRZVVW?=
	=?utf-8?B?Vkk4VTBTOVQ5eWdTcGRTTmZDZStua25zVnN5OFZvbkFYRmI4Z3RHSXUzTCs3?=
	=?utf-8?B?SHVnWExBQytHOWhSUnc1Z25kSlJzaGlUbVVldEVYRmI2amFRWTRiNEJlVlEr?=
	=?utf-8?B?YnZUY0kxWVFnK3lOUldVUFdsSVlzWkZpWUlLay9QaC9kUzZKUHhxK1NTZ0Vu?=
	=?utf-8?B?Z2FFWEZkSGJWUmlia05jZGxFV3hZN2ZFN2pSa2lUVFNPODdtYS94dWx5Sk5C?=
	=?utf-8?B?UHlBU0RkN2syTjkzMVo1ajdPS1ZqeUNvckhDejdIWkZCZjExbUovbk9PanU2?=
	=?utf-8?B?WUtVNTNaL1BLQk5TdnpXTk0yUDBVRFBicXNJNG5RM1RYb0VqMVlNeXZpdzNj?=
	=?utf-8?B?VWIwS1RzeVRVZWZQS1VsZDlPbUgxT0xnRDh4OU1SN0FLK3ZVOG9Ba1EwdFNp?=
	=?utf-8?B?YmlWQ2ZzNkhBUUhocytSOWFXY0UzS0V2cm5RYXpEUUhoQm43eEtKbXBIcmoy?=
	=?utf-8?B?S0NzL0t3eE4yYVE0ZlFLL3lLR2VaZGpCYm9VWWpkWk1aS24vd2pKZUZEemlY?=
	=?utf-8?B?YXMvQ0dyOXZPTHRjRk5TbEc4TFByeHh5YmpzNWI1NzBuZGNqVFlmaSs5VjN6?=
	=?utf-8?B?TlM5ZjdJOE9sWmlrOEpTNm41OWRzTjNMVVR4eGNvL3VzL0dDTklSUzkwWitt?=
	=?utf-8?B?ZjhDNWNORi9KMFNGWitKR0VZMWttOVVnNWUxREd2OW1ycElpTWNkRmJqNWZC?=
	=?utf-8?B?Qk5wWmU4Vkp3ZFpidFBraDZ3Ris1cEtyelFVSGJyV1BPQ1FmKzVvc0czeE9z?=
	=?utf-8?B?WmJvZ1FUa0piQ2ViR1p1K083Tzdrd2VxMm9SUjl5RytQWWsxeDRGQVpad2Nj?=
	=?utf-8?B?UStYSVM5MmVCR0w5bzN0RC9SM2dmSnVMN3NMajEvYkZtM3piM0Y2MUVKRTV3?=
	=?utf-8?B?b3U0VFR5WmpZY2Q3ejFkS3h6SzFCNEF2OVhCZVRubDBhRkc2NWFTOTdLajFI?=
	=?utf-8?B?K1ZIeEh1aTNYUE1heDE2TkdLWnhNeE81akIzWDN2NXc5dkpyVnU1bVVYNDZa?=
	=?utf-8?B?cCs5bmh0YjBJNk9DMXZQZTZtSVcwb0QxTXlJclkranR0Um0wUEs4aW03MjBO?=
	=?utf-8?B?Zk1oT2NEY2JxK3ZYOFZhUkg4cWxGcDArWDJFdGluVHFzQWVETzNRenA2b2M4?=
	=?utf-8?B?NFZuNWJmSXR3amxHbHoxVlE4aWNhQS90b29KTXhsaVZzMUwvSHA1RnhHZEJk?=
	=?utf-8?B?UVhheFc0d25yc2VPSklhbnBPUVZCaE4wdnpka0sybjc2ZDY3VDdNZkJHWUx4?=
	=?utf-8?B?MWVUZ2N3S1AyTUt2N3pac2MxellSSWdRUTVNVkU3YzdpWXRnbFpMblozb3E0?=
	=?utf-8?B?dVVNemFaUnNaSzB0R3lxK2MxeC9Ia3c4YkRkVUZlR1hML0lBU1NZbzFQRXgw?=
	=?utf-8?B?WUVZaGgxb3gvZW1sY09VRUYzbmhYbWZTZkZ1a3BCTXVoZU93bUI3VTF1d0Fx?=
	=?utf-8?B?TWxQVlFHd1c1YzJIV0tERGVWWTJuVm5TdU5aWmxzNGp1QWIvRUVRWGk2TjFa?=
	=?utf-8?B?M29jSkNWa0h3bVBEa2pOdEJ3aDhFZmg5bUo1VnNpdGJaWVFkR2tMT3ZTWHlj?=
	=?utf-8?B?aFVxZVorTFZ4bVA3T0Z2ZkxIZ1BmSVI5UjhQaTgzUml6Y01kWklTZ0JESEFB?=
	=?utf-8?B?T0pHajVjMGxCY3c3SDRoL2xjemJuVFZST2doUEVjNng5bXhGK28rVDVFMm9x?=
	=?utf-8?B?SHExUGYrWFBJUjNtOFA3VjZVQytkUVl2bHVpWjVvZGYvYnNkSzhQbGhQMlU4?=
	=?utf-8?B?ckxHMU1tN1ZRMjQvQlNSQ1FTZkRsNG96cDhvazQySG5MMVg3dW5VNDZFZjQ3?=
	=?utf-8?Q?58HZQg6hrhsRb8Uy6bvW2y7+mjEh+p0J4CYKBRL1pwj9?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a368c7c3-2e6a-49e7-4bc6-08d9ebb93b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 10:45:04.3998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3yqBSJ3BfWOQO9yCnLMpL+NiY5iMk8ZQxMoaICQXYSrQ6b+WmCgvJ8Re7uE8DTTHANf9iOJl48IqljUKziktw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4342
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 219AkLIZ030836
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>, Theodore
	Ts'o <tytso@mit.edu>, "Darrick J . Wong" <darrick.wong@oracle.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Stable <stable@vger.kernel.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Harjani <riteshh@linux.ibm.com>, Ritesh,
	Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>,
	"syzbot+0ed9f769264276638893@syzkaller.appspotmail.com"
	<syzbot+0ed9f769264276638893@syzkaller.appspotmail.com>
Subject: Re: [Cluster-devel] [PATCH 1/1] Revert "iomap: fall back to
 buffered writes for invalidation failures"
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
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A956AF6ABC3C394A9D245BB411A313FC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: 8bit

On 2022/02/09 17:52, Lee Jones wrote:
> This reverts commit 60263d5889e6dc5987dc51b801be4955ff2e4aa7.
> 
> Reverting since this commit opens a potential avenue for abuse.
> 
> The C-reproducer and more information can be found at the link below.
> 
> With this patch applied, I can no longer get the repro to trigger.
> 
>   kernel BUG at fs/ext4/inode.c:2647!
>   invalid opcode: 0000 [#1] PREEMPT SMP KASAN
>   CPU: 0 PID: 459 Comm: syz-executor359 Tainted: G        W         5.10.93-syzkaller-01028-g0347b1658399 #0
>   Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>   RIP: 0010:mpage_prepare_extent_to_map+0xbe9/0xc00 fs/ext4/inode.c:2647
>   Code: e8 fc bd c3 ff e9 80 f6 ff ff 44 89 e9 80 e1 07 38 c1 0f 8c a6 fe ff ff 4c 89 ef e8 e1 bd c3 ff e9 99 fe ff ff e8 87 c9 89 ff <0f> 0b e8 80 c9 89 ff 0f 0b e8 79 1e b8 02 66 0f 1f 84 00 00 00 00
>   RSP: 0018:ffffc90000e2e9c0 EFLAGS: 00010293
>   RAX: ffffffff81e321f9 RBX: 0000000000000000 RCX: ffff88810c12cf00
>   RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>   RBP: ffffc90000e2eb90 R08: ffffffff81e31e71 R09: fffff940008d68b1
>   R10: fffff940008d68b1 R11: 0000000000000000 R12: ffffea00046b4580
>   R13: ffffc90000e2ea80 R14: 000000000000011e R15: dffffc0000000000
>   FS:  00007fcfd0717700(0000) GS:ffff8881f7000000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 00007fcfd07d5520 CR3: 000000010a142000 CR4: 00000000003506b0
>   DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>   Call Trace:
>    ext4_writepages+0xcbb/0x3950 fs/ext4/inode.c:2776
>    do_writepages+0x13a/0x280 mm/page-writeback.c:2358
>    __filemap_fdatawrite_range+0x356/0x420 mm/filemap.c:427
>    filemap_write_and_wait_range+0x64/0xe0 mm/filemap.c:660
>    __iomap_dio_rw+0x621/0x10c0 fs/iomap/direct-io.c:495
>    iomap_dio_rw+0x35/0x80 fs/iomap/direct-io.c:611
>    ext4_dio_write_iter fs/ext4/file.c:571 [inline]
>    ext4_file_write_iter+0xfc5/0x1b70 fs/ext4/file.c:681
>    do_iter_readv_writev+0x548/0x740 include/linux/fs.h:1941
>    do_iter_write+0x182/0x660 fs/read_write.c:866
>    vfs_iter_write+0x7c/0xa0 fs/read_write.c:907
>    iter_file_splice_write+0x7fb/0xf70 fs/splice.c:686
>    do_splice_from fs/splice.c:764 [inline]
>    direct_splice_actor+0xfe/0x130 fs/splice.c:933
>    splice_direct_to_actor+0x4f4/0xbc0 fs/splice.c:888
>    do_splice_direct+0x28b/0x3e0 fs/splice.c:976
>    do_sendfile+0x914/0x1390 fs/read_write.c:1257
> 
> Link: https://syzkaller.appspot.com/bug?extid=41c966bf0729a530bd8d
> 
> From the patch:
> Cc: Stable <stable@vger.kernel.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Dave Chinner <dchinner@redhat.com>
> Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>
> Cc: Darrick J. Wong <darrick.wong@oracle.com>
> Cc: Bob Peterson <rpeterso@redhat.com>
> Cc: Damien Le Moal <damien.lemoal@wdc.com>
> Cc: Theodore Ts'o <tytso@mit.edu> # for ext4
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: Ritesh Harjani <riteshh@linux.ibm.com>
> 
> Others:
> Cc: Johannes Thumshirn <jth@kernel.org>
> Cc: linux-xfs@vger.kernel.org
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-ext4@vger.kernel.org
> Cc: cluster-devel@redhat.com
> 
> Fixes: 60263d5889e6d ("iomap: fall back to buffered writes for invalidation failures")
> Reported-by: syzbot+0ed9f769264276638893@syzkaller.appspotmail.com
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

For zonefs:

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>



-- 
Damien Le Moal
Western Digital Research

