Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F102037A968
	for <lists+cluster-devel@lfdr.de>; Tue, 11 May 2021 16:34:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-hIiSGOI-MbmnHCK0jJjVTQ-1; Tue, 11 May 2021 10:34:15 -0400
X-MC-Unique: hIiSGOI-MbmnHCK0jJjVTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B3FF80ED8B;
	Tue, 11 May 2021 14:34:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DADFF19C44;
	Tue, 11 May 2021 14:34:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D7481800BB4;
	Tue, 11 May 2021 14:34:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BEYAtQ002389 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 10:34:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4259A105019F; Tue, 11 May 2021 14:34:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DBF511457F7
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 14:34:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 007EB80122D
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 14:34:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-56-uPc7OEvqO-aTlQo2uotlYA-1; Tue, 11 May 2021 10:34:04 -0400
X-MC-Unique: uPc7OEvqO-aTlQo2uotlYA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lgT6C-007LRP-4h; Tue, 11 May 2021 14:11:04 +0000
Date: Tue, 11 May 2021 15:11:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YJqQdKmBHz6oEqD1@casper.infradead.org>
References: <20210511140113.1225981-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511140113.1225981-1-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [Cluster-devel] [PATCH] [RFC] Trigger retry from fault vm
	operation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2021 at 04:01:13PM +0200, Andreas Gruenbacher wrote:
> we have a locking problem in gfs2 that I don't have a proper solution for, so
> I'm looking for suggestions.
> 
> What's happening is that a page fault triggers during a read or write
> operation, while we're holding a glock (the cluster-wide gfs2 inode
> lock), and the page fault requires another glock.  We can recognize and
> handle the case when both glocks are the same, but when the page fault requires
> another glock, there is a chance that taking that other glock would deadlock.

So we're looking at something like one file on a gfs2 filesystem being
mmaped() and then doing read() or write() to another gfs2 file with the
mmaped address being the passed to read()/write()?

Have you looked at iov_iter_fault_in_readable() as a solution to
your locking order?  That way, you bring the mmaped page in first
(see generic_perform_write()).

> When we realize that we may not be able to take the other glock in gfs2_fault,
> we need to communicate that to the read or write operation, which will then
> drop and re-acquire the "outer" glock and retry.  However, there doesn't seem
> to be a good way to do that; we can only indicate that a page fault should fail
> by returning VM_FAULT_SIGBUS or similar; that will then be mapped to -EFAULT.
> We'd need something like VM_FAULT_RESTART that can be mapped to -EBUSY so that
> we can tell the retry case apart from genuine -EFAULT errors.

We do have VM_FAULT_RETRY ... does that retry at the wrong level?

