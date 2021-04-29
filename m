Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F61F36EB2C
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Apr 2021 15:09:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-bD8rop0sM3GJnLHE76vJ7w-1; Thu, 29 Apr 2021 09:09:47 -0400
X-MC-Unique: bD8rop0sM3GJnLHE76vJ7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED653C7418;
	Thu, 29 Apr 2021 13:09:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8C85DEAD;
	Thu, 29 Apr 2021 13:09:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97D2155341;
	Thu, 29 Apr 2021 13:09:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13TD9WMp026041 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Apr 2021 09:09:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCD8561D2D; Thu, 29 Apr 2021 13:09:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast05.extmail.prod.ext.phx2.redhat.com [10.5.110.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D621261D31
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 13:09:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1294D803F46
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 13:09:29 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
	(out30-57.freemail.mail.aliyun.com [115.124.30.57]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-397-wUnodsZsPzSF9JffLFEZ7w-1;
	Thu, 29 Apr 2021 09:09:26 -0400
X-MC-Unique: wUnodsZsPzSF9JffLFEZ7w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=joseph.qi@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UXAmpys_1619701762
Received: from B-D1K7ML85-0059.local(mailfrom:joseph.qi@linux.alibaba.com
	fp:SMTPD_---0UXAmpys_1619701762) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 29 Apr 2021 21:09:23 +0800
To: Junxiao Bi <junxiao.bi@oracle.com>, ocfs2-devel@oss.oracle.com,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	akpm <akpm@linux-foundation.org>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<20210426220552.45413-2-junxiao.bi@oracle.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
Message-ID: <3e75d19c-7c9e-c86f-dddf-ae1062811655@linux.alibaba.com>
Date: Thu, 29 Apr 2021 21:09:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210426220552.45413-2-junxiao.bi@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [Ocfs2-devel] [PATCH 2/3] ocfs2: allow writing
 back pages out of inode size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/27/21 6:05 AM, Junxiao Bi wrote:
> When fallocate/truncate extend inode size, if the original isize is in
> the middle of last cluster, then the part from isize to the end of the
> cluster needs to be zeroed with buffer write, at that time isize is not
> yet updated to match the new size, if writeback is kicked in, it will
> invoke ocfs2_writepage()->block_write_full_page() where the pages out
> of inode size will be dropped. That will cause file corruption.
> 
> Running the following command with qemu-image 4.2.1 can get a corrupted
> coverted image file easily.
> 
>     qemu-img convert -p -t none -T none -f qcow2 $qcow_image \
>              -O qcow2 -o compat=1.1 $qcow_image.conv
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>

Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/aops.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
> index ad20403b383f..7a3e3d59f6a9 100644
> --- a/fs/ocfs2/aops.c
> +++ b/fs/ocfs2/aops.c
> @@ -402,11 +402,28 @@ static void ocfs2_readahead(struct readahead_control *rac)
>   */
>  static int ocfs2_writepage(struct page *page, struct writeback_control *wbc)
>  {
> +	struct inode * const inode = page->mapping->host;
> +	loff_t i_size = i_size_read(inode);
> +	const pgoff_t end_index = i_size >> PAGE_SHIFT;
> +	unsigned int offset;
> +
>  	trace_ocfs2_writepage(
>  		(unsigned long long)OCFS2_I(page->mapping->host)->ip_blkno,
>  		page->index);
>  
> -	return block_write_full_page(page, ocfs2_get_block, wbc);
> +	/*
> +	 * The page straddles i_size.  It must be zeroed out on each and every
> +	 * writepage invocation because it may be mmapped.  "A file is mapped
> +	 * in multiples of the page size.  For a file that is not a multiple of
> +	 * the  page size, the remaining memory is zeroed when mapped, and
> +	 * writes to that region are not written out to the file."
> +	 */
> +	offset = i_size & (PAGE_SIZE-1);
> +	if (page->index == end_index && offset)
> +		zero_user_segment(page, offset, PAGE_SIZE);
> +
> +	return __block_write_full_page_eof(inode, page, ocfs2_get_block, wbc,
> +			end_buffer_async_write, true);
>  }
>  
>  /* Taken from ext3. We don't necessarily need the full blown
> 

