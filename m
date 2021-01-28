Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3314B30727F
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Jan 2021 10:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611825708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0BO5gBSGZsxr2tAS5NZPa1cpccnyB9otta+XksD5k50=;
	b=TcOVSTacwz2c1QmRlXiPNVqEBC8uSM3+oFjxrK3hEhIcuZXm2pjEMrS0Q5ADNsHFPYXQdr
	D8u0CWQDHug3xRt3ZVKUqF7atqei9Sn/ofhXm9/s+ryOoJqu6adCpaGm5yC449BQ8e5QrA
	rvbwzJ/UJYnp4eIR3z2+/uVyoFsgtZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-mSLkewJ3NzK9fZ8-5SG8zg-1; Thu, 28 Jan 2021 04:21:46 -0500
X-MC-Unique: mSLkewJ3NzK9fZ8-5SG8zg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED32810054FF;
	Thu, 28 Jan 2021 09:21:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7566919719;
	Thu, 28 Jan 2021 09:21:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E0884BB40;
	Thu, 28 Jan 2021 09:21:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10S9LbIw020189 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 04:21:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3CFC619D9D; Thu, 28 Jan 2021 09:21:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0362619726;
	Thu, 28 Jan 2021 09:21:29 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com
References: <20210127210746.16958-1-agruenba@redhat.com>
	<20210127210746.16958-9-agruenba@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <da279a0b-8807-1965-7871-926c36828837@redhat.com>
