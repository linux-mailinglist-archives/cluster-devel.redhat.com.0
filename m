Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2B663473
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Jan 2023 23:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673304907;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3qw/o5eKH4tybMDRYcdLUErn+NDBytKClm64hy+9LWk=;
	b=TIAGDdrJ51smQQaPjFLsCr4csxfynZnA1OUih+b2UQXS6r2mVT86x/XuP5ZfHiqFs8a9aM
	f9/HgsNbK8U5YbKKRjjriXqFJxjzLY1LaAh5UCkdVFZMuDKiVjfKbfprMOv4EX2uIenSao
	aVul42V3oyM2y0tHV3tLXjaRptUUPKM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-WtXIm10YNSmYY1Y0BbMb7w-1; Mon, 09 Jan 2023 17:55:04 -0500
X-MC-Unique: WtXIm10YNSmYY1Y0BbMb7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB0A985C06C;
	Mon,  9 Jan 2023 22:55:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA2E4C16026;
	Mon,  9 Jan 2023 22:55:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8CBC11949751;
	Mon,  9 Jan 2023 22:55:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8F981946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 22:55:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 91D042026D68; Mon,  9 Jan 2023 22:55:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A4092026D4B
 for <cluster-devel@redhat.com>; Mon,  9 Jan 2023 22:55:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 680953C1024F
 for <cluster-devel@redhat.com>; Mon,  9 Jan 2023 22:55:00 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-CKpFdlS6MIatIv6sbvWuvQ-1; Mon, 09 Jan 2023 17:54:58 -0500
X-MC-Unique: CKpFdlS6MIatIv6sbvWuvQ-1
Received: by mail-pl1-f179.google.com with SMTP id p24so11211087plw.11
 for <cluster-devel@redhat.com>; Mon, 09 Jan 2023 14:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qw/o5eKH4tybMDRYcdLUErn+NDBytKClm64hy+9LWk=;
 b=givphUxlzLXcnD+ylPGXZH9CHZbww9dc8jvBBz1dt1mDJAtnwrvCIcJUTD03+W2iDO
 zEUjLujiqT4zORde1fj36fe+nyiEeOzsmhR+XjlpSvrWXXM47sar95dPGdwATs8PkUoJ
 9IQL7plZBk9I+Ru/lwGTpBKwBm4jUdIy9Vhlh7yXBpnhrQnrQjp3Y4o/OqWVlGtl+bgn
 HuTsqVgWUfKR5pP7G2czuTTPzyKPamvWRnQQMS/30W0JecofJEUNXdnbJnA11LvbEq1M
 z2wD2PjTTJfXeoHySaIPUECucrPvpMvjxohlhzFKnid5dHVz2gVGcFyn7ZOUoDWFC0YY
 LRMg==
X-Gm-Message-State: AFqh2krE8QlTtXcXiitPVnaHtFN3PdzxejdwTP15mT52uG3MoE8ljXvO
 o2Zki35ARd6kXc1DzVxx0o5sBA==
X-Google-Smtp-Source: AMrXdXsWlVmcNBxraYL/uq/ChqAYF2lEgiJj+SqpEaflUE5jMHeJby8TD4rB34FBji9oEF4+hKp6GQ==
X-Received: by 2002:a17:902:b095:b0:192:a480:208c with SMTP id
 p21-20020a170902b09500b00192a480208cmr43213737plr.19.1673304897500; 
 Mon, 09 Jan 2023 14:54:57 -0800 (PST)
Received: from dread.disaster.area (pa49-186-146-207.pa.vic.optusnet.com.au.
 [49.186.146.207]) by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b001911e0af95dsm6561893plh.240.2023.01.09.14.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:54:56 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pF12b-001AKs-Gq; Tue, 10 Jan 2023 09:54:53 +1100
