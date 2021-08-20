Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D0E663F2D64
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 15:48:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629467287;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S4VaO/ZlpDnEtWAJ02e00kwDAMMR+6kRDVmQuNZWgk0=;
	b=Molr3AsQFbvJ9qhhAd8xR4v52p0q+ng1ANjvNwtiRLMV6wSvmTG2f6Wk+PIPy0EdcSb2aA
	XZqCeSrbEXoHdrO9fRCJj1IaX29qOy+FKCgc9rJazqpfEnSQ858n0dyCqJ3Ui4JOmfiCwK
	kISeSyBl/5oCXj3vpMlC/gaITEcgGBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-0pDwRGI7POWoo5hGOMmzqw-1; Fri, 20 Aug 2021 09:48:06 -0400
X-MC-Unique: 0pDwRGI7POWoo5hGOMmzqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B121932484;
	Fri, 20 Aug 2021 13:48:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9735F1AC18;
	Fri, 20 Aug 2021 13:48:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50C9D181A2A5;
	Fri, 20 Aug 2021 13:48:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KDm1ds020746 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 09:48:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D20C6202879F; Fri, 20 Aug 2021 13:48:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC9C32028789
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 13:47:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEF8E96760C
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 13:47:57 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-494-dWW-ABNiO3uCz506LJfzBg-1; Fri, 20 Aug 2021 09:47:56 -0400
X-MC-Unique: dWW-ABNiO3uCz506LJfzBg-1
Received: by mail-ed1-f70.google.com with SMTP id
	b16-20020a0564022790b02903be6352006cso4556036ede.15
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 06:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=S4VaO/ZlpDnEtWAJ02e00kwDAMMR+6kRDVmQuNZWgk0=;
	b=BvNCDMvigj2mogpadb9Y4SBuC6Icye/AFHG3rsQTbh5QnK5rhAVCyXBPfG95kccNhF
	eoiKPY6s4SGXGPr+XUO6F1+V4zcreTKE7WewAf88Y+pI9H+CcdCdjMt8V0hmKM06uMSg
	kurJqqriyyWB1iNAhE7FDe3bNk9aBv6KyFWjJEBM3v53KNTipj5S/Q/7VrhgudQBSMWG
	DtG2GuqlBbnAQ9poKW95IlYrr0beQbbM3oMdCiZtU7vKuuafaOeh8E7V2do12UvL9njS
	merODZ7excxLaQigNGhHcnjEqHeqxB4kqtvT1+egJprR1OzWPKVDp7v/aMRIxInTVa+r
	mbrw==
X-Gm-Message-State: AOAM5331eB7VBEkixXowxBZlJKehEEZsGDitkyVyVIvif0PrCG3HIJtm
	w2tYdhTVDSp2sVu4MxspiLp+XhnUozZihCvCgPs3i75m78ykIKm9d8xAm2494cl/q84qngKpfXy
	pX172pjyXdGTTzXjuFeaFhQ==
X-Received: by 2002:a17:906:c52:: with SMTP id
	t18mr17733339ejf.148.1629467275463; 
	Fri, 20 Aug 2021 06:47:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxGgzFzFSgxvMjImNOJovDn+MR8vHdHX44QmGlTVPfBl8l/23tH/xJ53AhweH4OH2mV6s+mw==
X-Received: by 2002:a17:906:c52:: with SMTP id
	t18mr17733309ejf.148.1629467275222; 
	Fri, 20 Aug 2021 06:47:55 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id
	e22sm3641397edu.35.2021.08.20.06.47.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Aug 2021 06:47:54 -0700 (PDT)
