Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A2A43501B
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Oct 2021 18:26:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-6YOj_Kx9MQG0VJ_mOm4YrQ-1; Wed, 20 Oct 2021 12:25:56 -0400
X-MC-Unique: 6YOj_Kx9MQG0VJ_mOm4YrQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E2ED1927802;
	Wed, 20 Oct 2021 16:25:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B526C5BB0D;
	Wed, 20 Oct 2021 16:25:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D025D4EA2A;
	Wed, 20 Oct 2021 16:25:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KGPhar017874 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 12:25:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C65F517458; Wed, 20 Oct 2021 16:25:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1445568F3
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 16:25:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEF47811E78
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 16:25:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-440-X4X6bsCXNZaCtudufEV45g-1;
	Wed, 20 Oct 2021 12:25:36 -0400
X-MC-Unique: X4X6bsCXNZaCtudufEV45g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5849611F2;
	Wed, 20 Oct 2021 16:25:27 +0000 (UTC)
Date: Wed, 20 Oct 2021 17:25:24 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YXBC9LRwhgFCHqJA@arm.com>
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<20211019134204.3382645-6-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019134204.3382645-6-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 05/17] iov_iter: Introduce
	fault_in_iov_iter_writeable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 19, 2021 at 03:41:52PM +0200, Andreas Gruenbacher wrote:
> diff --git a/mm/gup.c b/mm/gup.c
> index a7efb027d6cf..614b8536b3b6 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1691,6 +1691,69 @@ size_t fault_in_writeable(char __user *uaddr, size_t size)
>  }
>  EXPORT_SYMBOL(fault_in_writeable);
>  
> +/*
> + * fault_in_safe_writeable - fault in an address range for writing
> + * @uaddr: start of address range
> + * @size: length of address range
> + *
> + * Faults in an address range using get_user_pages, i.e., without triggering
> + * hardware page faults.  This is primarily useful when we already know that
> + * some or all of the pages in the address range aren't in memory.
> + *
> + * Other than fault_in_writeable(), this function is non-destructive.
> + *
> + * Note that we don't pin or otherwise hold the pages referenced that we fault
> + * in.  There's no guarantee that they'll stay in memory for any duration of
> + * time.
> + *
> + * Returns the number of bytes not faulted in, like copy_to_user() and
> + * copy_from_user().
> + */
> +size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
> +{
> +	unsigned long start = (unsigned long)uaddr;
> +	unsigned long end, nstart, nend;
> +	struct mm_struct *mm = current->mm;
> +	struct vm_area_struct *vma = NULL;

For arm64 tagged addresses we need the diff below, otherwise the
subsequent find_vma() will fail:

diff --git a/mm/gup.c b/mm/gup.c
index f5f362cb4640..2c51e9748a6a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1713,7 +1713,7 @@ EXPORT_SYMBOL(fault_in_writeable);
  */
 size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
 {
-	unsigned long start = (unsigned long)uaddr;
+	unsigned long start = (unsigned long)untagged_addr(uaddr);
 	unsigned long end, nstart, nend;
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma = NULL;

-- 
Catalin

