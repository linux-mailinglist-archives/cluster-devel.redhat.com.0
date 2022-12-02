Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE48363FDD7
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Dec 2022 02:55:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669946100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=COzjxy6Cx/yoL60phqF9Y1iVWuFzG9VgVu3jRR0Ap+U=;
	b=EKfvlxlWcoS83fhNK92fqxwHTB44m6GI1kAjEXoOHAQEJGBTCCZ0cdW7kxgXvRT5jx2xOO
	5JFI7CeYb/XSKp4i4y8tFtmEmp/ITZkSGQ/KVcYleG6uB/UhxO4cViSQGk6V3oBO69qn0R
	NcC+UON0T/V20E2LTdGvAEi5JgHfWjU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-x5xcJREJOAmQOieGcTIRMA-1; Thu, 01 Dec 2022 20:54:57 -0500
X-MC-Unique: x5xcJREJOAmQOieGcTIRMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07352185A78B;
	Fri,  2 Dec 2022 01:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FFF54B3FCD;
	Fri,  2 Dec 2022 01:54:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C897919465B2;
	Fri,  2 Dec 2022 01:54:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5953919465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  2 Dec 2022 01:54:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2542F111E3FD; Fri,  2 Dec 2022 01:54:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E041111E3EA
 for <cluster-devel@redhat.com>; Fri,  2 Dec 2022 01:54:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0E3E185A794
 for <cluster-devel@redhat.com>; Fri,  2 Dec 2022 01:54:13 +0000 (UTC)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-ppVYyIiWMU-YPnl1uGhB9Q-1; Thu, 01 Dec 2022 20:54:12 -0500
X-MC-Unique: ppVYyIiWMU-YPnl1uGhB9Q-1
Received: by mail-yb1-f199.google.com with SMTP id
 n16-20020a25da10000000b006f2b5bc99f9so3663347ybf.11
 for <cluster-devel@redhat.com>; Thu, 01 Dec 2022 17:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=COzjxy6Cx/yoL60phqF9Y1iVWuFzG9VgVu3jRR0Ap+U=;
 b=L4snI27uYg7xkKIiKp+857VxIF+3h8ZWTxPgAbAMJBws909oxPqZwQFJ9hoO4gYHAe
 KzonezhLk6yIRohZ83uv4zelGolOewYWhCAbN+yA2uYOGeueml+iLD4pKb73I16tKWhZ
 kCzI9aMVt0114NvR3vfNyaiG8TYUVjQA9xS0sDU0PUaJzUEtXscGbxggd4dtl6d9hLQR
 t7zHlCnPEbf4Aol9FSkA9PhY/rFRz5TlLxWL+zxfjAnonRo0C2ZT/rJdKAAwqLK2g3H7
 8+tOWvGDfmw9zZ84ybF1PytPiAR1RLwMuNOP0G6pts/dUZmAUTGNaI2ovi2CRAExwz26
 3fGg==
X-Gm-Message-State: ANoB5pmzhCatFW7dGcHpkI4RziJ2Rl2HFmouhls5+jFpm04UlN7WKU+x
 sUR3omUMFYnTDdTp6JjWsRGVjtXWbAfX4flJ6SRE8DB6VSdMum7X/e+3UewVbhI9jcwVdahRAHj
 MmFXyXeGcNcHfZCBaDHqlHVa51fPTPgVEazy4fg==
X-Received: by 2002:a81:d92:0:b0:3bd:77de:3652 with SMTP id
 140-20020a810d92000000b003bd77de3652mr29752906ywn.147.1669946052365; 
 Thu, 01 Dec 2022 17:54:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4zl5/yw2S0gY5SqLJMEn3kK+Mc23RWKMLXVRNIap4XekIskw7GEsiU1dqL8mTyQsVHGqUk1+lUCQo3JuJVWvY=
