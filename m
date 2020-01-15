Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3365F13C29A
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 14:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579094686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WHH1HlsvpgF0l2oa72RtY98MxO3uKpkdYjApRPmESkg=;
	b=Vcwr06dXrwowPekrfwbh6Mhw92NuwG4SriqLXFJrH6y4uJdPhe12a59RJZkhp7IUlIE2+b
	cNRwICvDv5JwTzMlerAHwq86rkuBjDbtNze0vKDFXtE/qBclJ3VSLRbq0ZQgWpfNWZ24E4
	vuq/3fHrSAiZIF6jMPDT3U6yJnQFcZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-fw-iVsDPPdSYqbLz378URw-1; Wed, 15 Jan 2020 08:24:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFFCB10054E3;
	Wed, 15 Jan 2020 13:24:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A805D9C5;
	Wed, 15 Jan 2020 13:24:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06B7218089C8;
	Wed, 15 Jan 2020 13:24:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FDObA7003388 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 08:24:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6E5876CF; Wed, 15 Jan 2020 13:24:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2D72EC4AF
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 13:24:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 343A718AE954
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 13:24:35 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-165-5MlcfDU4MY-O_bqcRhvE2w-1; Wed, 15 Jan 2020 08:24:30 -0500
Received: by mail-qv1-f67.google.com with SMTP id n8so7303719qvg.11
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 05:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JQDxitQ2kV6Oc8g1Nxnl8InwXqW6F+V+cnqQB5GX/Ak=;
	b=Hl1HHfdrTVhqiccquhfawMdBC2jYt/+s2JMoOMhprpDJ8PM1V33D3Pj/bO+qKU82Kj
	Qo/ZUMzilLXpZEen0l8KF1AWiJSA3j7uiYW9hNLVZ86taASP4de2OwOKJezGYoM7OPly
	txscVA0MAXi16MCZFUfvU5wxZYRZyYK2g7p+F+ygJm8+by9Zr5Zje6/pbeMYjOcU0OOM
	T3lnSeJL3RONYZ/1siTZ5C1LXsWq1fmKEKuyIhpI4FWDishHnICdXoH7i2GvXtIBSAv2
	csKaH1ZRgsx3XXYga4VXhWZJbZTsqrNlg0kHHQzqYHNxXjtuO4JE9RxHy6bY1T0/ZTEL
	lq9g==
X-Gm-Message-State: APjAAAWR/aazvuzn9cwj95JfE7+6RvnFqrYCc0MG6AkhpE6GiyUI14Cu
	Ni2PBcukwQ3JpjZl1tJ3H3Q1Dw==
X-Google-Smtp-Source: APXvYqx6UQfK9lVHiSfTgP2tsd97lH+In54WqLxdvVCNYpS5wf/m93SemM+zVXgqN91OGZML192bFg==
X-Received: by 2002:ad4:4e86:: with SMTP id dy6mr22258073qvb.81.1579094669772; 
	Wed, 15 Jan 2020 05:24:29 -0800 (PST)
Received: from ziepe.ca
	(hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[142.68.57.212]) by smtp.gmail.com with ESMTPSA id
	s26sm9366374qtq.22.2020.01.15.05.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Jan 2020 05:24:29 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1irieq-0006oi-6c; Wed, 15 Jan 2020 09:24:28 -0400
Date: Wed, 15 Jan 2020 09:24:28 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200115132428.GA25201@ziepe.ca>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca> <20200115065614.GC21219@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200115065614.GC21219@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MC-Unique: 5MlcfDU4MY-O_bqcRhvE2w-1
X-MC-Unique: fw-iVsDPPdSYqbLz378URw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00FDObA7003388
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jan 15, 2020 at 07:56:14AM +0100, Christoph Hellwig wrote:
> On Tue, Jan 14, 2020 at 03:27:00PM -0400, Jason Gunthorpe wrote:
> > I've seen similar locking patterns quite a lot, enough I've thought
> > about having a dedicated locking primitive to do it. It really wants
> > to be a rwsem, but as here the rwsem rules don't allow it.
> >=20
> > The common pattern I'm looking at looks something like this:
> >=20
> >  'try begin read'() // aka down_read_trylock()
> >=20
> >   /* The lockdep release hackery you describe,
> >      the rwsem remains read locked */
> >  'exit reader'()
> >=20
> >  .. delegate unlock to work queue, timer, irq, etc ..
> >=20
> > in the new context:
> >=20
> >  're_enter reader'() // Get our lockdep tracking back
> >=20
> >  'end reader'() // aka up_read()
> >=20
> > vs a typical write side:
> >=20
> >  'begin write'() // aka down_write()
> >=20
> >  /* There is no reason to unlock it before kfree of the rwsem memory.
> >     Somehow the user prevents any new down_read_trylock()'s */
> >  'abandon writer'() // The object will be kfree'd with a locked writer
> >  kfree()
> >=20
> > The typical goal is to provide an object destruction path that can
> > serialize and fence all readers wherever they may be before proceeding
> > to some synchronous destruction.
> >=20
> > Usually this gets open coded with some atomic/kref/refcount and a
> > completion or wait queue. Often implemented wrongly, lacking the write
> > favoring bias in the rwsem, and lacking any lockdep tracking on the
> > naked completion.
> >=20
> > Not to discourage your patch, but to ask if we can make the solution
> > more broadly applicable?
>=20
> Your requirement seems a little different, and in fact in many ways
> similar to the percpu_ref primitive.

I was interested because you are talking about allowing the read/write side
of a rw sem to be held across a return to user space/etc, which is the
same basic problem.

precpu refcount looks more like a typical refcount with a release that
is called by whatever context does the final put. The point above is
to basically move the release of a refcount into a synchrnous path by
introducing some barrier to wait for the refcount to go to zero. In
the above the barrier is the down_write() as it is really closer to a
rwsem than a refcount.

Thanks,
Jason


