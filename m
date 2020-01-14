Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A0C9713B253
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 19:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579027651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4Puk4Pgh+JhY8rl1OTT+GzFNEp0YuWY6wSf3flBS7Ow=;
	b=Q3gP6wUjHi0NifIGW4QXYbZwY8huQP6VHJJvyWgW3spP6b47+ENNrla1U/CYSXnkKoiMxq
	BJMUx+2JPr/CNl0H3wEvN/ARo+Q0A6x1XoSgalng25gGqqPvUJDaOIzBuOA7wTOd+39YAj
	WR+i84fm2OZsEBvYoORxLwD/jMcI+DA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436--dJmOcvPP_-j2dubcO6bYw-1; Tue, 14 Jan 2020 13:47:28 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B3B802B85;
	Tue, 14 Jan 2020 18:47:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98F0F60BF4;
	Tue, 14 Jan 2020 18:47:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0525E8250D;
	Tue, 14 Jan 2020 18:47:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EIlKLg029998 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 13:47:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D2B8820316E8; Tue, 14 Jan 2020 18:47:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE23F2026D67
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 18:47:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A872D80138A
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 18:47:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-222-nMQ0wA6EOtW4UqhkulxI_Q-1; Tue, 14 Jan 2020 13:47:15 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1irRDX-0006t8-Mm; Tue, 14 Jan 2020 18:47:07 +0000
Date: Tue, 14 Jan 2020 10:47:07 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200114184707.GA10467@bombadil.infradead.org>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
X-MC-Unique: nMQ0wA6EOtW4UqhkulxI_Q-1
X-MC-Unique: -dJmOcvPP_-j2dubcO6bYw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EIlKLg029998
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 14, 2020 at 05:12:13PM +0100, Christoph Hellwig wrote:
> Second I/O
> completions often come from interrupt context, which means the re-acquire
> is recorded as from irq context, leading to warnings about incorrect
> contexts.  I wonder if we could just have a bit in lockdep that says
> returning to userspace is ok for this particular lock?  That would also
> clean up the fsfreeze situation a lot.

It would be helpful if we could also use the same lockdep logic
for PageLocked.  Again, it's a case where returning to userspace with
PageLock held is fine, because we're expecting an interrupt to come in
and drop the lock for us.

Perhaps the right answer is, from lockdep's point of view, to mark the
lock as being released at the point where we submit the I/O.  Then
in the completion path release the lock without telling lockdep we
released it.

That would catch cases where we inadvertently returned to userspace
without submitting the I/O, for example.


