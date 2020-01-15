Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AEB8513B9FC
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 07:56:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579071389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SpOGt09lzRo7o6vefIToXYmBIMgO9L1mJ58vx5HQS6M=;
	b=aYCO8IpOr4CYTMrXklZJSqrsYrPNSMtS2RdqycHA3my9HEaVgvC2Q0iS8yIBJ8rE3AzVLn
	qPHCPANn9Gm7isvfr7GvuUAgCpcLT8qkqxpxyZpIBYwbPV/Mod2teaWoYu3Q3AOdr9r9qd
	88U9sIAA6ovAw2UcV3EFFo0RpqcO3CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-GWoed10UPCqTDU8-EuXyOA-1; Wed, 15 Jan 2020 01:56:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D18C477;
	Wed, 15 Jan 2020 06:56:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CD75D9C5;
	Wed, 15 Jan 2020 06:56:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E875B824EA;
	Wed, 15 Jan 2020 06:56:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F6uMth011488 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 01:56:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B757F100321B; Wed, 15 Jan 2020 06:56:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B28861003219
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 06:56:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE494800145
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 06:56:20 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-257-EJNKNaX5MnCJdXZu-TmFOQ-1;
	Wed, 15 Jan 2020 01:56:18 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id E956E68AFE; Wed, 15 Jan 2020 07:56:14 +0100 (CET)
Date: Wed, 15 Jan 2020 07:56:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200115065614.GC21219@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200114192700.GC22037@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: EJNKNaX5MnCJdXZu-TmFOQ-1
X-MC-Unique: GWoed10UPCqTDU8-EuXyOA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00F6uMth011488
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 14, 2020 at 03:27:00PM -0400, Jason Gunthorpe wrote:
> I've seen similar locking patterns quite a lot, enough I've thought
> about having a dedicated locking primitive to do it. It really wants
> to be a rwsem, but as here the rwsem rules don't allow it.
>=20
> The common pattern I'm looking at looks something like this:
>=20
>  'try begin read'() // aka down_read_trylock()
>=20
>   /* The lockdep release hackery you describe,
>      the rwsem remains read locked */
>  'exit reader'()
>=20
>  .. delegate unlock to work queue, timer, irq, etc ..
>=20
> in the new context:
>=20
>  're_enter reader'() // Get our lockdep tracking back
>=20
>  'end reader'() // aka up_read()
>=20
> vs a typical write side:
>=20
>  'begin write'() // aka down_write()
>=20
>  /* There is no reason to unlock it before kfree of the rwsem memory.
>     Somehow the user prevents any new down_read_trylock()'s */
>  'abandon writer'() // The object will be kfree'd with a locked writer
>  kfree()
>=20
> The typical goal is to provide an object destruction path that can
> serialize and fence all readers wherever they may be before proceeding
> to some synchronous destruction.
>=20
> Usually this gets open coded with some atomic/kref/refcount and a
> completion or wait queue. Often implemented wrongly, lacking the write
> favoring bias in the rwsem, and lacking any lockdep tracking on the
> naked completion.
>=20
> Not to discourage your patch, but to ask if we can make the solution
> more broadly applicable?

Your requirement seems a little different, and in fact in many ways
similar to the percpu_ref primitive.


