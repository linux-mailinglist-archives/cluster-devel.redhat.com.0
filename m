Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DBC443D49CF
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 22:24:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-WcVVPfb4MYq4XCjmDMdGSQ-1; Sat, 24 Jul 2021 16:24:30 -0400
X-MC-Unique: WcVVPfb4MYq4XCjmDMdGSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD2C363A4;
	Sat, 24 Jul 2021 20:24:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93BEF6E6EA;
	Sat, 24 Jul 2021 20:24:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3ACB34BB7C;
	Sat, 24 Jul 2021 20:24:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OKOPVG022064 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 16:24:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6295E2156897; Sat, 24 Jul 2021 20:24:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E2FB2156896
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 20:24:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04813101A52C
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 20:24:23 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-284-S0h46PqUPsCJrIP5wnptMw-1; Sat, 24 Jul 2021 16:24:20 -0400
X-MC-Unique: S0h46PqUPsCJrIP5wnptMw-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1m7OC1-003eaC-FU; Sat, 24 Jul 2021 20:24:17 +0000
Date: Sat, 24 Jul 2021 20:24:17 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YPx28cEvrVl6YrDk@zeniv-ca.linux.org.uk>
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v4 1/8] iov_iter: Introduce
 iov_iter_fault_in_writeable helper
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

On Sat, Jul 24, 2021 at 12:52:34PM -0700, Linus Torvalds wrote:
> ...
> > +                       if (fault_in_user_pages(start, len, true) != len)
> > +                               return -EFAULT;
> 
> Looking at this once more, I think this is likely wrong.
> 
> Why?
> 
> Because any user can/should only care about at least *part* of the
> area being writable.
> 
> Imagine that you're doing a large read. If the *first* page is
> writable, you should still return the partial read, not -EFAULT.

Agreed.

> So I think the code needs to return 0 if _any_ fault was successful.

s/any/the first/...

The same goes for fault-in for read, of course; I've a half-baked conversion
to such semantics (-EFAULT vs. 0; precise length is unreliable anyway,
especially if you have sub-page failure areas), need to finish and post
it...

