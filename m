Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8A60113CCC7
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 20:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579115279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YXpOGPNooYEfoBsHB046oGmwkynnQj+cZtk+nYfABNo=;
	b=CGdUhauzDndL+losJI9t+oIvr0o4+BgpbHZtjtSUkYH7rm0oKFtobKSQQXr+yftfotmIP5
	j8fhaQIpWH1jI5YQ3dq/EnOSN2Sc7RbUg3nS8b38Ot6BPnQ/EzQATXzJMHcg2RcGjxSzZq
	6R1JYSSMsD1p9604W6DaJPucS7gTq8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-4SQPmYT1OZWdjJFBDy0ivw-1; Wed, 15 Jan 2020 14:07:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8F76A0CC0;
	Wed, 15 Jan 2020 19:07:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6844166B7;
	Wed, 15 Jan 2020 19:07:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AE3A180BA96;
	Wed, 15 Jan 2020 19:07:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FJ7qIk026333 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 14:07:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 450D4F18C3; Wed, 15 Jan 2020 19:07:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 410F7F18D0
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 19:07:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F35A71011E06
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 19:07:49 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-436-d8okaMlsO0uQd8aiejQgwA-1;
	Wed, 15 Jan 2020 14:07:48 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9783D68B20; Wed, 15 Jan 2020 20:07:44 +0100 (CET)
Date: Wed, 15 Jan 2020 20:07:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Waiman Long <longman@redhat.com>
Message-ID: <20200115190744.GA2628@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca> <20200115065614.GC21219@lst.de>
	<20200115132428.GA25201@ziepe.ca>
	<20200115143347.GL2827@hirez.programming.kicks-ass.net>
	<20200115144948.GB25201@ziepe.ca>
	<849239ff-d2d1-4048-da58-b4347e0aa2bd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <849239ff-d2d1-4048-da58-b4347e0aa2bd@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: d8okaMlsO0uQd8aiejQgwA-1
X-MC-Unique: 4SQPmYT1OZWdjJFBDy0ivw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00FJ7qIk026333
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jan 15, 2020 at 02:03:22PM -0500, Waiman Long wrote:
> >> (1) no unlocking by another process than the one that acquired it
> >> (2) no return to userspace with locks held
> > As an example flow: obtain the read side lock, schedual a work queue,
> > return to user space, and unlock the read side from the work queue.
>=20
> We currently have down_read_non_owner() and up_read_non_owner() that
> perform the lock and unlock without lockdep tracking. Of course, that is
> a hack and their use must be carefully scrutinized to make sure that
> there is no deadlock or other potentially locking issues.

That doesn't help with returning to userspace while the lock is held.


