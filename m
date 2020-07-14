Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5C721EDF0
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 12:26:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-_teRbs6LOISqzFikJjgQiQ-1; Tue, 14 Jul 2020 06:26:49 -0400
X-MC-Unique: _teRbs6LOISqzFikJjgQiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 957BD102CC3A;
	Tue, 14 Jul 2020 10:26:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDC6F10013C0;
	Tue, 14 Jul 2020 10:26:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44782180954D;
	Tue, 14 Jul 2020 10:26:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06E1hjhL001974 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 21:43:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6625D8056F; Tue, 14 Jul 2020 01:43:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 608748289A
	for <cluster-devel@redhat.com>; Tue, 14 Jul 2020 01:43:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CA15924902
	for <cluster-devel@redhat.com>; Tue, 14 Jul 2020 01:43:42 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-322-__mG2pEbMAyJkIk1E5bz8w-1; Mon, 13 Jul 2020 21:43:40 -0400
X-MC-Unique: __mG2pEbMAyJkIk1E5bz8w-1
IronPort-SDR: Sh83aetPksjIcpFmgqcyaWoxqrwab1xEOxSHEu2TIPiEmoZ+bP+AMtnhVVOoM+DjSfxmQAWRyU
	CP/5RyvKv+Vd106GPDoOvN+7eeHkJ0UgAwUpp+PChEIfG2IC03nH/xTbfMqMfBsZgyxaWOpR8i
	MhJXIyGfGMiqN+atOvp9FdElCgS4lnMxM5915kcGqLPev/MknpzXti0NZNfegfrjb0NOzNwbY4
	vu1I8LVXlC18UU1zf19AWbwtG0qRuzDm1waIM69uCYE1t0OTTg0LjzZXnQGU2mlm5GEx8njfWl
	Auw=
X-IronPort-AV: E=Sophos;i="5.75,349,1589212800"; d="scan'208";a="245397286"
Received: from mail-co1nam04lp2053.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.53])
	by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2020 09:41:53 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0342.namprd04.prod.outlook.com (2603:10b6:903:3f::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23;
	Tue, 14 Jul 2020 01:41:35 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3174.022;
	Tue, 14 Jul 2020 01:41:35 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Dave Chinner <david@fromorbit.com>,
	Goldwyn Rodrigues <rgoldwyn@suse.de>
Thread-Topic: [PATCH 2/2] iomap: fall back to buffered writes for invalidation
	failures
Thread-Index: AQHWWOpfe2YKgQYiyEytHJaTXg3ezA==
Date: Tue, 14 Jul 2020 01:41:34 +0000
Message-ID: <CY4PR04MB37512AD7FD85DEB3014D01D2E7610@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200713074633.875946-1-hch@lst.de>
	<20200713074633.875946-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7da51972-d886-464b-5637-08d827970af9
x-ms-traffictypediagnostic: CY4PR04MB0342:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB0342B06BA5D28B4830DDA918E7610@CY4PR04MB0342.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 44qJN3uBpQHrUyTU3Vk+vIAbtGPTMbAewOZdrWONYjOohS/unQawwqRpn+Qd2LhjRlyvvrGmooKMfTlBtw20XUJhhW86kb75/evf7krNJrt9/kpWledMP033w7kiJnm3GQD9n6lPJpex5drlcWqFbFER4HHcQzWH+fEmUTGQP9fZUppdXzW0GPpwkBrE478VPMRvjnc9g2NoE8lZl8MyuyuAHLT7YT4Qfrfbsja78rosHgnIJODvw3TKE2nZgugj+W1chz+E2+fQvn4C1pNOt+WwoF16b1Xz3JfEN5ianhPtafIeOhGw/WWm7xmE+wM1gJwqRGHEIgkF24aJJA8boQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(7696005)(7416002)(71200400001)(110136005)(478600001)(186003)(76116006)(54906003)(26005)(9686003)(86362001)(83380400001)(6506007)(53546011)(64756008)(66556008)(8676002)(91956017)(66446008)(66476007)(66946007)(5660300002)(2906002)(316002)(4326008)(33656002)(8936002)(52536014)(55016002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: p1FWfACkzD9K2pmzKpRnzBAt48eaEXfHdbX2fHR8PUGxm2z38gEDH1nXbqlE0tvwtivhD0MRA0WDcnkeHlcNOqUUo9zkAxyYaYIgyuHaMZMlS7xgiCMAagrMDxisElyoNy0eTrEW+gpMVjNcmcTDx6cOOEeBPCFLDWj6Z1s08EmCniJLIpLZU5YW9lrQn+zabpkvQ8/+Ae+2V/8CY0YjYmaiiNzcAcXxWW3aflkElCQbZvTtU7jryQY4oJX8OEn2PCxFsao4OaTp2Kv+016fT8n9GX686nLrYAzBAtEIwrIhBmSCf2g77qlvO5xJF5L142dMXc5DOzQCB2ThCLr6ddMqBvQAiMHHn3jabv8nUO10UfJF/bGyc4d4DuIdg6ko2XePCZEhPIIRo4WfJt5erNW/tUNy/5Y1c77JMyxYS+gR8nHjqxQp9QwdPz9PAH+pSMceQ50nTdLvsTd96vnKceQkNgQWmgwudXA9CLmB01qUnxklrVgd5WrrTixvGOdh
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da51972-d886-464b-5637-08d827970af9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 01:41:34.9373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +WLpGoX6VJbLuqE0K8+z+uqmLyM089kOJI2miSmcNmoMF+N8ibftosSLMiovIucEsKhBlp4L9XvauJJepyxZRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0342
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06E1hjhL001974
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jul 2020 06:26:40 -0400
Cc: Naohiro Aota <Naohiro.Aota@wdc.com>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Johannes Thumshirn <jth@kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 2/2] iomap: fall back to buffered writes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On 2020/07/13 16:51, Christoph Hellwig wrote:
> Failing to invalid the page cache means data in incoherent, which is

s/in incoherent/is incoherent

> a very bad state for the system.  Always fall back to buffered I/O
> through the page cache if we can't invalidate mappings.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/file.c       |  2 ++
>  fs/gfs2/file.c       |  3 ++-
>  fs/iomap/direct-io.c | 13 ++++++++-----
>  fs/iomap/trace.h     |  1 +
>  fs/xfs/xfs_file.c    |  4 ++--
>  fs/zonefs/super.c    |  7 +++++--
>  6 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 2a01e31a032c4c..0da6c2a2c32c1e 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -544,6 +544,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		iomap_ops = &ext4_iomap_overwrite_ops;
>  	ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
>  			   is_sync_kiocb(iocb) || unaligned_io || extend);
> +	if (ret == -EREMCHG)
> +		ret = 0;
>  
>  	if (extend)
>  		ret = ext4_handle_inode_extension(inode, offset, ret, count);
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index fe305e4bfd3734..c7907d40c61d17 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -814,7 +814,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
>  
>  	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
>  			   is_sync_kiocb(iocb));
> -
> +	if (ret == -EREMCHG)
> +		ret = 0;
>  out:
>  	gfs2_glock_dq(&gh);
>  out_uninit:
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 190967e87b69e4..62626235cdbe8d 100644
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
> @@ -478,13 +479,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
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
> +			ret = -EREMCHG;

