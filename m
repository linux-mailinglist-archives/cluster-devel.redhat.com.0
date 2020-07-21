Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5E345228C7C
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jul 2020 01:11:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-oXyICbIqOYOVe82F7uvyqQ-1; Tue, 21 Jul 2020 19:11:38 -0400
X-MC-Unique: oXyICbIqOYOVe82F7uvyqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C55510059AA;
	Tue, 21 Jul 2020 23:11:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0435B60E1C;
	Tue, 21 Jul 2020 23:11:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59A69730D4;
	Tue, 21 Jul 2020 23:11:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LN3CMX022398 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 19:03:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78856207B2B0; Tue, 21 Jul 2020 23:03:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 731962026D69
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 23:03:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93201800658
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 23:03:09 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-427-CJGvJkbcPAGsRSCmul9lhA-1; Tue, 21 Jul 2020 19:03:07 -0400
X-MC-Unique: CJGvJkbcPAGsRSCmul9lhA-1
IronPort-SDR: 6zXZuTEtaDCKacFjATcPNS9nWGEVoFawZoz6bFVzvgcJOZrIpWghZIMkW+Oc6/PdIlWhEq0xWc
	dlzleMm/1/HfZ3UVtOH+Cyaa+7DIwLwrzaaT1dm1CR7WJdjRxxnvFkEiomsq5LGOPxLZ/5XBT0
	ltVxQihIb9/cpkQttY/9VjuE1VeuKg82FvrFB2/1/4ADw91WLmK0UpwbCyqL2iZj4K7hbJCkff
	oI3ZDfdTfDFGsDPRAvt3eTQfVyrsMYYNWSNetCv3Oq/K0GyOOsCJ9xAGib/CzbIZIgnF3eXNUj
	Edo=
