Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C8B3713B9F9
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 07:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579071265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6hc08AxEGb2xhNdvAS8krzAm8bzhSDXOGK5rGWphTcM=;
	b=JMjtLVPL8c1eDZrXCx8fVHVVlrrs4NMHXHYGWRCFE6VQOwgW2BP7Vgnb07IpnxaqZT9tAQ
	9xlKB00dGqWe+up9zSuZkdT2HykI08FyyA84Lm9VdXXtiro2FZ2LjX4+piVJAGVDne1EGl
	WaUngbBrLFw6x08C4AD9C9C+2vSngPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-iVOhbBnLMUiOqrHKuTKX1w-1; Wed, 15 Jan 2020 01:54:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3154E8DB1C0;
	Wed, 15 Jan 2020 06:54:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC89E5C1D6;
	Wed, 15 Jan 2020 06:54:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06B98824EC;
	Wed, 15 Jan 2020 06:54:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F6sH1G011426 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 01:54:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E17922166B2E; Wed, 15 Jan 2020 06:54:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD4AA2166B2D
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 06:54:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54D8380206F
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 06:54:14 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-255-1KZYAeLGMY25ht1EzR7fNg-1;
	Wed, 15 Jan 2020 01:54:10 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id 68EA368AFE; Wed, 15 Jan 2020 07:54:06 +0100 (CET)
Date: Wed, 15 Jan 2020 07:54:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200115065406.GB21219@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114184707.GA10467@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200114184707.GA10467@bombadil.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: 1KZYAeLGMY25ht1EzR7fNg-1
X-MC-Unique: iVOhbBnLMUiOqrHKuTKX1w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00F6sH1G011426
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 14, 2020 at 10:47:07AM -0800, Matthew Wilcox wrote:
> It would be helpful if we could also use the same lockdep logic
> for PageLocked.  Again, it's a case where returning to userspace with
> PageLock held is fine, because we're expecting an interrupt to come in
> and drop the lock for us.

Yes, this is a very typical pattern for I/O.  Besides the page and
buffer head bit locks it also applies to the semaphore in the xfs_buf
structure and probably various other places that currently used hand
crafted or legacy locking primitives to escape lockdep.

> Perhaps the right answer is, from lockdep's point of view, to mark the
> lock as being released at the point where we submit the I/O.  Then
> in the completion path release the lock without telling lockdep we
> released it.

That is similar to what the fsfreeze code does, but I don't think it
is very optimal, as misses to track any dependencies after I/O
submission, and at least some of the completions paths do take
locks.  But it might be a start.


