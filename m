Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A0AD138B01B
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 15:34:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-hRe7KXRBOiyNgJNI8G3rmA-1; Thu, 20 May 2021 09:34:22 -0400
X-MC-Unique: hRe7KXRBOiyNgJNI8G3rmA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E86F107ACE4;
	Thu, 20 May 2021 13:34:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC516062F;
	Thu, 20 May 2021 13:34:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD92C1800BB8;
	Thu, 20 May 2021 13:34:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KDURhQ007073 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 09:30:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A291B20B663E; Thu, 20 May 2021 13:30:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DC0020B664A
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 13:30:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F258E95F355
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 13:30:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-59-Y0itvfeFNaqc3C5PBlcPYA-1;
	Thu, 20 May 2021 09:30:16 -0400
X-MC-Unique: Y0itvfeFNaqc3C5PBlcPYA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6AE25ACAD;
	Thu, 20 May 2021 13:30:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 375151F2C9C; Thu, 20 May 2021 15:30:15 +0200 (CEST)
Date: Thu, 20 May 2021 15:30:15 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210520133015.GC18952@quack2.suse.cz>
References: <20210520122536.1596602-1-agruenba@redhat.com>
	<20210520122536.1596602-7-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520122536.1596602-7-agruenba@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org
Subject: Re: [Cluster-devel] [PATCH 6/6] gfs2: Fix mmap + page fault
	deadlocks (part 2)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 20-05-21 14:25:36, Andreas Gruenbacher wrote:
> Now that we handle self-recursion on the inode glock in gfs2_fault and
> gfs2_page_mkwrite, we need to take care of more complex deadlock
> scenarios like the following (example by Jan Kara):
> 
> Two independent processes P1, P2. Two files F1, F2, and two mappings M1,
> M2 where M1 is a mapping of F1, M2 is a mapping of F2. Now P1 does DIO
> to F1 with M2 as a buffer, P2 does DIO to F2 with M1 as a buffer. They
> can race like:
> 
> P1                                      P2
> read()                                  read()
>   gfs2_file_read_iter()                   gfs2_file_read_iter()
>     gfs2_file_direct_read()                 gfs2_file_direct_read()
>       locks glock of F1                       locks glock of F2
>       iomap_dio_rw()                          iomap_dio_rw()
>         bio_iov_iter_get_pages()                bio_iov_iter_get_pages()
>           <fault in M2>                           <fault in M1>
>             gfs2_fault()                            gfs2_fault()
>               tries to grab glock of F2               tries to grab glock of F1
> 
> Those kinds of scenarios are much harder to reproduce than
> self-recursion.
> 
> We deal with such situations by using the LM_FLAG_OUTER flag to mark
> "outer" glock taking.  Then, when taking an "inner" glock, we use the
> LM_FLAG_TRY flag so that locking attempts that don't immediately succeed
> will be aborted.  In case of a failed locking attempt, we "unroll" to
> where the "outer" glock was taken, drop the "outer" glock, and fault in
> the first offending user page.  This will re-trigger the "inner" locking
> attempt but without the LM_FLAG_TRY flag.  Once that has happened, we
> re-acquire the "outer" glock and retry the original operation.
> 
> Reported-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

...

> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 7d88abb4629b..8b26893f8dc6 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -431,21 +431,30 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
>  	vm_fault_t ret = VM_FAULT_LOCKED;
>  	struct gfs2_holder gh;
>  	unsigned int length;
> +	u16 flags = 0;
>  	loff_t size;
>  	int err;
>  
>  	sb_start_pagefault(inode->i_sb);
>  
> -	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
> +	if (current_holds_glock())
> +		flags |= LM_FLAG_TRY;
> +
> +	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, flags, &gh);
>  	if (likely(!outer_gh)) {
>  		err = gfs2_glock_nq(&gh);
>  		if (err) {
>  			ret = block_page_mkwrite_return(err);
> +			if (err == GLR_TRYFAILED) {
> +				set_current_needs_retry(true);
> +				ret = VM_FAULT_SIGBUS;
> +			}

I've checked to make sure but do_user_addr_fault() indeed calls do_sigbus()
which raises the SIGBUS signal. So if the application does not ignore
SIGBUS, your retry will be visible to the application and can cause all
sorts of interesting results... So you probably need to add a new VM_FAULT_
return code that will behave like VM_FAULT_SIGBUS except it will not raise
the signal.

Otherwise it seems to me your approach should work.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