Date: Thu, 28 Jan 2021 09:21:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210127210746.16958-9-agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH v3 08/20] gfs2: Get rid of on-stack
 transactions
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 27/01/2021 21:07, Andreas Gruenbacher wrote:
> On-stack transactions were introduced to work around a transaction glock
> deadlock in gfs2_trans_begin in commit d8348de06f70 ("GFS2: Fix deadlock
> on journal flush").  Subsequently, transaction glocks were eliminated in
> favor of the more efficient freeze glocks in commit 24972557b12c ("GFS2:
> remove transaction glock") without also removing the on-stack
> transactions.
>
> It has now turned out that committing on-stack transactions
> significantly complicates journal free space accounting when no system
> transaction (sdp->sd_log_tr) is active at the time.  It doesn't seem
> that on-stack transactions provide a significant benefit beyond their
> original purpose (as an optimization), so remove them to allow fixing
> the journal free space accounting in a reasonable way in a subsequent
> patch.
>
> FIXME: Can we better handle a gfs2_trans_begin failure in gfs2_ail_empty_gl?
> If we skip the __gfs2_ail_flush, we'll just end up with leftover items on
> gl_ail_list.

The reason for the on-stack allocation is to avoid the GFP_NOFAIL 
allocation here. Please don't add it back, we have gradually been 
working to eliminate those. Thoes allocations may not fail, but they 
might also take a long enough time that it would make little difference 
if they did. So perhaps we need to look at another solution?

Steve.


>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>   fs/gfs2/glops.c  | 29 +++++++----------------------
>   fs/gfs2/incore.h |  1 -
>   fs/gfs2/log.c    |  1 -
>   fs/gfs2/trans.c  | 25 +++++++++++++------------
>   fs/gfs2/trans.h  |  2 ++
>   5 files changed, 22 insertions(+), 36 deletions(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 3faa421568b0..853e590ccc15 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -84,18 +84,11 @@ static void __gfs2_ail_flush(struct gfs2_glock *gl, bool fsync,
>   
>   static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
>   {
> +	unsigned int revokes = atomic_read(&gl->gl_ail_count);
>   	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
> -	struct gfs2_trans tr;
>   	int ret;
>   
> -	memset(&tr, 0, sizeof(tr));
> -	INIT_LIST_HEAD(&tr.tr_buf);
> -	INIT_LIST_HEAD(&tr.tr_databuf);
> -	INIT_LIST_HEAD(&tr.tr_ail1_list);
> -	INIT_LIST_HEAD(&tr.tr_ail2_list);
> -	tr.tr_revokes = atomic_read(&gl->gl_ail_count);
> -
> -	if (!tr.tr_revokes) {
> +	if (!revokes) {
>   		bool have_revokes;
>   		bool log_in_flight;
>   
> @@ -122,20 +115,12 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
>   		return 0;
>   	}
>   
> -	/* A shortened, inline version of gfs2_trans_begin()
> -         * tr->alloced is not set since the transaction structure is
> -         * on the stack */
> -	tr.tr_reserved = 1 + gfs2_struct2blk(sdp, tr.tr_revokes);
> -	tr.tr_ip = _RET_IP_;
> -	ret = gfs2_log_reserve(sdp, tr.tr_reserved);
> -	if (ret < 0)
> -		return ret;
> -	WARN_ON_ONCE(current->journal_info);
> -	current->journal_info = &tr;
> -
> -	__gfs2_ail_flush(gl, 0, tr.tr_revokes);
> -
> +	ret = __gfs2_trans_begin(sdp, 0, revokes, GFP_NOFS | __GFP_NOFAIL);
> +	if (ret)
> +		goto flush;
> +	__gfs2_ail_flush(gl, 0, revokes);
>   	gfs2_trans_end(sdp);
> +
>   flush:
>   	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
>   		       GFS2_LFC_AIL_EMPTY_GL);
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 8e1ab8ed4abc..958810e533ad 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -490,7 +490,6 @@ struct gfs2_quota_data {
>   enum {
>   	TR_TOUCHED = 1,
>   	TR_ATTACHED = 2,
> -	TR_ALLOCED = 3,
>   };
>   
>   struct gfs2_trans {
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index e4dc23a24569..721d2d7f0efd 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -1114,7 +1114,6 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
>   	if (sdp->sd_log_tr) {
>   		gfs2_merge_trans(sdp, tr);
>   	} else if (tr->tr_num_buf_new || tr->tr_num_databuf_new) {
> -		gfs2_assert_withdraw(sdp, test_bit(TR_ALLOCED, &tr->tr_flags));
>   		sdp->sd_log_tr = tr;
>   		set_bit(TR_ATTACHED, &tr->tr_flags);
>   	}
> diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
> index 7705f04621f4..4f461ab37ced 100644
> --- a/fs/gfs2/trans.c
> +++ b/fs/gfs2/trans.c
> @@ -37,8 +37,8 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
>   		tr->tr_num_revoke, tr->tr_num_revoke_rm);
>   }
>   
> -int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
> -		     unsigned int revokes)
> +int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
> +		       unsigned int revokes, gfp_t gfp_mask)
>   {
>   	struct gfs2_trans *tr;
>   	int error;
> @@ -52,7 +52,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
>   	if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
>   		return -EROFS;
>   
> -	tr = kmem_cache_zalloc(gfs2_trans_cachep, GFP_NOFS);
> +	tr = kmem_cache_zalloc(gfs2_trans_cachep, gfp_mask);
>   	if (!tr)
>   		return -ENOMEM;
>   
> @@ -60,7 +60,6 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
>   	tr->tr_blocks = blocks;
>   	tr->tr_revokes = revokes;
>   	tr->tr_reserved = 1;
> -	set_bit(TR_ALLOCED, &tr->tr_flags);
>   	if (blocks)
>   		tr->tr_reserved += 6 + blocks;
>   	if (revokes)
> @@ -88,20 +87,23 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
>   	return error;
>   }
>   
> +int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
> +		     unsigned int revokes)
> +{
> +	return __gfs2_trans_begin(sdp, blocks, revokes, GFP_NOFS);
> +}
> +
>   void gfs2_trans_end(struct gfs2_sbd *sdp)
>   {
>   	struct gfs2_trans *tr = current->journal_info;
>   	s64 nbuf;
> -	int alloced = test_bit(TR_ALLOCED, &tr->tr_flags);
>   
>   	current->journal_info = NULL;
>   
>   	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
>   		gfs2_log_release(sdp, tr->tr_reserved);
> -		if (alloced) {
> -			gfs2_trans_free(sdp, tr);
> -			sb_end_intwrite(sdp->sd_vfs);
> -		}
> +		gfs2_trans_free(sdp, tr);
> +		sb_end_intwrite(sdp->sd_vfs);
>   		return;
>   	}
>   
> @@ -114,15 +116,14 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
>   		gfs2_print_trans(sdp, tr);
>   
>   	gfs2_log_commit(sdp, tr);
> -	if (alloced && !test_bit(TR_ATTACHED, &tr->tr_flags))
> +	if (!test_bit(TR_ATTACHED, &tr->tr_flags))
>   		gfs2_trans_free(sdp, tr);
>   	up_read(&sdp->sd_log_flush_lock);
>   
>   	if (sdp->sd_vfs->s_flags & SB_SYNCHRONOUS)
>   		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
>   			       GFS2_LFC_TRANS_END);
> -	if (alloced)
> -		sb_end_intwrite(sdp->sd_vfs);
> +	sb_end_intwrite(sdp->sd_vfs);
>   }
>   
>   static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
> diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
> index 83199ce5a5c5..9c732a5f28bf 100644
> --- a/fs/gfs2/trans.h
> +++ b/fs/gfs2/trans.h
> @@ -34,6 +34,8 @@ static inline unsigned int gfs2_rg_blocks(const struct gfs2_inode *ip, unsigned
>   	return rgd->rd_length;
>   }
>   
> +extern int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
> +			      unsigned int revokes, gfp_t gfp_mask);
>   extern int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
>   			    unsigned int revokes);
>   