X-Received: by 2002:a81:d92:0:b0:3bd:77de:3652 with SMTP id
 140-20020a810d92000000b003bd77de3652mr29752883ywn.147.1669946052084; Thu, 01
 Dec 2022 17:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20221201160619.1247788-1-agruenba@redhat.com>
 <20221201180957.1268079-1-agruenba@redhat.com>
 <20221201212956.GO3600936@dread.disaster.area>
In-Reply-To: <20221201212956.GO3600936@dread.disaster.area>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 2 Dec 2022 02:54:00 +0100
Message-ID: <CAHc6FU6u9A0S-EwyB6vq89XPj1rucL8U0oqq__OzB1d0evM-yA@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [RFC v2 0/3] Turn iomap_page_ops into
 iomap_folio_ops
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 1, 2022 at 10:30 PM Dave Chinner <david@fromorbit.com> wrote:
> On Thu, Dec 01, 2022 at 07:09:54PM +0100, Andreas Gruenbacher wrote:
> > Hi again,
> >
> > [Same thing, but with the patches split correctly this time.]
> >
> > we're seeing a race between journaled data writes and the shrinker on
> > gfs2.  What's happening is that gfs2_iomap_page_done() is called after
> > the page has been unlocked, so try_to_free_buffers() can come in and
> > free the buffers while gfs2_iomap_page_done() is trying to add them to
> > the transaction.  Not good.
> >
> > This is a proposal to change iomap_page_ops so that page_prepare()
> > prepares the write and grabs the locked page, and page_done() unlocks
> > and puts that page again.  While at it, this also converts the hooks
> > from pages to folios.
> >
> > To move the pagecache_isize_extended() call in iomap_write_end() out of
> > the way, a new folio_may_straddle_isize() helper is introduced that
> > takes a locked folio.  That is then used when the inode size is updated,
> > before the folio is unlocked.
> >
> > I've also converted the other applicable folio_may_straddle_isize()
> > users, namely generic_write_end(), ext4_write_end(), and
> > ext4_journalled_write_end().
> >
> > Any thoughts?
>
> I doubt that moving page cache operations from the iomap core to
> filesystem specific callouts will be acceptible. I recently proposed
> patches that added page cache walking to an XFS iomap callout to fix
> a data corruption, but they were NAKd on the basis that iomap is
> supposed to completely abstract away the folio and page cache
> manipulations from the filesystem.

Right. The resulting code is really quite disgusting, for a
fundamentalist dream of abstraction.

> This patchset seems to be doing the same thing - moving page cache
> and folio management directly in filesystem specific callouts. Hence
> I'm going to assume that the same architectural demarcation is
> going to apply here, too...
>
> FYI, there is already significant change committed to the iomap
> write path in the current XFS tree as a result of the changes I
> mention - there is stale IOMAP detection which adds a new page ops
> method and adds new error paths with a locked folio in
> iomap_write_begin().

That would have belonged on the iomap-for-next branch rather than in
the middle of a bunch of xfs commits.

> And this other data corruption (and performance) fix for handling
> zeroing over unwritten extents properly:
>
> https://lore.kernel.org/linux-xfs/20221201005214.3836105-1-david@fromorbit.com/
>
> changes the way folios are looked up and instantiated in the page
> cache in iomap_write_begin(). It also adds new error conditions that
> need to be returned to callers so to implement conditional "folio
> must be present and dirty" page cache zeroing from
> iomap_zero_iter(). Those semantics would also have to be supported
> by gfs2, and that greatly complicates modifying and testing iomap
> core changes.
>
> To avoid all this, can we simple move the ->page_done() callout in
> the error path and iomap_write_end() to before we unlock the folio?
> You've already done that for pagecache_isize_extended(), and I can't
> see anything obvious in the gfs2 ->page_done callout that
> would cause issues if it is called with a locked dirty folio...

Yes, I guess we can do that once pagecache_isize_extended() is
replaced by folio_may_straddle_isize().

Can people please scrutinize the math in folio_may_straddle_isize() in
particular?

Thanks,
Andreas

> Cheers,
>
> Dave.
> --
> Dave Chinner
> david@fromorbit.com
>

