Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 914073CEDDD
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 22:41:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-rPi1c6ViP8SWbGyZsacCdw-1; Mon, 19 Jul 2021 16:41:42 -0400
X-MC-Unique: rPi1c6ViP8SWbGyZsacCdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15ADD9126D;
	Mon, 19 Jul 2021 20:41:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A115C1C5;
	Mon, 19 Jul 2021 20:41:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D98701809C99;
	Mon, 19 Jul 2021 20:41:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JKe4k6021197 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 16:40:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DB6B2142F51; Mon, 19 Jul 2021 20:40:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3847E2142F4F
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 20:40:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 287F018A6580
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 20:40:01 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-68-0Umj2lGHNgWpPjVxJKIWBQ-1; Mon, 19 Jul 2021 16:39:58 -0400
X-MC-Unique: 0Umj2lGHNgWpPjVxJKIWBQ-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1m5Zee-0027j9-PG; Mon, 19 Jul 2021 20:14:20 +0000
Date: Mon, 19 Jul 2021 20:14:20 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YPXdHGAH7FbXnAj6@zeniv-ca.linux.org.uk>
References: <20210718223932.2703330-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210718223932.2703330-1-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v2 0/6] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 12:39:26AM +0200, Andreas Gruenbacher wrote:
> Hi Linus et al.,
> 
> here's an update to the gfs2 mmap + page faults fix that implements
> Linus's suggestion of disabling page faults while we're holding the
> inode glock.
> 
> This passes fstests except for test generic/095, which fails due to an
> independent bug in the iov_iter code.  I'm currently trying to get
> initial feedback from Al and Christoph on that.
> 
> Any feedback would be welcome.

What tree is that against?  Because in mainline your #5 sure as hell
won't apply...

There uio.h has
enum iter_type {
        /* iter types */
        ITER_IOVEC,
        ITER_KVEC,
        ITER_BVEC,
        ITER_PIPE,
        ITER_XARRAY,
        ITER_DISCARD,
};

and your series assumes

enum iter_type {
        /* iter types */
        ITER_IOVEC = 4,
        ITER_KVEC = 8,
        ITER_BVEC = 16,
        ITER_PIPE = 32,
        ITER_DISCARD = 64,
};

What had that been tested with?

