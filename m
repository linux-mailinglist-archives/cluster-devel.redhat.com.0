Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 609E028AC27
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 04:31:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-1mNY41t8O1qUN8L2JqPWfA-1; Sun, 11 Oct 2020 22:31:50 -0400
X-MC-Unique: 1mNY41t8O1qUN8L2JqPWfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 810E0425CE;
	Mon, 12 Oct 2020 02:31:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AACFA55769;
	Mon, 12 Oct 2020 02:31:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52F4892312;
	Mon, 12 Oct 2020 02:31:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09C2VZPE022571 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 11 Oct 2020 22:31:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0DA528B046; Mon, 12 Oct 2020 02:31:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B851828B042
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 02:31:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB4EB1823602
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 02:31:32 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-351-MM1U_W32PTC5xvaBygye-Q-1; Sun, 11 Oct 2020 22:31:28 -0400
X-MC-Unique: MM1U_W32PTC5xvaBygye-Q-1
IronPort-SDR: otNXfCl468GV2kaRfPMurNEzzb+5DTvHbKamj2s+8BDLocQWr4zuQ3M3i+IKAljLE0jNxd9VpM
	cO+rQZXBC3hCB4USGfnGA9ogfGdhVarakItuizW2Gy++p8Z+M6RlhT6/ZGAyh4Bb4soyndVApS
	t1CbgZ/xItk8xcO9aKd2ojIIDU+T0Z2LVw84K7kBp34/4Smmy1km93xm3x16vuxVWJ3+pskOv3
	siKun/r5wc2+puveLQmD3LIou+hiTE8AMRzhJ76wz/XN32b0xaH0DxtBNrPj7bQ2z+DqpFhCU+
	uec=
X-IronPort-AV: E=Sophos;i="5.77,365,1596470400"; d="scan'208";a="150813289"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
	by ob1.hgst.iphmx.com with ESMTP; 12 Oct 2020 10:30:21 +0800
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
	by MN2PR04MB6928.namprd04.prod.outlook.com (2603:10b6:208:1e3::8)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24;
	Mon, 12 Oct 2020 02:30:19 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
	([fe80::4c3e:2b29:1dc5:1a85]) by
	BL0PR04MB6514.namprd04.prod.outlook.com
	([fe80::4c3e:2b29:1dc5:1a85%6]) with mapi id 15.20.3455.029;
	Mon, 12 Oct 2020 02:30:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "ira.weiny@intel.com" <ira.weiny@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
	Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski
	<luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Thread-Topic: [PATCH RFC PKS/PMEM 26/58] fs/zonefs: Utilize new kmap_thread()
Thread-Index: AQHWnnW5LYLzak05pEGSI1gzotA84w==
Date: Mon, 12 Oct 2020 02:30:18 +0000
Message-ID: <BL0PR04MB65146627753E6A8125C30044E7070@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-27-ira.weiny@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:dbd:ddb3:86a4:b7da]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d8e38c9-c661-47b4-955c-08d86e56c300
x-ms-traffictypediagnostic: MN2PR04MB6928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB69281462D64954D72F6383A1E7070@MN2PR04MB6928.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2089
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: nb7ZZkrOcnI45uzu82g63ZPDCw/m4UEa+T14BlRir04UDAmgqTKjBKFQ/1tq3q95aFreC/myPH7bQVuOZygHUtANTgMCUzT/Pyur4q2rkZgxQjgu2tK2/9wVp2h2SQ2PIehISfjlFkUmEohfWX26Cg+7Fw+ncYVUGCA3GBq/iNQrWxbeF5GIkE4ciKI2Ta+JMFg530FWmVV/3MNOdO5PIr93+nS5dgdzR8tDl4fNZNcda6K0U+RBmBhAF6G4PiHCwu4dLKAqHtEtpN1w+lsxrk7joY78vLDxPGvR8dOWqU93TlxExhLGaLZNWnYKeI3pA3QpzCWmAeR04Ul6/pWdYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(8936002)(71200400001)(86362001)(186003)(91956017)(4326008)(66446008)(64756008)(66556008)(76116006)(7366002)(52536014)(8676002)(4744005)(5660300002)(33656002)(6506007)(7406005)(7416002)(478600001)(66946007)(66476007)(9686003)(53546011)(55016002)(7696005)(316002)(110136005)(54906003)(2906002)(83380400001);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: jjLBIa8rzP8PSUzUPRNNjZPO+F9m4B6rNx2BP5Hxn4hovZp8mG8VwNQRMnSFbWOz3vIBGGbrlwmZ2h/rrQ3LAnV478QA8TsJeEWgnROLCLR26e3M2EbbogZuJfrd8ZHepR6teHHrbin/rSSMJcyuivIccqO+Io91CjJtVLKGT+IxxyJeBxmaC3EM+JLu8Rm3Kx8m967TzWpRyeGTzqzgeKyG0yThTif6ugu1X+cS2L5ObX1F/fl2leT5khZ92kjaRHmV42QjfDSDQBRJ5T2sWkjLqL6qZdGMf2A7TG8LiEhWaSnE+PmptdxY4alKupBmftgWegPnh18eZ3klScKVzKqPJWtLa3seT93Q56fQAqIthA5+kX5qt7UatZBhg0gKm0KkBt+EXNCPEi6hfwJXTcKfMhrLXdmO4xo5z+sSfQStIvDc5rcmkS1pZ7oYknbDJlJtS3SQSqbBQQUJPafcSH0MKoCCaLHQYYEZElvKn9S/oXh/zKwEQ9/zN4tqic4ypaC6xgod9dW89WUn6IRtPbzsXwH70beu1D6sABibklUQzTXk4zAezxU4pLpXOEpjFmzQIZ8wo7n5pOvKphLu99Aqpkh/XR9us5YFAynE0SXyaG0lSyNOUkHX4czg41/a9jardublYq7n+2PgYlLtR3YEH/hKmOGAbSLFeveqJxrdOEFzmYAfv7w/UdGZFRYD9O0jto4jXaOrMeEBD/8QJw==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8e38c9-c661-47b4-955c-08d86e56c300
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 02:30:18.8981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtNVgLbLUqLnCuOwFgwFyh+Wo2k/+4LOuBCyiRJEYABushz8+FxnNx4RRBUxLG0y9/lhxKLevLpPI63mq8apww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6928
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09C2VZPE022571
X-loop: cluster-devel@redhat.com
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>,
	"devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-ntfs-dev@lists.sourceforge.net"
	<linux-ntfs-dev@lists.sourceforge.net>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH RFC PKS/PMEM 26/58] fs/zonefs: Utilize
	new kmap_thread()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On 2020/10/10 4:52, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kmap() calls in this FS are localized to a single thread.  To avoid
> the over head of global PKRS updates use the new kmap_thread() call.
> 
> Cc: Damien Le Moal <damien.lemoal@wdc.com>
> Cc: Naohiro Aota <naohiro.aota@wdc.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  fs/zonefs/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 8ec7c8f109d7..2fd6c86beee1 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -1297,7 +1297,7 @@ static int zonefs_read_super(struct super_block *sb)
>  	if (ret)
>  		goto free_page;
>  
> -	super = kmap(page);
> +	super = kmap_thread(page);
>  
>  	ret = -EINVAL;
>  	if (le32_to_cpu(super->s_magic) != ZONEFS_MAGIC)
> @@ -1349,7 +1349,7 @@ static int zonefs_read_super(struct super_block *sb)
>  	ret = 0;
>  
>  unmap:
> -	kunmap(page);
> +	kunmap_thread(page);
>  free_page:
>  	__free_page(page);
>  
> 

acked-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



