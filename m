Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 027D2141A17
	for <lists+cluster-devel@lfdr.de>; Sat, 18 Jan 2020 23:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579387289;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QL1W4Iib7M5xPqeoilXQeWqZz6dIc5oozfkLvMVkZx0=;
	b=h7ivCywAA4QwJaU+P+yN/xCfrwITyJyAPC/c0bTQDt1vUzo7brpaAquIKk4/a2LzlZ5fH8
	BRAv3cnb6GcbPsGEyIzPCr/FNmx0K9vrRm1RzBIlXAT27Kn8XZrG/9+QVRfLk5SWO0nsRB
	a1+CBnCJDHe390bG7tqURSuk1CkVfkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Nwz1Ycq3OS26honB9SxLdw-1; Sat, 18 Jan 2020 17:41:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7344477;
	Sat, 18 Jan 2020 22:41:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 235D084BBB;
	Sat, 18 Jan 2020 22:41:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD29F870A7;
	Sat, 18 Jan 2020 22:41:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00IMfA2X004243 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 18 Jan 2020 17:41:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 42A4B2166B2A; Sat, 18 Jan 2020 22:41:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EC9B2166B29
	for <cluster-devel@redhat.com>; Sat, 18 Jan 2020 22:41:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B0FF8E3893
	for <cluster-devel@redhat.com>; Sat, 18 Jan 2020 22:41:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-285-NKQkhjjRNGGFOdZAzSEn-g-1; Sat, 18 Jan 2020 17:41:04 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iswlg-0001Y2-1d; Sat, 18 Jan 2020 22:40:36 +0000
Date: Sat, 18 Jan 2020 14:40:35 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200118224035.GA26801@bombadil.infradead.org>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca> <20200115065614.GC21219@lst.de>
	<20200115132428.GA25201@ziepe.ca>
	<20200115143347.GL2827@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
In-Reply-To: <20200115143347.GL2827@hirez.programming.kicks-ass.net>
X-MC-Unique: NKQkhjjRNGGFOdZAzSEn-g-1
X-MC-Unique: Nwz1Ycq3OS26honB9SxLdw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00IMfA2X004243
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] RFC: hold i_rwsem until aio completes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jan 15, 2020 at 03:33:47PM +0100, Peter Zijlstra wrote:
> On Wed, Jan 15, 2020 at 09:24:28AM -0400, Jason Gunthorpe wrote:
>=20
> > I was interested because you are talking about allowing the read/write =
side
> > of a rw sem to be held across a return to user space/etc, which is the
> > same basic problem.
>=20
> No it is not; allowing the lock to be held across userspace doesn't
> change the owner. This is a crucial difference, PI depends on there
> being a distinct owner. That said, allowing the lock to be held across
> userspace still breaks PI in that it completely wrecks the ability to
> analyze the critical section.

Thinking about this from a PI point of view, the problem is not that we
returned to userspace still holding the lock, it's that boosting this
process's priority will not help release the lock faster because this
process no longer owns the lock.

If we had a lock owner handoff API (ie I can donate my lock to another
owner), that would solve this problem.  We'd want to have special owners
to denote "RCU" "bottom halves" or "irq" so we know what we can do about
PI.  I don't think we need a "I have stolen this lock from somebody else"
API, but maybe I'm wrong there.


