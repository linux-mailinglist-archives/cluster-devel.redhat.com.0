Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BE78C0A3
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kzCYK+m1dXoYq1GdX9wRq/xLcjMjzBwHZbogX1zaiXI=;
	b=LA94fdk+gLS3V88vIIeQthHQPu+IQiglpHg8BIoyno28/mN4O7tbOXSqSzOZZH4R/OqL/A
	QTUuJekMe6Ni5HPGWVC1XkBFLRuOpFOF/+3khmjIeaWgKhFuC9CJlEkj3JThGH/sl/+iQm
	ezlaf7Who3X3mMWq70KYEvcGK27mCyw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-Z3hVOpr1OXK69_ZmQvFaxw-1; Tue, 29 Aug 2023 04:41:16 -0400
X-MC-Unique: Z3hVOpr1OXK69_ZmQvFaxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E681D100813A;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAFC540C2070;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5B381946588;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 83F681946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 07:42:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 694BC9A; Tue, 29 Aug 2023 07:42:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62A676B292
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 07:42:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44E17101A53C
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 07:42:07 +0000 (UTC)
Received: from out-242.mta1.migadu.com (out-242.mta1.migadu.com
 [95.215.58.242]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-1xFplw30MLyfzO6PDP0ryQ-1; Tue, 29 Aug 2023 03:42:04 -0400
X-MC-Unique: 1xFplw30MLyfzO6PDP0ryQ-1
Message-ID: <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
Date: Tue, 29 Aug 2023 15:41:43 +0800
MIME-Version: 1.0
To: Matthew Wilcox <willy@infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
 <ZOu1xYS6LRmPgEiV@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
In-Reply-To: <ZOu1xYS6LRmPgEiV@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: Re: [Cluster-devel] [PATCH 02/11] xfs: add NOWAIT semantics for
 readdir
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/23 04:44, Matthew Wilcox wrote:
> On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote:
>> +++ b/fs/xfs/libxfs/xfs_da_btree.c
>> @@ -2643,16 +2643,32 @@ xfs_da_read_buf(
>>   	struct xfs_buf_map	map, *mapp = &map;
>>   	int			nmap = 1;
>>   	int			error;
>> +	int			buf_flags = 0;
>>   
>>   	*bpp = NULL;
>>   	error = xfs_dabuf_map(dp, bno, flags, whichfork, &mapp, &nmap);
>>   	if (error || !nmap)
>>   		goto out_free;
>>   
>> +	/*
>> +	 * NOWAIT semantics mean we don't wait on the buffer lock nor do we
>> +	 * issue IO for this buffer if it is not already in memory. Caller will
>> +	 * retry. This will return -EAGAIN if the buffer is in memory and cannot
>> +	 * be locked, and no buffer and no error if it isn't in memory.  We
>> +	 * translate both of those into a return state of -EAGAIN and *bpp =
>> +	 * NULL.
>> +	 */
> 
> I would not include this comment.

No strong comment here, since this patch is mostly from Dave, it's
better if Dave can ack this.

> 
>> +	if (flags & XFS_DABUF_NOWAIT)
>> +		buf_flags |= XBF_TRYLOCK | XBF_INCORE;
>>   	error = xfs_trans_read_buf_map(mp, tp, mp->m_ddev_targp, mapp, nmap, 0,
>>   			&bp, ops);
> 
> what tsting did you do with this?  Because you don't actually _use_
> buf_flags anywhere in this patch (presumably they should be the
> sixth argument to xfs_trans_read_buf_map() instead of 0).  So I can only
> conclude that either you didn't test, or your testing was inadequate.
> 


The tests I've done are listed in the cover-letter, this one is missed, 
the tricky place is it's hard to get this kind of mistake since it runs
well without nowait logic...I'll fix it in next version.

>>   	if (error)
>>   		goto out_free;
>> +	if (!bp) {
>> +		ASSERT(flags & XFS_DABUF_NOWAIT);
> 
> I don't think this ASSERT is appropriate.
> 
>> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>>   				bp = NULL;
>>   			}
>>   
>> -			if (*lock_mode == 0)
>> -				*lock_mode = xfs_ilock_data_map_shared(dp);
>> +			if (*lock_mode == 0) {
>> +				*lock_mode =
>> +					xfs_ilock_data_map_shared_generic(dp,
>> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
>> +				if (!*lock_mode) {
>> +					error = -EAGAIN;
>> +					break;
>> +				}
>> +			}
> 
> 'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
> And this is far too far indented.
> 
> 			xfs_dir2_lock(dp, ctx, lock_mode);
> 
> with:
> 
> STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
> 		unsigned int lock_mode)
> {
> 	if (*lock_mode)
> 		return;
> 	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> 		return xfs_ilock_data_map_shared_nowait(dp);
> 	return xfs_ilock_data_map_shared(dp);
> }
> 
> ... which I think you can use elsewhere in this patch (reformat it to
> XFS coding style, of course).  And then you don't need
> xfs_ilock_data_map_shared_generic().
> 

How about rename xfs_ilock_data_map_shared() to 
xfs_ilock_data_map_block() and rename 
xfs_ilock_data_map_shared_generic() to xfs_ilock_data_map_shared()?

STATIC void xfs_ilock_data_map_shared(struct xfs_inode *dp, struct 
dir_context *ctx, unsigned int lock_mode)
{
  	if (*lock_mode)
  		return;
  	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
  		return xfs_ilock_data_map_shared_nowait(dp);
  	return xfs_ilock_data_map_shared_block(dp);
}