Message-ID: <d5fbfeff64cee4a2045e4e53abbd205618888044.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 20 Aug 2021 14:47:54 +0100
In-Reply-To: <CAHc6FU7jz9z9FEu3gY0S2A2Rv6cQJzp7p_5NOnU3b8Zpz+QsVg@mail.gmail.com>
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<CAHc6FU7jz9z9FEu3gY0S2A2Rv6cQJzp7p_5NOnU3b8Zpz+QsVg@mail.gmail.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>, "Darrick
	J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 10/19] gfs2: Introduce flag for glock
 holder auto-demotion
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2021-08-20 at 15:17 +0200, Andreas Gruenbacher wrote:
> On Fri, Aug 20, 2021 at 11:35 AM Steven Whitehouse <
> swhiteho@redhat.com> wrote:
> > On Thu, 2021-08-19 at 21:40 +0200, Andreas Gruenbacher wrote:
> > > From: Bob Peterson <rpeterso@redhat.com>
> > > 
> > > This patch introduces a new HIF_MAY_DEMOTE flag and
> > > infrastructure
> > > that will allow glocks to be demoted automatically on locking
> > > conflicts.
> > > When a locking request comes in that isn't compatible with the
> > > locking
> > > state of a holder and that holder has the HIF_MAY_DEMOTE flag
> > > set, the
> > > holder will be demoted automatically before the incoming locking
> > > request
> > > is granted.
> > 
> > I'm not sure I understand what is going on here. When there are
> > locking
> > conflicts we generate call backs and those result in glock
> > demotion.
> > There is no need for a flag to indicate that I think, since it is
> > the
> > default behaviour anyway. Or perhaps the explanation is just a bit
> > confusing...
> 
> When a glock has active holders (with the HIF_HOLDER flag set), the
> glock won't be demoted to a state incompatible with any of those
> holders.
> 
Ok, that is a much clearer explanation of what the patch does. Active
holders have always prevented demotions previously.

> > > Processes that allow a glock holder to be taken away indicate
> > > this by
> > > calling gfs2_holder_allow_demote().  When they need the glock
> > > again,
> > > they call gfs2_holder_disallow_demote() and then they check if
> > > the
> > > holder is still queued: if it is, they're still holding the
> > > glock; if
> > > it isn't, they need to re-acquire the glock.
> > > 
> > > This allows processes to hang on to locks that could become part
> > > of a
> > > cyclic locking dependency.  The locks will be given up when a
> > > (rare)
> > > conflicting locking request occurs, and don't need to be given up
> > > prematurely.
> > 
> > This seems backwards to me. We already have the glock layer cache
> > the
> > locks until they are required by another node. We also have the min
> > hold time to make sure that we don't bounce locks too much. So what
> > is
> > the problem that you are trying to solve here I wonder?
> 
> This solves the problem of faulting in pages during read and write
> operations: on the one hand, we want to hold the inode glock across
> those operations. On the other hand, those operations may fault in
> pages, which may require taking the same or other inode glocks,
> directly or indirectly, which can deadlock.
> 
> So before we fault in pages, we indicate with
> gfs2_holder_allow_demote(gh) that we can cope if the glock is taken
> away from us. After faulting in the pages, we indicate with
> gfs2_holder_disallow_demote(gh) that we now actually need the glock
> again. At that point, we either still have the glock (i.e., the
> holder
> is still queued and it has the HIF_HOLDER flag set), or we don't.
> 
> The different kinds of read and write operations differ in how they
> handle the latter case:
> 
>  * When a buffered read or write loses the inode glock, it returns a
> short result. This
>    prevents torn writes and reading things that have never existed on
> disk in that form.
> 
>  * When a direct read or write loses the inode glock, it re-acquires
> it before resuming
>    the operation. Direct I/O is not expected to return partial
> results
> and doesn't provide
>    any kind of synchronization among processes.
> 
> We could solve this kind of problem in other ways, for example, by
> keeping a glock generation number, dropping the glock before faulting
> in pages, re-acquiring it afterwards, and checking if the generation
> number has changed. This would still be an additional piece of glock
> infrastructure, but more heavyweight than the HIF_MAY_DEMOTE flag
> which uses the existing glock holder infrastructure.

This is working towards the "why" but could probably be summarised a
bit more. We always used to manage to avoid holding fs locks when
copying to/from userspace to avoid these complications. If that is no
longer possible then it would be good to document what the new
expectations are somewhere suitable in Documentation/filesystems/...
just so we make sure it is clear what the new system is, and everyone
will be on the same page,

Steve.



