Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE1A3D4A63
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 23:57:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-5VEYWasENhi3pTRPkTkGHg-1; Sat, 24 Jul 2021 17:57:47 -0400
X-MC-Unique: 5VEYWasENhi3pTRPkTkGHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8385107ACF5;
	Sat, 24 Jul 2021 21:57:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE1215B826;
	Sat, 24 Jul 2021 21:57:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5341D4BB7B;
	Sat, 24 Jul 2021 21:57:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OLveKu031520 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 17:57:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D77C6E1DD; Sat, 24 Jul 2021 21:57:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 986EF6E1CD
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 21:57:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5089F8309DD
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 21:57:37 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-75-NYmClPfhNiySVUXdEi3vGg-1; Sat, 24 Jul 2021 17:57:35 -0400
X-MC-Unique: NYmClPfhNiySVUXdEi3vGg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1m7PeC-003gMt-NK; Sat, 24 Jul 2021 21:57:28 +0000
Date: Sat, 24 Jul 2021 21:57:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YPyMyPCpZKGlfAGk@zeniv-ca.linux.org.uk>
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
	<YPx28cEvrVl6YrDk@zeniv-ca.linux.org.uk>
	<CAHc6FU5nGRn1_oc-8rSOCPfkasWknH1Wb3FeeQYP29zb_5fFGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU5nGRn1_oc-8rSOCPfkasWknH1Wb3FeeQYP29zb_5fFGQ@mail.gmail.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
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

On Sat, Jul 24, 2021 at 11:38:20PM +0200, Andreas Gruenbacher wrote:

> Hmm, how could we have sub-page failure areas when this is about if
> and how pages are mapped? If we return the number of bytes that are
> accessible, then users will know if they got nothing, something, or
> everything, and they can act accordingly.

What I'm saying is that in situation when you have cacheline-sized
poisoned areas, there's no way to get an accurate count of readable
area other than try and copy it out.

What's more, "something" is essentially useless information - the
pages might get unmapped right as your function returns; the caller
still needs to deal with partial copies.  And that's a slow path
by definition, so informing them of a partial fault-in is not
going to be useful.

As far as callers are concerned, it's "nothing suitable in the
beginning of the area" vs. "something might be accessible".