I am wondering if it is OK to unconditionally always return -EREMCHG here.
Shouldn't this depend on the return code of invalidate_inode_pages2_range() ?
ret may be the value returned by mapping->a_ops->launder_page(page) instead of
-EBUSY that invalidate_inode_pages2_range() otherwise returns for a failed
invalidation. Isn't their any error condition that would be better served by not
forcing the fallback to buffered write ? E.g. -ENOMEM ?



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
> index 00db81eac80d6c..551cca39fa3ba6 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -553,8 +553,8 @@ xfs_file_dio_aio_write(
>  	xfs_iunlock(ip, iolock);
>  
>  	/*
> -	 * No fallback to buffered IO on errors for XFS, direct IO will either
> -	 * complete fully or fail.
> +	 * No partial fallback to buffered IO on errors for XFS, direct IO will
> +	 * either complete fully or fail.
>  	 */
>  	ASSERT(ret < 0 || ret == count);
>  	return ret;
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 07bc42d62673ce..793850454b752f 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -786,8 +786,11 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	if (iocb->ki_pos >= ZONEFS_I(inode)->i_max_size)
>  		return -EFBIG;
>  
> -	if (iocb->ki_flags & IOCB_DIRECT)
> -		return zonefs_file_dio_write(iocb, from);
> +	if (iocb->ki_flags & IOCB_DIRECT) {
> +		ret = zonefs_file_dio_write(iocb, from);
> +		if (ret != -EREMCHG)
> +			return ret;
> +	}

This looks fine. This would happen only for conventional zone writes since
sequential zone writes cannot ever issue direct IOs on top of cached data as
that would be a forbidden "overwrite" operation.

>  
>  	return zonefs_file_buffered_write(iocb, from);
>  }
> 


-- 
Damien Le Moal
Western Digital Research



