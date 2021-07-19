Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D52EA3CEC3E
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 22:18:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-fPqd3BFNOJyyI5wHu49FjA-1; Mon, 19 Jul 2021 16:17:58 -0400
X-MC-Unique: fPqd3BFNOJyyI5wHu49FjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48253802E6D;
	Mon, 19 Jul 2021 20:17:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3603D60CA0;
	Mon, 19 Jul 2021 20:17:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3B004EA29;
	Mon, 19 Jul 2021 20:17:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JKHquC019355 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 16:17:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2ACD410087FD; Mon, 19 Jul 2021 20:17:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2694910F8E3D
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 20:17:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A1618037A4
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 20:17:48 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-267-tqfNoqiNOfmQhKXy0fwTLA-1; Mon, 19 Jul 2021 16:17:43 -0400
X-MC-Unique: tqfNoqiNOfmQhKXy0fwTLA-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1m5Zhu-0027kw-64; Mon, 19 Jul 2021 20:17:42 +0000
Date: Mon, 19 Jul 2021 20:17:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YPXd5gKCjhr3thJ/@zeniv-ca.linux.org.uk>
References: <20210718223932.2703330-1-agruenba@redhat.com>
	<20210718223932.2703330-6-agruenba@redhat.com>
	<CAHk-=wh3p41a-=7FFf36sYBQP750ys6CKi0S7JNiCSatY5-7og@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh3p41a-=7FFf36sYBQP750ys6CKi0S7JNiCSatY5-7og@mail.gmail.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v2 5/6] iov_iter: Introduce
	ITER_FLAG_FAST_ONLY flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 12:29:35PM -0700, Linus Torvalds wrote:
> On Sun, Jul 18, 2021 at 3:40 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Introduce a new ITER_FLAG_FAST_ONLY flag
> 
> I think the code is fine, but I think it might be best to call this
> "ITER_FLAG_NOIO" or something like that.
> 
> The "FAST_ONLY" name makes sense in the context of
> "get_user_pages_fast()" where we have that "fast" naming (and the long
> history too). But I don't think it makes much sense as a name in the
> context of iov_iter.

This code has never been tested with current lib/iov_iter.c as it is
in mainline.  Or had been in -next during the last cycle.  It won't
apply at all.

Sure, I can try to port that series over to the current mainline, but
I'd rather see that done (and tested) by the series author...

