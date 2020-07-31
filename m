Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0383C233FBE
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jul 2020 09:10:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-SdYESROCOY-VwvI7mceBPQ-1; Fri, 31 Jul 2020 03:10:17 -0400
X-MC-Unique: SdYESROCOY-VwvI7mceBPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DAE7800460;
	Fri, 31 Jul 2020 07:10:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE62C10013C4;
	Fri, 31 Jul 2020 07:10:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 498491809557;
	Fri, 31 Jul 2020 07:10:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06V71NgR025387 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 03:01:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F14E2F4ED0; Fri, 31 Jul 2020 07:01:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFD1AF5188
	for <cluster-devel@redhat.com>; Fri, 31 Jul 2020 07:01:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1615800052
	for <cluster-devel@redhat.com>; Fri, 31 Jul 2020 07:01:19 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-52-RmUN6LiEPySf-25LuwPkcg-1; Fri, 31 Jul 2020 03:01:17 -0400
X-MC-Unique: RmUN6LiEPySf-25LuwPkcg-1
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	06V6WCUS059915; Fri, 31 Jul 2020 03:01:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32mc8wk8na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 31 Jul 2020 03:01:16 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06V6oCOn103706;
	Fri, 31 Jul 2020 03:01:16 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
	[159.122.73.71])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32mc8wk8mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 31 Jul 2020 03:01:16 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	06V70YTs023783; Fri, 31 Jul 2020 07:01:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma02fra.de.ibm.com with ESMTP id 32gcq0v9c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 31 Jul 2020 07:01:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 06V71BHi25362690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 31 Jul 2020 07:01:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 614075205A;
	Fri, 31 Jul 2020 07:01:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.33.112])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1B13252079;
	Fri, 31 Jul 2020 07:01:08 +0000 (GMT)
To: Christoph Hellwig <hch@lst.de>, Dave Chinner <david@fromorbit.com>,
	Goldwyn Rodrigues <rgoldwyn@suse.de>
References: <20200721183157.202276-1-hch@lst.de>
	<20200721183157.202276-4-hch@lst.de>
From: Ritesh Harjani <riteshh@linux.ibm.com>
Date: Fri, 31 Jul 2020 12:31:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200721183157.202276-4-hch@lst.de>
Content-Language: en-US
Message-Id: <20200731070109.1B13252079@d06av21.portsmouth.uk.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-07-31_01:2020-07-30,
	2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0 clxscore=1011
	impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
	lowpriorityscore=0 suspectscore=2 bulkscore=0 mlxlogscore=999
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007310045
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 31 Jul 2020 03:10:06 -0400
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	cluster-devel@redhat.com, Goldwyn Rodrigues <rgoldwyn@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/22/20 12:01 AM, Christoph Hellwig wrote:
> Failing to invalid the page cache means data in incoherent, which is
> a very bad state for the system.  Always fall back to buffered I/O
> through the page cache if we can't invalidate mappings.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Dave Chinner <dchinner@redhat.com>
> Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>


Reviewed-by: Ritesh Harjani <riteshh@linux.ibm.com>
  mainly for ext4 part.


> ---
>   fs/ext4/file.c       |  2 ++
>   fs/gfs2/file.c       |  3 ++-
>   fs/iomap/direct-io.c | 16 +++++++++++-----
>   fs/iomap/trace.h     |  1 +
>   fs/xfs/xfs_file.c    |  4 ++--
>   fs/zonefs/super.c    |  7 +++++--
>   6 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 2a01e31a032c4c..129cc1dd6b7952 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -544,6 +544,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		iomap_ops = &ext4_iomap_overwrite_ops;
>   	ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
>   			   is_sync_kiocb(iocb) || unaligned_io || extend);
> +	if (ret == -ENOTBLK)
> +		ret = 0;
> 
>   	if (extend)
>   		ret = ext4_handle_inode_extension(inode, offset, ret, count);
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index bebde537ac8cf2..b085a3bea4f0fd 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -835,7 +835,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
> 
>   	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
>   			   is_sync_kiocb(iocb));
> -
> +	if (ret == -ENOTBLK)
> +		ret = 0;
>   out:
>   	gfs2_glock_dq(&gh);
>   out_uninit:
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 190967e87b69e4..c1aafb2ab99072 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -10,6 +10,7 @@
>   #include <linux/backing-dev.h>
>   #include <linux/uio.h>
>   #include <linux/task_io_accounting_ops.h>
> +#include "trace.h"
> 
>   #include "../internal.h"
> 
> @@ -401,6 +402,9 @@ iomap_dio_actor(struct inode *inode, loff_t pos, loff_t length,
>    * can be mapped into multiple disjoint IOs and only a subset of the IOs issued
>    * may be pure data writes. In that case, we still need to do a full data sync
>    * completion.
> + *
> + * Returns -ENOTBLK In case of a page invalidation invalidation failure for
> + * writes.  The callers needs to fall back to buffered I/O in this case.
>    */
>   ssize_t
>   iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> @@ -478,13 +482,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>   	if (iov_iter_rw(iter) == WRITE) {
>   		/*
>   		 * Try to invalidate cache pages for the range we are writing.
> -		 * If this invalidation fails, tough, the write will still work,
> -		 * but racing two incompatible write paths is a pretty crazy
> -		 * thing to do, so we don't support it 100%.
> +		 * If this invalidation fails, let the caller fall back to
> +		 * buffered I/O.
>   		 */
>   		if (invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
> -				end >> PAGE_SHIFT))
> -			dio_warn_stale_pagecache(iocb->ki_filp);
> +				end >> PAGE_SHIFT)) {
> +			trace_iomap_dio_invalidate_fail(inode, pos, count);
> +			ret = -ENOTBLK;
> +			goto out_free_dio;
> +		}
> 
>   		if (!wait_for_completion && !inode->i_sb->s_dio_done_wq) {
>   			ret = sb_init_dio_done_wq(inode->i_sb);

Just as a note. So if the driver returns -ENOTBLK (from ->iomap_end)then
iomap considers it as a magic value to fall back to buffered-io and it
changes ret=0 And now with this patch, iomap could also return
-ENOTBLK if it gets an error while doing above operation and so the
driver is free to consider this as a fallback mechanism to buffered-io.

