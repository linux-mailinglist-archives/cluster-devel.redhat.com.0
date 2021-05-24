Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F69638E26D
	for <lists+cluster-devel@lfdr.de>; Mon, 24 May 2021 10:39:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-rWbgtsHEOa-69DRuDL3FjA-1; Mon, 24 May 2021 04:39:43 -0400
X-MC-Unique: rWbgtsHEOa-69DRuDL3FjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74EEA106BAE4;
	Mon, 24 May 2021 08:39:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 258A86E71A;
	Mon, 24 May 2021 08:39:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 071191800FFC;
	Mon, 24 May 2021 08:39:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14O8dSFC017788 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 May 2021 04:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7590111143F; Mon, 24 May 2021 08:39:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0F6C1111443
	for <cluster-devel@redhat.com>; Mon, 24 May 2021 08:39:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71AD7196F581
	for <cluster-devel@redhat.com>; Mon, 24 May 2021 08:39:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-11-cjPMVnHsMtO0m2Ai756omA-1;
	Mon, 24 May 2021 04:39:21 -0400
X-MC-Unique: cjPMVnHsMtO0m2Ai756omA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8720BABB1;
	Mon, 24 May 2021 08:39:19 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 1DDAD1F2CA2; Mon, 24 May 2021 10:39:19 +0200 (CEST)
Date: Mon, 24 May 2021 10:39:19 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210524083919.GA32705@quack2.suse.cz>
References: <20210520122536.1596602-1-agruenba@redhat.com>
	<20210520122536.1596602-7-agruenba@redhat.com>
	<20210520133015.GC18952@quack2.suse.cz>
	<CAHc6FU7ESASp+G59d218LekK8+YMBvH9GxbPr-qOVBhzyVmq4Q@mail.gmail.com>
	<20210521152352.GQ18952@quack2.suse.cz>
	<CAHc6FU6df7cBbjmYOZE35v_FALWRO62cYjg2Y9rY+Hd6x5yeyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6df7cBbjmYOZE35v_FALWRO62cYjg2Y9rY+Hd6x5yeyw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jan Kara <jack@suse.cz>, cluster-devel <cluster-devel@redhat.com>,
	Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
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

On Fri 21-05-21 17:46:04, Andreas Gruenbacher wrote:
> On Fri, May 21, 2021 at 5:23 PM Jan Kara <jack@suse.cz> wrote:
> > On Thu 20-05-21 16:07:56, Andreas Gruenbacher wrote:
> > > > So you probably need to add a new VM_FAULT_
> > > > return code that will behave like VM_FAULT_SIGBUS except it will not raise
> > > > the signal.
> > >
> > > A new VM_FAULT_* flag might make the code easier to read, but I don't
> > > know if we can have one.
> >
> > Well, this is kernel-internal API and there's still plenty of space in
> > vm_fault_reason.
> 
> That's in the context of the page fault. The other issue is how to
> propagate that out through iov_iter_fault_in_readable ->
> fault_in_pages_readable -> __get_user, for example. I don't think
> there's much of a chance to get an additional error code out of
> __get_user and __put_user.

Yes, at that level we'd get EFAULT as in any other case. Really the only
difference of the new VM_FAULT_ error code from a case of "standard" error
and VM_FAULT_SIGBUS would be not raising the signal.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

