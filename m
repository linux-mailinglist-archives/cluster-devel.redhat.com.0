Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABE024A4A4
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Aug 2020 19:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597857062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kCjAeSZUAqn8qvs3N4A0B3ylPDJqa7CyO151ud3VrF4=;
	b=JzAHkcEM7CR4yBpOiHSNfqSW110zqYJWtNlxmL8+SvQGLyIfonKyh3JqkO9fTRa5Iw1oGR
	5ZPaB+TcEyl3g74rGMPhMcsmaFjrhCl3yu0arzFvJOqe1rOW3ZTlVxUm2/jZNjCR+Ije53
	t+508Uf50eQSOETkXuB2VWH7DCdCo/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-EPb1an8mOPa7rfW9QyR4RA-1; Wed, 19 Aug 2020 13:11:00 -0400
X-MC-Unique: EPb1an8mOPa7rfW9QyR4RA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0344618B9ED1;
	Wed, 19 Aug 2020 17:10:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D751074E08;
	Wed, 19 Aug 2020 17:10:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74A7560376;
	Wed, 19 Aug 2020 17:10:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JH7Tcm016797 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 13:07:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB9E62639D; Wed, 19 Aug 2020 17:07:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F27D12635E;
	Wed, 19 Aug 2020 17:07:26 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E983F662A1;
	Wed, 19 Aug 2020 17:07:26 +0000 (UTC)
Date: Wed, 19 Aug 2020 13:07:26 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Abhi Das <adas@redhat.com>
Message-ID: <165825613.12780098.1597856846775.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200813200114.5665-2-adas@redhat.com>
References: <20200813200114.5665-1-adas@redhat.com>
	<20200813200114.5665-2-adas@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.97, 10.4.195.20]
Thread-Topic: gfs2: Don't write updates to local statfs file
Thread-Index: v+gnkzyoxGGoRxkjmnd/4WYfJKf+uQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 1/3] gfs2: Don't write updates to
	local	statfs file
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> We store the local statfs info in the journal header now so
> there's no need to write to the local statfs file anymore.
> 
> Signed-off-by: Abhi Das <adas@redhat.com>
> ---
>  fs/gfs2/lops.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index cb2a11b458c6..53d2dbf6605e 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -104,7 +104,15 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, struct
> buffer_head *bh,
>  	BUG_ON(!buffer_pinned(bh));
>  
>  	lock_buffer(bh);
> -	mark_buffer_dirty(bh);
> +	/*
> +	 * We want to eliminate the local statfs file eventually.
> +	 * But, for now, we're simply not going to update it by
> +	 * never marking its buffers dirty
> +	 */
> +	if (!(bd->bd_gl->gl_name.ln_type == LM_TYPE_INODE &&
> +	      bd->bd_gl->gl_object == GFS2_I(sdp->sd_sc_inode)))
> +		mark_buffer_dirty(bh);
> +
>  	clear_buffer_pinned(bh);
>  
>  	if (buffer_is_rgrp(bd))
> --
> 2.20.1

Hi,

This seems dangerous to me. It can only get to gfs2_unpin by trying to
commit buffers for a transaction. If the buffers aren't marked dirty,
that means transactions will be queued to the ail1 list that won't be
fully written. So what happens to them? Do they eventually get freed?

I'm also concerned about a potential impact to performance, since
gfs2_unpin gets called with every metadata buffer that's used.
The additional if checks may not costs us much time-wise, but it's a
pretty hot function.

Can't we accomplish the same thing by making function update_statfs()
never add the buffers to the transaction in the first place?
IOW, by just removing the line:
	gfs2_trans_add_meta(m_ip->i_gl, m_bh);
That way we don't need to worry about its buffer getting pinned,
unpinned and queued to the ail.

Regards,

Bob Peterson

