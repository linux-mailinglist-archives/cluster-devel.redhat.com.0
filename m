Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 863756438FE
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Dec 2022 00:04:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670281461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EMxgvk2yFo8Rbo93eUfFPWH3YMgPyr5c5rnRRAyyLVQ=;
	b=bth0TOzLptr/IdSgw2n4/SIUcGxlire3HKKMudraxv8rUMM66THgvE77GeYMFfP2Hce77z
	G9jlz3fLjBckdYPvXNRWWxIYQNTfC24R+sjF2D/0cmuhys7yZ0sk+TidC9gJPlZDLkAd3G
	4qAFjuRIyiTqDJTB4vmT2mIHDF1fzl0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-zZbf06FuNLa67OtTm_SBxg-1; Mon, 05 Dec 2022 18:04:17 -0500
X-MC-Unique: zZbf06FuNLa67OtTm_SBxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054A4381494C;
	Mon,  5 Dec 2022 23:04:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0073540C6EC3;
	Mon,  5 Dec 2022 23:04:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B7D0194658D;
	Mon,  5 Dec 2022 23:04:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B2071946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  5 Dec 2022 23:04:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D09C0C19145; Mon,  5 Dec 2022 23:04:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8EE7C159CD
 for <cluster-devel@redhat.com>; Mon,  5 Dec 2022 23:04:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD999185A78B
 for <cluster-devel@redhat.com>; Mon,  5 Dec 2022 23:04:14 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-VMsOWkKkMWGznX_ZQok68A-1; Mon, 05 Dec 2022 18:04:13 -0500
X-MC-Unique: VMsOWkKkMWGznX_ZQok68A-1
Received: by mail-pg1-f171.google.com with SMTP id f3so11817927pgc.2
 for <cluster-devel@redhat.com>; Mon, 05 Dec 2022 15:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMxgvk2yFo8Rbo93eUfFPWH3YMgPyr5c5rnRRAyyLVQ=;
 b=GfOcpf/sotcKFRMeiYtChaq6WP8c93MnnwB9OvCw5+7dqAw5/HPhN2xACVNmia1tEX
 PN82n9DeUnBCkJPnDX+yty+OnXv4IblmepDl6K057+tO5phQPLwuIflPDGr2LJiDk+ZZ
 s82iOsiAHUomMRaOQaFgODM8zxdiupmRokTnzQfPeLvVcvP9nRWfJx8msnsUr3PoJ6HJ
 4e2WGtnw/zjxrVGolizWSXADtxAclZZopfXY2Xp1PbjljJ1GwqrCvNaYcKZrn34xT51p
 NvsquoWLkpCMB+nWLGTDk6lDKAyhDt1Z+fg/AA9u1gq/tXxZ7oE25aN+PMMYZVgMBLAY
 ZYMQ==
X-Gm-Message-State: ANoB5pl2MsRI6Sw2s5llikTZmk0nBWI1rMKoDJsyDOu+/7pULA+Hd5KB
 MRx/+pfHC1TCJpQ0iHueWSXe6HmTFs9OMgLG
X-Google-Smtp-Source: AA0mqf5eDxwr9JDrHbPttLGwszxyGTK5GHFn8edQbmPwIKgeDp4Nde0sxZFhRR/hZfKvOlnUTyuXfw==
X-Received: by 2002:a63:d48:0:b0:474:6739:6a09 with SMTP id
 8-20020a630d48000000b0047467396a09mr66392507pgn.292.1670281452243; 
 Mon, 05 Dec 2022 15:04:12 -0800 (PST)
Received: from dread.disaster.area (pa49-181-54-199.pa.nsw.optusnet.com.au.
 [49.181.54.199]) by smtp.gmail.com with ESMTPSA id
 b15-20020a170902d50f00b00174f61a7d09sm11120251plg.247.2022.12.05.15.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 15:04:11 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1p2KVM-004y9z-6R; Tue, 06 Dec 2022 10:04:08 +1100
Date: Tue, 6 Dec 2022 10:04:08 +1100
From: Dave Chinner <david@fromorbit.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20221205230408.GQ3600936@dread.disaster.area>
References: <20221201160619.1247788-1-agruenba@redhat.com>
 <20221201180957.1268079-1-agruenba@redhat.com>
 <20221201212956.GO3600936@dread.disaster.area>
 <CAHc6FU6u9A0S-EwyB6vq89XPj1rucL8U0oqq__OzB1d0evM-yA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6u9A0S-EwyB6vq89XPj1rucL8U0oqq__OzB1d0evM-yA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 02, 2022 at 02:54:00AM +0100, Andreas Gruenbacher wrote:
