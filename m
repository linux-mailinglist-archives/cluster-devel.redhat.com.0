Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D217866368C
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Jan 2023 02:09:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673312970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TmqhirOzDDtXwmx0NLp7blV5Oej3y3710g9PHT0bb28=;
	b=XKQFf+wvyUU0puGPNPmnSEGrtKlr6JovT5zEJCxB7Q5wD804Q3JDT1eGICXnSuyvdWV8t/
	dSnewJVrJFhCyA4dSiMrA3OR9n0hjJZL+rCD2gE87eT3PaIf65RnNpsYmHRwYnPGc0/EU4
	LAKUNpAWc51wJUqGRFuziNvWpkbnDg0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-o2GKSBAiOxm31KLf0cm7Dw-1; Mon, 09 Jan 2023 20:09:27 -0500
X-MC-Unique: o2GKSBAiOxm31KLf0cm7Dw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6B483C0F42C;
	Tue, 10 Jan 2023 01:09:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51DDE2166B26;
	Tue, 10 Jan 2023 01:09:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E203F1949751;
	Tue, 10 Jan 2023 01:09:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8DB41946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 01:09:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98049140EBF6; Tue, 10 Jan 2023 01:09:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F806140EBF5
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 01:09:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 746368027FE
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 01:09:22 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-7sDudim9NnmCRtIHpayP5g-1; Mon, 09 Jan 2023 20:09:20 -0500
X-MC-Unique: 7sDudim9NnmCRtIHpayP5g-1
Received: by mail-qt1-f173.google.com with SMTP id a25so2579834qto.10;
 Mon, 09 Jan 2023 17:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TmqhirOzDDtXwmx0NLp7blV5Oej3y3710g9PHT0bb28=;
 b=tmYdOrkGIOU7VI2k2M55u2o+HucaJDcN2pXrJPe0m5dMcUMxrs9zgYrZcBRI+v3O0B
 zwpkxe8oLiKMRoynm9R0Ty756YSkuQ/Hp495q/u5gXKy1yFW+AmDgvDtWsV5fxU8zDkW
 Itogbxw++/d+3gKUJ2i9V6Dfi1tvcgzQE1c26nxkOesXf+rEotdhJ9pygGHgjrOWGZJr
 1+BGsm+7T8XH4BtFIXss+QwrKuEK6ITpB0CMGXzuRhH0olKal2ac1ZHHomVew+I/+Zk+
 AaC3aolT905+NAxxzYf/lgi433aVQBF0fp1eaks0MCm1e7b/semIjyEC06kVSE5LGejw
 aXKQ==
X-Gm-Message-State: AFqh2kp2TMhLZG0ye3n2Hox9wLr1dhzvtRLLNvLRExsxshp1KPQVmq/f
 LIazBYuG17uZ2ntageCqFZny9ZZtT77NG30uwlhWDNGE
X-Google-Smtp-Source: AMrXdXvk+K4+RN3tksqs1kPiKxsE5twKa+IITgQYkpfdHl8tgruIF9hA02G+Kj1rZ2Be7H2YickOaHkuNAknqvCwYGQ=
X-Received: by 2002:a05:622a:4a8f:b0:3a6:7f4e:764c with SMTP id
 fw15-20020a05622a4a8f00b003a67f4e764cmr1827398qtb.114.1673312960048; Mon, 09
 Jan 2023 17:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
 <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
 <20230109225453.GQ1971568@dread.disaster.area>
