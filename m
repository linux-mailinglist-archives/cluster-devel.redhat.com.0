Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DDA3C3F9FD9
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 21:18:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-5YFoH4WPMB2_-0KSfA0-ig-1; Fri, 27 Aug 2021 15:18:38 -0400
X-MC-Unique: 5YFoH4WPMB2_-0KSfA0-ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4FFF802C80;
	Fri, 27 Aug 2021 19:18:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C59B81ACC7;
	Fri, 27 Aug 2021 19:18:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89B4D181A0F1;
	Fri, 27 Aug 2021 19:18:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RJIY2G017811 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 15:18:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3AEE521623A0; Fri, 27 Aug 2021 19:18:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 357262162390
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:18:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F71E811E78
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:18:30 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-217-H1iPfY3OMNu_gve-dLymZg-1; Fri, 27 Aug 2021 15:18:28 -0400
X-MC-Unique: H1iPfY3OMNu_gve-dLymZg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mJhKn-00GZbg-UX; Fri, 27 Aug 2021 19:16:13 +0000
Date: Fri, 27 Aug 2021 19:16:13 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YSk5/ebFimHTmIYn@zeniv-ca.linux.org.uk>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-5-agruenba@redhat.com>
	<YSk0pAWx7xO/39A6@zeniv-ca.linux.org.uk>
	<CAHk-=wj8Q6PtnQqamACJU1TWpT4+nr2+YGhVwMTuU=-NJEm5Rg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wj8Q6PtnQqamACJU1TWpT4+nr2+YGhVwMTuU=-NJEm5Rg@mail.gmail.com>
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
Subject: Re: [Cluster-devel] [PATCH v7 04/19] iov_iter: Turn
 iov_iter_fault_in_readable into fault_in_iov_iter_readable
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

On Fri, Aug 27, 2021 at 11:57:19AM -0700, Linus Torvalds wrote:
> On Fri, Aug 27, 2021 at 11:53 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > I really disagree with these calling conventions.  "Number not faulted in"
> > is bloody useless
> 
> It's what we already have for copy_to/from_user(), so it's actually
> consistent with that.

After copy_to/copy_from you've got the data copied and it's not going
anywhere.  After fault-in you still have to copy, and it still can give
you less data than fault-in had succeeded for.  So you must handle short
copies separately, no matter how much you've got from fault-in.

> And it avoids changing all the existing tests where people really
> cared only about the "everything ok" case.

The thing is, the checks tend to be wrong.  We can't rely upon the full
fault-in to expect the full copy-in/copy-out, so the checks downstream
are impossible to avoid anyway.  And fault-in failure is always a slow
path, so we are not saving time here.

And for the memory poisoining we end up aborting a copy potentially
a lot earlier than we should.

> Andreas' first patch did that changed version, and was ugly as hell.
> 
> But if you have a version that avoids the ugliness...

I'll need to dig my notes out...