Date: Tue, 10 Jan 2023 09:54:53 +1100
From: Dave Chinner <david@fromorbit.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20230109225453.GQ1971568@dread.disaster.area>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
 <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [RFC v6 08/10] iomap/xfs: Eliminate the
 iomap_valid handler
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2023 at 07:45:27PM +0100, Andreas Gruenbacher wrote:
> On Sun, Jan 8, 2023 at 10:59 PM Dave Chinner <david@fromorbit.com> wrote:
> > On Sun, Jan 08, 2023 at 08:40:32PM +0100, Andreas Gruenbacher wrote:
> > > Eliminate the ->iomap_valid() handler by switching to a ->get_folio()
> > > handler and validating the mapping there.
> > >
> > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> >
> > I think this is wrong.
> >
> > The ->iomap_valid() function handles a fundamental architectural
> > issue with cached iomaps: the iomap can become stale at any time
> > whilst it is in use by the iomap core code.
> >
> > The current problem it solves in the iomap_write_begin() path has to
> > do with writeback and memory reclaim races over unwritten extents,
> > but the general case is that we must be able to check the iomap
> > at any point in time to assess it's validity.
> >
> > Indeed, we also have this same "iomap valid check" functionality in the
> > writeback code as cached iomaps can become stale due to racing
> > writeback, truncated, etc. But you wouldn't know it by looking at the iomap
> > writeback code - this is currently hidden by XFS by embedding
> > the checks into the iomap writeback ->map_blocks function.
> >
> > That is, the first thing that xfs_map_blocks() does is check if the
> > cached iomap is valid, and if it is valid it returns immediately and
> > the iomap writeback code uses it without question.
> >
> > The reason that this is embedded like this is that the iomap did not
> > have a validity cookie field in it, and so the validity information
> > was wrapped around the outside of the iomap_writepage_ctx and the
> > filesystem has to decode it from that private wrapping structure.
> >
> > However, the validity information iin the structure wrapper is
> > indentical to the iomap validity cookie,
> 
> Then could that part of the xfs code be converted to use
> iomap->validity_cookie so that struct iomap_writepage_ctx can be
> eliminated?

Yes, that is the plan.

> 
> > and so the direction I've
> > been working towards is to replace this implicit, hidden cached
> > iomap validity check with an explicit ->iomap_valid call and then
> > only call ->map_blocks if the validity check fails (or is not
> > implemented).
> >
> > I want to use the same code for all the iomap validity checks in all
> > the iomap core code - this is an iomap issue, the conditions where
> > we need to check for iomap validity are different for depending on
> > the iomap context being run, and the checks are not necessarily
> > dependent on first having locked a folio.
> >
> > Yes, the validity cookie needs to be decoded by the filesystem, but
> > that does not dictate where the validity checking needs to be done
> > by the iomap core.
> >
> > Hence I think removing ->iomap_valid is a big step backwards for the
> > iomap core code - the iomap core needs to be able to formally verify
> > the iomap is valid at any point in time, not just at the point in
> > time a folio in the page cache has been locked...
> 
> We don't need to validate an iomap "at any time". It's two specific
> places in the code in which we need to check, and we're not going to
> end up with ten more such places tomorrow.

Not immediately, but that doesn't change the fact this is not a
filesystem specific issue - it's an inherent characteristic of
cached iomaps and unsynchronised extent state changes that occur
outside exclusive inode->i_rwsem IO context (e.g. in writeback and
IO completion contexts).

Racing mmap + buffered writes can expose these state changes as the
iomap bufferred write IO path is not serialised against the iomap
mmap IO path except via folio locks. Hence a mmap page fault can
invalidate a cached buffered write iomap by causing a hole ->
unwritten, hole -> delalloc or hole -> written conversion in the
middle of the buffered write range. The buffered write still has a
hole mapping cached for that entire range, and it is now incorrect.

If the mmap write happens to change extent state at the trailing
edge of a partial buffered write, data corruption will occur if we
race just right with writeback and memory reclaim. I'm pretty sure
that this corruption can be reporduced on gfs2 if we try hard enough
- generic/346 triggers the mmap/write race condition, all that is
needed from that point is for writeback and reclaiming pages at
exactly the right time...

> I'd prefer to keep those
> filesystem internals in the filesystem specific code instead of
> exposing them to the iomap layer. But that's just me ...

My point is that there is nothing XFS specific about these stale
cached iomap race conditions, nor is it specifically related to
folio locking. The folio locking inversions w.r.t. iomap caching and
the interactions with writeback and reclaim are simply the
manifestation that brought the issue to our attention.

This is why I think hiding iomap validation filesystem specific page
cache allocation/lookup functions is entirely the wrong layer to be
doing iomap validity checks. Especially as it prevents us from
adding more validity checks in the core infrastructure when we need
them in future.

AFAIC, an iomap must carry with it a method for checking
that it is still valid. We need it in the write path, we need it in
the writeback path. If we want to relax the restrictions on clone
operations (e.g. shared locking on the source file), we'll need to
be able to detect stale cached iomaps in those paths, too. And I
haven't really thought through all the implications of shared
locking on buffered writes yet, but that may well require more
checks in other places as well.

> If we ignore this particular commit for now, do you have any
> objections to the patches in this series? If not, it would be great if
> we could add the other patches to iomap-for-next.

I still don't like moving page cache operations into individual
filesystems, but for the moment I can live with the IOMAP_NOCREATE
hack to drill iomap state through the filesystem without the
filesystem being aware of it.

> By the way, I'm still not sure if gfs2 is affected by this whole iomap
> validation drama given that it neither implements unwritten extents
> nor delayed allocation. This is a mess.

See above - I'm pretty sure it will be, but it may be very difficult
to expose. After all, it's taken several years before anyone noticed
this issue with XFS, even though we were aware of the issue of stale
cached iomaps causing data corruption in the writeback path....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