X-IronPort-AV: E=Sophos;i="5.75,380,1589212800"; d="scan'208";a="144323903"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 07:02:01 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0344.namprd04.prod.outlook.com (2603:10b6:903:3d::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25;
	Tue, 21 Jul 2020 23:02:00 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025;
	Tue, 21 Jul 2020 23:01:59 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Dave Chinner <david@fromorbit.com>,
	Goldwyn Rodrigues <rgoldwyn@suse.de>
Thread-Topic: [PATCH 3/3] iomap: fall back to buffered writes for invalidation
	failures
Thread-Index: AQHWX41AZHgnsBRxxUOY+Qc2jgClZg==
Date: Tue, 21 Jul 2020 23:01:59 +0000
Message-ID: <CY4PR04MB37517784D29AFC7CCBAD1A0AE7780@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200721183157.202276-1-hch@lst.de>
	<20200721183157.202276-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b05dc4bb-14de-47a2-0a6c-08d82dca12f6
x-ms-traffictypediagnostic: CY4PR04MB0344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB03449217CCEE6D26EF820502E7780@CY4PR04MB0344.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UyK5kY3yVzzbkszaDCMzLrHJ+c36n4Teb7fx2CAPm/C1vspwRudN/9qkOQIqKYLMvKMswUUx0ZcMnfzrmSWpV05zzS/f8YEfsq8ijzBN3R+gNyJTViTyNQa5u3gwytGRKpL6YS9vjmopt278TBPGNx9GxrKt2x9rJAJWugt27QO1PBJ6Sx8EFohNLlpfnE6z3Coo/i2vIRZ8XNoD4L8PEAQHOKAoLh6oA8/pNx94lnlQ7n+pO/5ea3nFWIWMEsnTnpurMLffZoTTt64l4v420XHvCHVXloEiNXlPh1MIFpVWHnwADVsh5br7GgxTLSCM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(316002)(5660300002)(64756008)(7696005)(8936002)(53546011)(8676002)(6506007)(186003)(66556008)(86362001)(66476007)(66946007)(26005)(76116006)(91956017)(66446008)(7416002)(2906002)(54906003)(110136005)(55016002)(52536014)(71200400001)(478600001)(4326008)(83380400001)(9686003)(33656002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: cYSFy/CjR18YkyZE8RC0GPQxCBpUmBcSTj6rUU4jEXkT8M3Hu7hy55t8YWAbFP4sR90mwJggBb75OmcCN1r52TlX3A8erHPS1IcjgkVfT3spXkMamwA1vJApBg9ly2pB1EuF2Wm1EL1oUctt/8UKNSA9155XhvJMKPUjVyw5diF9JruiybI7IljoJe3q32Cdqsgjdto/ZfrdV3G3MTi1tI4bInQQwNKAhKarOJTQHfg6FF6TrT/A6NdsT5Zz1yH9LLV9HphLX/MRt8shtbCGck3RQFez8Qo2DzX0YJM/VYY/S4B2EahewAdDnsMOVCMVGg3OemjsgDMIDM+0A02nNsaFNCaPdph1iTehD8EAE6zqgDzJUxxPmvzZybpXZ4MqA6k3FScNbMhfc2t+Es/rxlN9+7+sL5itkXTnV34CximVmTsQ9Lf/25tm0og8CE1WGMJIa26U74c5i5F+/f8sZ1FKFMf2mCSqGM/mPc7vlRtBzYcmje1BSMRLdPfE6Kpt
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05dc4bb-14de-47a2-0a6c-08d82dca12f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 23:01:59.5874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: owC04WxI1s1W7L02eeMwBeccs9mKHCJNIjDY7BiO1XGrp+rj8+i0LA3y+8OR9T39vWcz3ki9M+0FlCgM+z/aGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0344
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06LN3CMX022398
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <Naohiro.Aota@wdc.com>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Goldwyn, Matthew Wilcox <willy@infradead.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Rodrigues <rgoldwyn@suse.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Johannes Thumshirn <jth@kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 3/3] iomap: fall back to buffered writes
 for invalidation failures
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On 2020/07/22 3:32, Christoph Hellwig wrote:
> Failing to invalid the page cache means data in incoherent, which is
> a very bad state for the system.  Always fall back to buffered I/O
> through the page cache if we can't invalidate mappings.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Dave Chinner <dchinner@redhat.com>
> Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> ---
>  fs/ext4/file.c       |  2 ++
>  fs/gfs2/file.c       |  3 ++-
>  fs/iomap/direct-io.c | 16 +++++++++++-----
>  fs/iomap/trace.h     |  1 +
>  fs/xfs/xfs_file.c    |  4 ++--
>  fs/zonefs/super.c    |  7 +++++--
>  6 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 2a01e31a032c4c..129cc1dd6b7952 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -544,6 +544,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		iomap_ops = &ext4_iomap_overwrite_ops;
>  	ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
>  			   is_sync_kiocb(iocb) || unaligned_io || extend);
> +	if (ret == -ENOTBLK)
> +		ret = 0;
>  
>  	if (extend)
>  		ret = ext4_handle_inode_extension(inode, offset, ret, count);
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index bebde537ac8cf2..b085a3bea4f0fd 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -835,7 +835,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
>  
>  	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
>  			   is_sync_kiocb(iocb));
> -
> +	if (ret == -ENOTBLK)
> +		ret = 0;
>  out:
>  	gfs2_glock_dq(&gh);
>  out_uninit:
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 190967e87b69e4..c1aafb2ab99072 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -10,6 +10,7 @@
>  #include <linux/backing-dev.h>
>  #include <linux/uio.h>
>  #include <linux/task_io_accounting_ops.h>
> +#include "trace.h"
>  
>  #include "../internal.h"
>  
> @@ -401,6 +402,9 @@ iomap_dio_actor(struct inode *inode, loff_t pos, loff_t length,
>   * can be mapped into multiple disjoint IOs and only a subset of the IOs issued
>   * may be pure data writes. In that case, we still need to do a full data sync
>   * completion.
> + *
> + * Returns -ENOTBLK In case of a page invalidation invalidation failure for
> + * writes.  The callers needs to fall back to buffered I/O in this case.
>   */
>  ssize_t
>  iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> @@ -478,13 +482,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  	if (iov_iter_rw(iter) == WRITE) {
>  		/*
>  		 * Try to invalidate cache pages for the range we are writing.
> -		 * If this invalidation fails, tough, the write will still work,
> -		 * but racing two incompatible write paths is a pretty crazy
> -		 * thing to do, so we don't support it 100%.
> +		 * If this invalidation fails, let the caller fall back to
> +		 * buffered I/O.
>  		 */
>  		if (invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
> -				end >> PAGE_SHIFT))
> -			dio_warn_stale_pagecache(iocb->ki_filp);
> +				end >> PAGE_SHIFT)) {
> +			trace_iomap_dio_invalidate_fail(inode, pos, count);
> +			ret = -ENOTBLK;
> +			goto out_free_dio;
> +		}
>  
>  		if (!wait_for_completion && !inode->i_sb->s_dio_done_wq) {
>  			ret = sb_init_dio_done_wq(inode->i_sb);
> diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
> index 5693a39d52fb63..fdc7ae388476f5 100644
> --- a/fs/iomap/trace.h
> +++ b/fs/iomap/trace.h
> @@ -74,6 +74,7 @@ DEFINE_EVENT(iomap_range_class, name,	\
>  DEFINE_RANGE_EVENT(iomap_writepage);
>  DEFINE_RANGE_EVENT(iomap_releasepage);
>  DEFINE_RANGE_EVENT(iomap_invalidatepage);
> +DEFINE_RANGE_EVENT(iomap_dio_invalidate_fail);
>  
>  #define IOMAP_TYPE_STRINGS \
>  	{ IOMAP_HOLE,		"HOLE" }, \
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index a6ef90457abf97..1b4517fc55f1b9 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -553,8 +553,8 @@ xfs_file_dio_aio_write(
>  	xfs_iunlock(ip, iolock);
>  
>  	/*
> -	 * No fallback to buffered IO on errors for XFS, direct IO will either
> -	 * complete fully or fail.
> +	 * No fallback to buffered IO after short writes for XFS, direct I/O
> +	 * will either complete fully or return an error.
>  	 */
>  	ASSERT(ret < 0 || ret == count);
>  	return ret;
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 07bc42d62673ce..d0a04528a7e18e 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -786,8 +786,11 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	if (iocb->ki_pos >= ZONEFS_I(inode)->i_max_size)
>  		return -EFBIG;
>  
> -	if (iocb->ki_flags & IOCB_DIRECT)
> -		return zonefs_file_dio_write(iocb, from);
> +	if (iocb->ki_flags & IOCB_DIRECT) {
> +		ssize_t ret = zonefs_file_dio_write(iocb, from);
> +		if (ret != -ENOTBLK)
> +			return ret;
> +	}
>  
>  	return zonefs_file_buffered_write(iocb, from);
>  }
> 

Looks fine. For zonefs:

Acked-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



