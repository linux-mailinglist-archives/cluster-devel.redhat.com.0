Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F252613C278
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 14:17:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579094266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xGrbtjuF5jSRHEF1/a6CMKn/AD5cIea6Rj9/bF9d4KM=;
	b=DhA+KN5sA0XbbqJ++INd0JoLTkE+yzGNU1lwYcN8zPFStRzNXkivuUvCvSOAYxo0EX14Iz
	FWx8GQLx4pW8LDpwJjEtEx0AJzjCZCE4XNa9zkWnQIwlFY6liuumuA4LBz+IPIL1cK6Mv2
	BxA/CBwCFXNsqA6oivF5L/INCai3Zgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-AvrPtunHPrSTjmXyk1I9-A-1; Wed, 15 Jan 2020 08:17:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 955668024D8;
	Wed, 15 Jan 2020 13:17:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF049811F2;
	Wed, 15 Jan 2020 13:17:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A8B08250B;
	Wed, 15 Jan 2020 13:17:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EJR8pO032621 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 14:27:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 19903D9615; Tue, 14 Jan 2020 19:27:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14659E38C8
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 19:27:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50AC18F7A31
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 19:27:06 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-235-r0HSfgWRMMCCUEOl33apvA-1; Tue, 14 Jan 2020 14:27:02 -0500
Received: by mail-qt1-f194.google.com with SMTP id e25so2182440qtr.13
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 11:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aJt6sr02+cPWFTf++BZXppcl8L9Qc4Zp51cj05VTask=;
	b=Hu8Ba+jku8uvVYkcVhGNXzGKXLiraGTl/k327LFTr15i+k2+gaYFkfShMbLUOKqhx4
	IOyC8WUZUw0Zx2x2Zdj/IS7VynX7dTHbjhUofxujGNF/MieFCxU9V0TaS/VXqjlxV5a7
	5sykWz4GiSPQ1URqICW6EEIYMnn+Slm54yMC5ZErc7ZymhfKAac0dQN9u4EkL6F9Nyqb
	ndUkuB6MS3bA3mUWI3hg1hkWypF9Mni1f8udRv93roJXAzVh21NW4FUIyU70EVWfe45X
	eQm96kts53LY2lQHf7B02Q47/GCJj3qOypTHghom4zfJdo6CHbdfd0DUgMUWCcjb1BaX
	2NgA==
X-Gm-Message-State: APjAAAVv4lCELAcW81ya7KA02BbbwjqrTaNIHjH/bZGUKmrEyn9tvZtu
	68q9OLyS3jni2X+CLiz54C3goQ==
X-Google-Smtp-Source: APXvYqySNCcNEO4FrkFCq2T3jATCYAK3ivaV1e2ZWAedX1tbYHW/XNiQzo5q+3L4u1x3cX9oTES0GA==
X-Received: by 2002:aed:2465:: with SMTP id s34mr158395qtc.158.1579030021872; 
	Tue, 14 Jan 2020 11:27:01 -0800 (PST)
Received: from ziepe.ca
	(hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[142.68.57.212])
	by smtp.gmail.com with ESMTPSA id 17sm8063238qtz.85.2020.01.14.11.27.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Jan 2020 11:27:01 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1irRq8-0006GA-MO; Tue, 14 Jan 2020 15:27:00 -0400
Date: Tue, 14 Jan 2020 15:27:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200114192700.GC22037@ziepe.ca>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MC-Unique: r0HSfgWRMMCCUEOl33apvA-1
X-MC-Unique: AvrPtunHPrSTjmXyk1I9-A-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EJR8pO032621
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:17:34 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 14, 2020 at 05:12:13PM +0100, Christoph Hellwig wrote:
> Hi all,
>=20
> Asynchronous read/write operations currently use a rather magic locking
> scheme, were access to file data is normally protected using a rw_semapho=
re,
> but if we are doing aio where the syscall returns to userspace before the
> I/O has completed we also use an atomic_t to track the outstanding aio
> ops.  This scheme has lead to lots of subtle bugs in file systems where
> didn't wait to the count to reach zero, and due to its adhoc nature also
> means we have to serialize direct I/O writes that are smaller than the
> file system block size.

I've seen similar locking patterns quite a lot, enough I've thought
about having a dedicated locking primitive to do it. It really wants
to be a rwsem, but as here the rwsem rules don't allow it.

The common pattern I'm looking at looks something like this:

 'try begin read'() // aka down_read_trylock()

  /* The lockdep release hackery you describe,
     the rwsem remains read locked */
 'exit reader'()

 .. delegate unlock to work queue, timer, irq, etc ..

in the new context:

 're_enter reader'() // Get our lockdep tracking back

 'end reader'() // aka up_read()

vs a typical write side:

 'begin write'() // aka down_write()

 /* There is no reason to unlock it before kfree of the rwsem memory.
    Somehow the user prevents any new down_read_trylock()'s */
 'abandon writer'() // The object will be kfree'd with a locked writer
 kfree()

The typical goal is to provide an object destruction path that can
serialize and fence all readers wherever they may be before proceeding
to some synchronous destruction.

Usually this gets open coded with some atomic/kref/refcount and a
completion or wait queue. Often implemented wrongly, lacking the write
favoring bias in the rwsem, and lacking any lockdep tracking on the
naked completion.

Not to discourage your patch, but to ask if we can make the solution
more broadly applicable?

Thanks,
Jason


