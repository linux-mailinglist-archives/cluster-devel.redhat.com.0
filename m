Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7D14613C7FA
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 16:36:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579102596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jxdypsxRMA0uwsyQt4EL4Rjr2LlXd8DwqudwwkFAk8s=;
	b=gv+hLfALudl6v/n54Mbu/yqoGQWh5h6LFTUx+wJxAaAIadLw6wklHA3GQsNFE9tfyvbI9G
	047X8orc/ZqC7oxmo+aDVmxeA8qDrDtmezu3LzsysRIBC8eJK/917zKoepvyhbnjr7yyIo
	e9lB3EyPUyRsdxGtWASAQo0/cVSAHNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-2S2DejX6MCu0ADtupNaMwg-1; Wed, 15 Jan 2020 10:36:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514138D70B0;
	Wed, 15 Jan 2020 15:36:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC91F86422;
	Wed, 15 Jan 2020 15:36:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B891518089C8;
	Wed, 15 Jan 2020 15:36:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FFaQbL012841 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 10:36:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AF6042166B2C; Wed, 15 Jan 2020 15:36:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABBE32166B2B
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 15:36:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A53D518AE952
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 15:36:24 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-418-J-Ny26aZM8OnZgHecRSdVg-1;
	Wed, 15 Jan 2020 10:36:18 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id B420968B20; Wed, 15 Jan 2020 16:36:14 +0100 (CET)
Date: Wed, 15 Jan 2020 16:36:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200115153614.GA31296@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca> <20200115065614.GC21219@lst.de>
	<20200115132428.GA25201@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200115132428.GA25201@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: J-Ny26aZM8OnZgHecRSdVg-1
X-MC-Unique: 2S2DejX6MCu0ADtupNaMwg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00FFaQbL012841
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jan 15, 2020 at 09:24:28AM -0400, Jason Gunthorpe wrote:
> > Your requirement seems a little different, and in fact in many ways
> > similar to the percpu_ref primitive.
>=20
> I was interested because you are talking about allowing the read/write si=
de
> of a rw sem to be held across a return to user space/etc, which is the
> same basic problem.
>=20
> precpu refcount looks more like a typical refcount with a release that
> is called by whatever context does the final put. The point above is
> to basically move the release of a refcount into a synchrnous path by
> introducing some barrier to wait for the refcount to go to zero. In
> the above the barrier is the down_write() as it is really closer to a
> rwsem than a refcount.

No, percpu_ref is a little different than the name suggests, as it has
a magic initial reference, and then the other short term reference.  To
actually tear it down now just a normal put of the reference is needed,
but an explicit percpu_ref_kill or percpu_ref_kill_and_confirm.  Various
callers (including all I added) would like that operation to be
synchronous and currently hack that up, so a version of the percpu_ref
that actually waits for the other references to away like we hacked
up various places seems to exactly suit your requirements.