In-Reply-To: <20230109225453.GQ1971568@dread.disaster.area>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 10 Jan 2023 02:09:07 +0100
Message-ID: <CAHpGcM+urV5LYpTZQWTRoK6VWaLx0sxk3mDe_kd3VznMY9woVw@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mo., 9. Jan. 2023 um 23:58 Uhr schrieb Dave Chinner <david@fromorbit.com>:
> On Mon, Jan 09, 2023 at 07:45:27PM +0100, Andreas Gruenbacher wrote:
> > On Sun, Jan 8, 2023 at 10:59 PM Dave Chinner <david@fromorbit.com> wrote:
> > > On Sun, Jan 08, 2023 at 08:40:32PM +0100, Andreas Gruenbacher wrote:
> > > > Eliminate the ->iomap_valid() handler by switching to a ->get_folio()
> > > > handler and validating the mapping there.
> > > >
> > > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > >
> > > I think this is wrong.
> > >
> > > The ->iomap_valid() function handles a fundamental architectural
> > > issue with cached iomaps: the iomap can become stale at any time
> > > whilst it is in use by the iomap core code.
> > >
> > > The current problem it solves in the iomap_write_begin() path has to
> > > do with writeback and memory reclaim races over unwritten extents,
> > > but the general case is that we must be able to check the iomap
> > > at any point in time to assess it's validity.
> > >
> > > Indeed, we also have this same "iomap valid check" functionality in the
> > > writeback code as cached iomaps can become stale due to racing
> > > writeback, truncated, etc. But you wouldn't know it by looking at the iomap
> > > writeback code - this is currently hidden by XFS by embedding
> > > the checks into the iomap writeback ->map_blocks function.
> > >
> > > That is, the first thing that xfs_map_blocks() does is check if the
> > > cached iomap is valid, and if it is valid it returns immediately and
> > > the iomap writeback code uses it without question.
> > >
> > > The reason that this is embedded like this is that the iomap did not
> > > have a validity cookie field in it, and so the validity information
> > > was wrapped around the outside of the iomap_writepage_ctx and the
> > > filesystem has to decode it from that private wrapping structure.
> > >
> > > However, the validity information iin the structure wrapper is
> > > indentical to the iomap validity cookie,
> >
> > Then could that part of the xfs code be converted to use
> > iomap->validity_cookie so that struct iomap_writepage_ctx can be
> > eliminated?
>
> Yes, that is the plan.
>
> >
> > > and so the direction I've
> > > been working towards is to replace this implicit, hidden cached
> > > iomap validity check with an explicit ->iomap_valid call and then
> > > only call ->map_blocks if the validity check fails (or is not
> > > implemented).
> > >
> > > I want to use the same code for all the iomap validity checks in all
> > > the iomap core code - this is an iomap issue, the conditions where
> > > we need to check for iomap validity are different for depending on
> > > the iomap context being run, and the checks are not necessarily
> > > dependent on first having locked a folio.
> > >
> > > Yes, the validity cookie needs to be decoded by the filesystem, but
> > > that does not dictate where the validity checking needs to be done
> > > by the iomap core.
> > >
> > > Hence I think removing ->iomap_valid is a big step backwards for the
> > > iomap core code - the iomap core needs to be able to formally verify
> > > the iomap is valid at any point in time, not just at the point in
> > > time a folio in the page cache has been locked...
> >
> > We don't need to validate an iomap "at any time". It's two specific
> > places in the code in which we need to check, and we're not going to
> > end up with ten more such places tomorrow.
>
> Not immediately, but that doesn't change the fact this is not a
> filesystem specific issue - it's an inherent characteristic of
> cached iomaps and unsynchronised extent state changes that occur
> outside exclusive inode->i_rwsem IO context (e.g. in writeback and
> IO completion contexts).
>
> Racing mmap + buffered writes can expose these state changes as the
> iomap bufferred write IO path is not serialised against the iomap
> mmap IO path except via folio locks. Hence a mmap page fault can
> invalidate a cached buffered write iomap by causing a hole ->
> unwritten, hole -> delalloc or hole -> written conversion in the
> middle of the buffered write range. The buffered write still has a
> hole mapping cached for that entire range, and it is now incorrect.
>
> If the mmap write happens to change extent state at the trailing
> edge of a partial buffered write, data corruption will occur if we
> race just right with writeback and memory reclaim. I'm pretty sure
> that this corruption can be reporduced on gfs2 if we try hard enough
> - generic/346 triggers the mmap/write race condition, all that is
> needed from that point is for writeback and reclaiming pages at
> exactly the right time...
>
> > I'd prefer to keep those
> > filesystem internals in the filesystem specific code instead of
> > exposing them to the iomap layer. But that's just me ...
>
> My point is that there is nothing XFS specific about these stale
> cached iomap race conditions, nor is it specifically related to
> folio locking. The folio locking inversions w.r.t. iomap caching and
> the interactions with writeback and reclaim are simply the
> manifestation that brought the issue to our attention.
>
> This is why I think hiding iomap validation filesystem specific page
> cache allocation/lookup functions is entirely the wrong layer to be
> doing iomap validity checks. Especially as it prevents us from
> adding more validity checks in the core infrastructure when we need
> them in future.
>
> AFAIC, an iomap must carry with it a method for checking
> that it is still valid. We need it in the write path, we need it in
> the writeback path. If we want to relax the restrictions on clone
> operations (e.g. shared locking on the source file), we'll need to
> be able to detect stale cached iomaps in those paths, too. And I
> haven't really thought through all the implications of shared
> locking on buffered writes yet, but that may well require more
> checks in other places as well.
>
> > If we ignore this particular commit for now, do you have any
> > objections to the patches in this series? If not, it would be great if
> > we could add the other patches to iomap-for-next.
>
> I still don't like moving page cache operations into individual
> filesystems, but for the moment I can live with the IOMAP_NOCREATE
> hack to drill iomap state through the filesystem without the
> filesystem being aware of it.

Alright, works for me. Darrick?

> > By the way, I'm still not sure if gfs2 is affected by this whole iomap
> > validation drama given that it neither implements unwritten extents
> > nor delayed allocation. This is a mess.
>
> See above - I'm pretty sure it will be, but it may be very difficult
> to expose. After all, it's taken several years before anyone noticed
> this issue with XFS, even though we were aware of the issue of stale
> cached iomaps causing data corruption in the writeback path....

Okay, that's all pretty ugly. Thanks a lot for the detailed explanation.

Cheers,
Andreas

> Cheers,
>
> Dave.
> --
> Dave Chinner
> david@fromorbit.com

