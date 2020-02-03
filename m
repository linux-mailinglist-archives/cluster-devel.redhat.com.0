Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6960D1512AB
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Feb 2020 00:02:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580770958;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PrY6ROdyu74FBkMol0XgtVc9m/cswrKeoKRRsMoO+kk=;
	b=RGLQb2A1gbuuotSn/r6kKhPngF+ZuyVJ/IzeOFsWMJRQLoGzJ3eN+HeEQqHg4j7uFsSADj
	Me/NfE34XVg7hVqIK84rHzXPKENZ1T/oGk7+wEb7gOTuML0dljhbidyGeMUkO4k0DSah6y
	ONpKkhnMg7QedBDZ9WWM2SnnccyBNIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-b4vokvDOOJWoyo764fIZwA-1; Mon, 03 Feb 2020 18:02:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1FCB801E67;
	Mon,  3 Feb 2020 23:02:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C27A5C1B5;
	Mon,  3 Feb 2020 23:02:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE1C51809567;
	Mon,  3 Feb 2020 23:02:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013N2NEn026851 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 18:02:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F76B10D14E1; Mon,  3 Feb 2020 23:02:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A4110D14E2
	for <cluster-devel@redhat.com>; Mon,  3 Feb 2020 23:02:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0908185B0A9
	for <cluster-devel@redhat.com>; Mon,  3 Feb 2020 23:02:20 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-161-aG5V52qhOa2oLQljRjop7Q-1; Mon, 03 Feb 2020 18:02:16 -0500
Received: from dread.disaster.area (pa49-181-161-120.pa.nsw.optusnet.com.au
	[49.181.161.120])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 77ADE3A2A22;
	Tue,  4 Feb 2020 10:02:10 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1iykjJ-0006Rf-AX; Tue, 04 Feb 2020 10:02:09 +1100
Date: Tue, 4 Feb 2020 10:02:09 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200203230209.GC20628@dread.disaster.area>
References: <20200114161225.309792-1-hch@lst.de>
	<20200118092838.GB9407@dread.disaster.area>
	<20200203174641.GA20035@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200203174641.GA20035@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=SkgQWeG3jiSQFIjTo4+liA==:117 a=SkgQWeG3jiSQFIjTo4+liA==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=7-415B0cAAAA:8 a=4rX9TS273XGzNsaKJp0A:9 a=CjuIK1q_8ugA:10
	a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: aG5V52qhOa2oLQljRjop7Q-1
X-MC-Unique: b4vokvDOOJWoyo764fIZwA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 013N2NEn026851
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 03, 2020 at 06:46:41PM +0100, Christoph Hellwig wrote:
> On Sat, Jan 18, 2020 at 08:28:38PM +1100, Dave Chinner wrote:
> > I think it's pretty gross, actually. It  makes the same mistake made
> > with locking in the old direct IO code - it encodes specific lock
> > operations via flags into random locations in the DIO path. This is
> > a very slippery slope, and IMO it is an layering violation to encode
> > specific filesystem locking smeantics into a layer that is supposed
> > to be generic and completely filesystem agnostic. i.e.  this
> > mechanism breaks if a filesystem moves to a different type of lock
> > (e.g. range locks), and history teaches us that we'll end up making
> > a horrible, unmaintainable mess to support different locking
> > mechanisms and contexts.
> >=20
> > I think that we should be moving to a model where the filesystem
> > provides an unlock method in the iomap operations structure, and if
> > the method is present in iomap_dio_complete() it gets called for the
> > filesystem to unlock the inode at the appropriate point. This also
> > allows the filesystem to provide a different method for read or
> > write unlock, depending on what type of lock it held at submission.
> > This gets rid of the need for the iomap code to know what type of
> > lock the caller holds, too.
>=20
> I'd rather avoid yet another method.  But I think with a little
> tweaking we can move the unlock into the ->end_io method.

That would work, too :)

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


