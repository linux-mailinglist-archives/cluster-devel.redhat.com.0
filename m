Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C77100D9
	for <lists+cluster-devel@lfdr.de>; Thu, 25 May 2023 00:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684967006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6a4TWuzTGi7+tMMLrCXx2xS2HLm+fpIBXBWX9SQFhJc=;
	b=J7zHzxJ6Thcuju8cURpC+JC+V0jzCa0D51Abg8U6UqotaW2t8oEXVuBmz7SG2Z3pFYzyRC
	+du9tcbVv0aY+CJIZP5fTbf+UGrNTpdBV/r8KN+1aJWy0zpbh+KgqNCUU7GHpiTo/kea75
	1XVJUheFEuP/ZZ+zPTTeZRDTkXTmScY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-vw8tDW17M5uH5v_aJv1n_Q-1; Wed, 24 May 2023 18:23:21 -0400
X-MC-Unique: vw8tDW17M5uH5v_aJv1n_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D386F3C025B7;
	Wed, 24 May 2023 22:23:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD082407DEC6;
	Wed, 24 May 2023 22:23:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 843BA19465B3;
	Wed, 24 May 2023 22:23:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 342C319465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 22:23:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF92B140E961; Wed, 24 May 2023 22:23:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D77B7140E95D
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 22:23:17 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC65D800969
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 22:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-ZHrD2GN1ON2GucGq9I471A-1; Wed, 24 May 2023 18:23:14 -0400
X-MC-Unique: ZHrD2GN1ON2GucGq9I471A-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1q1wsv-00EnXL-1n; Wed, 24 May 2023 22:23:09 +0000
Date: Wed, 24 May 2023 15:23:09 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Daniel Gomez <da.gomez@samsung.com>,
 Pankaj Raghav <p.raghav@samsung.com>, Ming Lei <ming.lei@redhat.com>
Message-ID: <ZG6OTWckNlz+P+mo@bombadil.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-15-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230424054926.26927-15-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 14/17] block: open code
 __generic_file_write_iter for blkdev writes
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2023 at 07:49:23AM +0200, Christoph Hellwig wrote:
> Open code __generic_file_write_iter to remove the indirect call into
> ->direct_IO and to prepare using the iomap based write code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/fops.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/block/fops.c b/block/fops.c
> index b670aa7c5bb745..fd510b6142bd57 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -508,6 +508,29 @@ static int blkdev_close(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> +static ssize_t
> +blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
> +{
> +	size_t count = iov_iter_count(from);
> +	ssize_t written;
> +
> +	written = kiocb_invalidate_pages(iocb, count);
> +	if (written) {
> +		if (written == -EBUSY)
> +			return 0;
> +		return written;
> +	}
> +
> +	written = blkdev_direct_IO(iocb, from);
> +	if (written > 0) {
> +		kiocb_invalidate_post_write(iocb, count);
> +		iocb->ki_pos += written;
> +	}

Written can be negative here after blkdev_direct_IO()

> +	if (written != -EIOCBQUEUED)
> +		iov_iter_revert(from, count - written - iov_iter_count(from));

And we'll then use it here on iov_iter_revert() and this can crash on
with some values. For example this can crash on a 4k write attempt
on a 32k drive when experimenting wit large block sizes.

kernel BUG at lib/iov_iter.c:999!
invalid opcode: 0000 [#1] PREEMPT SMP PTI
CPU: 4 PID: 949 Comm: fio Not tainted 6.3.0-large-block-20230426-dirty#28
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.0-debian-1.16.0-5        04/01/2014
+RIP: 0010:iov_iter_revert.part.0+0x16e/0x170
Code: f9 40 a2 63 af 74 07 03 56 08 89 d8 29 d0 89 45 08 44 89 6d 20
<etc>
RSP: 0018:ffffaa52006cfc60 EFLAGS: 00010246
RAX: 0000000000000016 RBX: 0000000000000016 RCX: 0000000000000000
RDX: 0000000000000004 RSI: 0000000000000006 RDI: ffffaa52006cfd08
RBP: ffffaa52006cfd08 R08: 0000000000000000 R09: ffffaa52006cfb40
R10: 0000000000000003 R11: ffffffffafcc21e8 R12: 0000000000004000
R13: 0000000000003fea R14: ffff9de3d7565e00 R15: ffff9de3c1f68600
FS:  00007f8bfe726c40(0000) GS:ffff9de43bd00000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8bf5eadd68 CR3: 0000000102c76001 CR4: 0000000000770ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <TASK>
blkdev_direct_write+0xf0/0x160
blkdev_write_iter+0x11b/0x230
io_write+0x10c/0x420
? kmem_cache_alloc_bulk+0x2a1/0x410
? fget+0x79/0xb0
io_issue_sqe+0x60/0x3b0
? io_prep_rw+0x5a/0x190
io_submit_sqes+0x1e6/0x640
__do_sys_io_uring_enter+0x54c/0xb90
? handle_mm_fault+0x9a/0x340
? preempt_count_add+0x47/0xa0
? up_read+0x37/0x70
? do_user_addr_fault+0x27c/0x780
do_syscall_64+0x37/0x90
entry_SYSCALL_64_after_hw

Although I fixed it with an early check on this routine
with:

if (count < bdev_logical_block_size(bdev))
	return -EINVAL; 

I think this can just be fixed by also using the alignment
check earier here:

if (blkdev_dio_unaligned(bdev, pos, iter))                               
	return -EINVAL;  

  Luis