> On Thu, Dec 1, 2022 at 10:30 PM Dave Chinner <david@fromorbit.com> wrote:
> > On Thu, Dec 01, 2022 at 07:09:54PM +0100, Andreas Gruenbacher wrote:
> > > Hi again,
> > >
> > > [Same thing, but with the patches split correctly this time.]
> > >
> > > we're seeing a race between journaled data writes and the shrinker on
> > > gfs2.  What's happening is that gfs2_iomap_page_done() is called after
> > > the page has been unlocked, so try_to_free_buffers() can come in and
> > > free the buffers while gfs2_iomap_page_done() is trying to add them to
> > > the transaction.  Not good.
> > >
> > > This is a proposal to change iomap_page_ops so that page_prepare()
> > > prepares the write and grabs the locked page, and page_done() unlocks
> > > and puts that page again.  While at it, this also converts the hooks
> > > from pages to folios.
> > >
> > > To move the pagecache_isize_extended() call in iomap_write_end() out of
> > > the way, a new folio_may_straddle_isize() helper is introduced that
> > > takes a locked folio.  That is then used when the inode size is updated,
> > > before the folio is unlocked.
> > >
> > > I've also converted the other applicable folio_may_straddle_isize()
> > > users, namely generic_write_end(), ext4_write_end(), and
> > > ext4_journalled_write_end().
> > >
> > > Any thoughts?
> >
> > I doubt that moving page cache operations from the iomap core to
> > filesystem specific callouts will be acceptible. I recently proposed
> > patches that added page cache walking to an XFS iomap callout to fix
> > a data corruption, but they were NAKd on the basis that iomap is
> > supposed to completely abstract away the folio and page cache
> > manipulations from the filesystem.
> 
> Right. The resulting code is really quite disgusting, for a
> fundamentalist dream of abstraction.
> 
> > This patchset seems to be doing the same thing - moving page cache
> > and folio management directly in filesystem specific callouts. Hence
> > I'm going to assume that the same architectural demarcation is
> > going to apply here, too...
> >
> > FYI, there is already significant change committed to the iomap
> > write path in the current XFS tree as a result of the changes I
> > mention - there is stale IOMAP detection which adds a new page ops
> > method and adds new error paths with a locked folio in
> > iomap_write_begin().
> 
> That would have belonged on the iomap-for-next branch rather than in
> the middle of a bunch of xfs commits.

Damned if you do, damned if you don't.

There were non-trivial cross dependencies between XFS and iomap in
that patch set.  The initial IOMAP_F_STALE infrastructure needed XFS
changes first, otherwise it could deadlock at ENOSPC on write page
faults. i.e. the iomap change in isolation broke stuff, so we're
forced to either carry XFs changes in iomap or iomap changes in XFS
so that there are no regressions in a given tree.

Then we had to move XFS functionality to iomap to fix another data
corruption that the IOMAP_F_STALE infrastructure exposed in XFS via
generic/346. Once the code was moved, then we could build it up into
the page cache scanning functionality in iomap. And only then could
we add the XFS IOMAP_F_STALE validation to XFS to solve the original
data corruption that started all this off.

IOWs, there were so many cross dependencies between XFs and iomap
that it was largely impossible to break it up into two separate sets
of indpendent patches that didn't cause regressions in one or the
other tree. And in the end, we'd still have to merge the iomap tree
into XFS or vice versa to actually test that the data corruption fix
worked.

In situations like this, we commonly take the entire series into one
of the two trees rather than make a whole lot more work for
ourselves by trying to separate them out. And in this case, because
it was XFS data corruption and race conditions that needed fixing,
it made sense to take it through the XFS tree so that it gets
coverage from all the XFS testing that happens - the iomap tree gets
a lot less early coverage than the XFS tree...

> > And this other data corruption (and performance) fix for handling
> > zeroing over unwritten extents properly:
> >
> > https://lore.kernel.org/linux-xfs/20221201005214.3836105-1-david@fromorbit.com/
> >
> > changes the way folios are looked up and instantiated in the page
> > cache in iomap_write_begin(). It also adds new error conditions that
> > need to be returned to callers so to implement conditional "folio
> > must be present and dirty" page cache zeroing from
> > iomap_zero_iter(). Those semantics would also have to be supported
> > by gfs2, and that greatly complicates modifying and testing iomap
> > core changes.
> >
> > To avoid all this, can we simple move the ->page_done() callout in
> > the error path and iomap_write_end() to before we unlock the folio?
> > You've already done that for pagecache_isize_extended(), and I can't
> > see anything obvious in the gfs2 ->page_done callout that
> > would cause issues if it is called with a locked dirty folio...
> 
> Yes, I guess we can do that once pagecache_isize_extended() is
> replaced by folio_may_straddle_isize().
> 
> Can people please scrutinize the math in folio_may_straddle_isize() in
> particular?

I'll look at it more closely in the next couple of days.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

