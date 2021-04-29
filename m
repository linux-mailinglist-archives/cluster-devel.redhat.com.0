Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F078436E9F0
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Apr 2021 14:03:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-PoawuDDkNyOwr4DXMprXhg-1; Thu, 29 Apr 2021 08:03:46 -0400
X-MC-Unique: PoawuDDkNyOwr4DXMprXhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 968DA107DEEA;
	Thu, 29 Apr 2021 12:03:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EA0319103;
	Thu, 29 Apr 2021 12:03:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6F8155346;
	Thu, 29 Apr 2021 12:03:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13TC3aPI019437 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Apr 2021 08:03:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D86CD19C71; Thu, 29 Apr 2021 12:03:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast01.extmail.prod.ext.phx2.redhat.com [10.5.110.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D188419C44
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 12:03:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C0811008060
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 12:03:36 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-316-3igeI_TSOgCE8j-yObvzYg-1;
	Thu, 29 Apr 2021 08:03:34 -0400
X-MC-Unique: 3igeI_TSOgCE8j-yObvzYg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R591e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=joseph.qi@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UXA-IhL_1619697495
Received: from B-D1K7ML85-0059.local(mailfrom:joseph.qi@linux.alibaba.com
	fp:SMTPD_---0UXA-IhL_1619697495) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 29 Apr 2021 19:58:15 +0800
To: Junxiao Bi <junxiao.bi@oracle.com>, ocfs2-devel@oss.oracle.com,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	akpm <akpm@linux-foundation.org>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
Message-ID: <248885ce-6729-dc21-4937-849eb0fe8a45@linux.alibaba.com>
Date: Thu, 29 Apr 2021 19:58:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210426220552.45413-1-junxiao.bi@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [Ocfs2-devel] [PATCH 1/3] fs/buffer.c: add new
 api to allow eof writeback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/27/21 6:05 AM, Junxiao Bi wrote:
> When doing truncate/fallocate for some filesytem like ocfs2, it
> will zero some pages that are out of inode size and then later
> update the inode size, so it needs this api to writeback eof
> pages.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>


Looks good.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/buffer.c                 | 14 +++++++++++---
>  include/linux/buffer_head.h |  3 +++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 0cb7ffd4977c..802f0bacdbde 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -1709,9 +1709,9 @@ static struct buffer_head *create_page_buffers(struct page *page, struct inode *
>   * WB_SYNC_ALL, the writes are posted using REQ_SYNC; this
>   * causes the writes to be flagged as synchronous writes.
>   */
> -int __block_write_full_page(struct inode *inode, struct page *page,
> +int __block_write_full_page_eof(struct inode *inode, struct page *page,
>  			get_block_t *get_block, struct writeback_control *wbc,
> -			bh_end_io_t *handler)
> +			bh_end_io_t *handler, bool eof_write)
>  {
>  	int err;
>  	sector_t block;
> @@ -1746,7 +1746,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
>  	 * handle any aliases from the underlying blockdev's mapping.
>  	 */
>  	do {
> -		if (block > last_block) {
> +		if (block > last_block && !eof_write) {
>  			/*
>  			 * mapped buffers outside i_size will occur, because
>  			 * this page can be outside i_size when there is a
> @@ -1871,6 +1871,14 @@ int __block_write_full_page(struct inode *inode, struct page *page,
>  	unlock_page(page);
>  	goto done;
>  }
> +EXPORT_SYMBOL(__block_write_full_page_eof);
> +
> +int __block_write_full_page(struct inode *inode, struct page *page,
> +			get_block_t *get_block, struct writeback_control *wbc,
> +			bh_end_io_t *handler)
> +{
> +	return __block_write_full_page_eof(inode, page, get_block, wbc, handler, false);
> +}
>  EXPORT_SYMBOL(__block_write_full_page);
>  
>  /*
> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
> index 6b47f94378c5..5da15a1ba15c 100644
> --- a/include/linux/buffer_head.h
> +++ b/include/linux/buffer_head.h
> @@ -221,6 +221,9 @@ int block_write_full_page(struct page *page, get_block_t *get_block,
>  int __block_write_full_page(struct inode *inode, struct page *page,
>  			get_block_t *get_block, struct writeback_control *wbc,
>  			bh_end_io_t *handler);
> +int __block_write_full_page_eof(struct inode *inode, struct page *page,
> +			get_block_t *get_block, struct writeback_control *wbc,
> +			bh_end_io_t *handler, bool eof_write);
>  int block_read_full_page(struct page*, get_block_t*);
>  int block_is_partially_uptodate(struct page *page, unsigned long from,
>  				unsigned long count);
> 

