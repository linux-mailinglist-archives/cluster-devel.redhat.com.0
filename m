Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB0E53F34CB
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 21:48:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-JiXN8hK6M9-8gUy-S9nbxw-1; Fri, 20 Aug 2021 15:48:43 -0400
X-MC-Unique: JiXN8hK6M9-8gUy-S9nbxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88BD587507C;
	Fri, 20 Aug 2021 19:48:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A62D06A905;
	Fri, 20 Aug 2021 19:48:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F35A181A0F7;
	Fri, 20 Aug 2021 19:48:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KJkIjX017548 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 15:46:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D37A2087465; Fri, 20 Aug 2021 19:46:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F0052087462
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 19:46:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 662BC185A79C
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 19:46:15 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-Ug1sT9j2OH-DBoN-LlO_kw-1; Fri, 20 Aug 2021 15:46:13 -0400
X-MC-Unique: Ug1sT9j2OH-DBoN-LlO_kw-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mHASE-00ESrA-C0; Fri, 20 Aug 2021 19:45:26 +0000
Date: Fri, 20 Aug 2021 19:45:26 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <YSAGVsTOc/Fw0x8l@zeniv-ca.linux.org.uk>
References: <20210820163919.435135-1-jlayton@kernel.org>
	<20210820163919.435135-3-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210820163919.435135-3-jlayton@kernel.org>
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
Cc: bfields@fieldses.org, linux-nfs@vger.kernel.org, david@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	willy@infradead.org, cluster-devel@redhat.com,
	linux-mm@kvack.org, rostedt@goodmis.org, ebiederm@xmission.com,
	luto@kernel.org, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, akpm@linux-foundation.org,
	torvalds@linux-foundation.org, linux-afs@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v3 2/2] fs: remove mandatory file
	locking support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 20, 2021 at 12:39:19PM -0400, Jeff Layton wrote:

> diff --git a/fs/locks.c b/fs/locks.c

> @@ -2857,8 +2744,7 @@ static void lock_get_status(struct seq_file *f, struct file_lock *fl,
>  			seq_puts(f, "POSIX ");
>  
>  		seq_printf(f, " %s ",
> -			     (inode == NULL) ? "*NOINODE*" :
> -			     mandatory_lock(inode) ? "MANDATORY" : "ADVISORY ");
> +			     (inode == NULL) ? "*NOINODE*" : "ADVISORY ");

Huh?

<looks>
        if (fl->fl_file != NULL)
		inode = locks_inode(fl->fl_file);

So basically that's fl->fl_file ? "ADVISORY" : "*NOINODE*"?

How could that trigger, though?  With locks_mandatory_area() gone, I don't
see how FL_POSIX file_lock with NULL ->fl_file could be ever found...
Confused...

Why is locks_copy_conflock() exported (hell, non-static), BTW?

> diff --git a/fs/namespace.c b/fs/namespace.c


> -#ifdef	CONFIG_MANDATORY_FILE_LOCKING
> -static bool may_mandlock(void)
> +static void warn_mandlock(void)
>  {
> -	pr_warn_once("======================================================\n"
> -		     "WARNING: the mand mount option is being deprecated and\n"
> -		     "         will be removed in v5.15!\n"
> -		     "======================================================\n");
> -	return capable(CAP_SYS_ADMIN);
> +	pr_warn_once("=======================================================\n"
> +		     "WARNING: The mand mount option has been deprecated and\n"
> +		     "         and is ignored by this kernel. Remove the mand\n"
> +		     "         option from the mount to silence this warning.\n"
> +		     "=======================================================\n");
>  }
> -#else
> -static inline bool may_mandlock(void)
> -{
> -	pr_warn("VFS: \"mand\" mount option not supported");
> -	return false;
> -}
> -#endif

Is there any point in having the previous patch not folded into this one?

