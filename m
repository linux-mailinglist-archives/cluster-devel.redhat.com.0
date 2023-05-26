Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB237711B00
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 02:05:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685059550;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ic3WsKMPF4rIwx8HLozqrwGou1Sinksz8ctxoPlHRzI=;
	b=iaetKqamMIZG6IwfXpqos8j/GvOgfyeJYy82NPLp/HYvn1diiMxrGIhMndnFv5skDI+aJ8
	Nu91IYPK9NP7ZxLJjQRPM24ZO+EfrX9bwsYqASKNv6+N9Ovy+FRzXDkphVBZvqKl08Bvhs
	nVKBUZhsdhxQqHaNfGzK53HamWqUxtw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-6Y9XNlLNM_WiuJRArOQHWw-1; Thu, 25 May 2023 20:05:46 -0400
X-MC-Unique: 6Y9XNlLNM_WiuJRArOQHWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B11EA811E78;
	Fri, 26 May 2023 00:05:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15C63C15612;
	Fri, 26 May 2023 00:05:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB43819465B1;
	Fri, 26 May 2023 00:05:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 88F1519465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 26 May 2023 00:05:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 754041121319; Fri, 26 May 2023 00:05:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DE4C1121315
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 00:05:43 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52EE0185A78F
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 00:05:43 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-5t0uV-2mNk2zTJ91iTuayA-1; Thu, 25 May 2023 20:05:39 -0400
X-MC-Unique: 5t0uV-2mNk2zTJ91iTuayA-1
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2af290cf9b7so1287441fa.3; 
 Thu, 25 May 2023 17:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685059538; x=1687651538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ic3WsKMPF4rIwx8HLozqrwGou1Sinksz8ctxoPlHRzI=;
 b=cVFaKrKjRXNIbVftTy74l2Jldgj1OfBbJhV/FZZFiW0VGnO/++pqzmg9ZxlGnO5Esz
 SCNIt3NN3ul1WYmr4XOslXYpsbTV0nC65zvDVFp5qIr4ondgbco6IR4RzExGVS2cThJ1
 IgYIatWGFMSeuhgMFBsyprto9JbmnG10eagf5APhDfrP2nTYxNKQQxkpZPJ7FPE2sbEn
 N0REVck9K3uh6QOkuJpNdm95uHBEwQQU8j3EIS2FY/rkXOWaQ22fOfU3rJfjLGg5LlMt
 bwcBfwIAlv/IWy0L2/okKthtQPDWGwjZbkeyqYGpGcwwGR78D+W37cwVpYXioPaP+3aP
 zt5A==
X-Gm-Message-State: AC+VfDwaaUHoerIr8Z2yz6CVJh29DwbloY0wdTNlxnSXLD9w6ZhUi4V4
 y9fCCu2VkcKPNBwBWyZ0hBFqWqG2YQUhXTMx1Ts=
X-Google-Smtp-Source: ACHHUZ5dyQnqqW3d2AY3VwNHX1NgTJhmX4caiv5qKE0Ob10OKJQ2PB4+pFN90Hr2dqWkK5yTnNafRoVfxUawlRpyKx4=
X-Received: by 2002:a2e:9557:0:b0:2ad:d6cd:efdd with SMTP id
 t23-20020a2e9557000000b002add6cdefddmr79186ljh.32.1685059537431; Thu, 25 May
 2023 17:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan> <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org>
 <CAHpGcML0CZ1RGkOf26iYt_tK0Ux=cfdW8d3bjMVbjXLr91cs+g@mail.gmail.com>
 <ZG/tTorh8G2919Jz@moria.home.lan>
In-Reply-To: <ZG/tTorh8G2919Jz@moria.home.lan>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 26 May 2023 02:05:26 +0200
Message-ID: <CAHpGcMKQke0f5-y6fg3O5dBwcTYX69dEbxZgDiFABgOLCc+zGw@mail.gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
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
Cc: cluster-devel@redhat.com, dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Fr., 26. Mai 2023 um 01:20 Uhr schrieb Kent Overstreet
<kent.overstreet@linux.dev>:
> On Fri, May 26, 2023 at 12:25:31AM +0200, Andreas Gr=C3=BCnbacher wrote:
> > Am Di., 23. Mai 2023 um 18:28 Uhr schrieb Christoph Hellwig <hch@infrad=
ead.org>:
> > > On Tue, May 23, 2023 at 03:34:31PM +0200, Jan Kara wrote:
> > > > I've checked the code and AFAICT it is all indeed handled. BTW, I'v=
e now
> > > > remembered that GFS2 has dealt with the same deadlocks - b01b2d72da=
25
> > > > ("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a dif=
ferent
> > > > way (by prefaulting pages from the iter before grabbing the problem=
atic
> > > > lock and then disabling page faults for the iomap_dio_rw() call). I=
 guess
> > > > we should somehow unify these schemes so that we don't have two mec=
hanisms
> > > > for avoiding exactly the same deadlock. Adding GFS2 guys to CC.
> > > >
> > > > Also good that you've written a fstest for this, that is definitely=
 a useful
> > > > addition, although I suspect GFS2 guys added a test for this not so=
 long
> > > > ago when testing their stuff. Maybe they have a pointer handy?
> > >
> > > generic/708 is the btrfs version of this.
> > >
> > > But I think all of the file systems that have this deadlock are actua=
lly
> > > fundamentally broken because they have a mess up locking hierarchy
> > > where page faults take the same lock that is held over the the direct=
 I/
> > > operation.  And the right thing is to fix this.  I have work in progr=
ess
> > > for btrfs, and something similar should apply to gfs2, with the added
> > > complication that it probably means a revision to their network
> > > protocol.
> >
> > We do disable page faults, and there can be deadlocks in page fault
> > handlers while no page faults are allowed.
> >
> > I'm roughly aware of the locking hierarchy that other filesystems use,
> > and that's something we want to avoid because of two reasons: (1) it
> > would be an incompatible change, and (2) we want to avoid cluster-wide
> > locking operations as much as possible because they are very slow.
> >
> > These kinds of locking conflicts are so rare in practice that the
> > theoretical inefficiency of having to retry the operation doesn't
> > matter.
>
> Would you be willing to expand on that? I'm wondering if this would
> simplify things for gfs2, but you mention locking heirarchy being an
> incompatible change - how does that work?

Oh, it's just that gfs2 uses one dlm lock per inode to control access
to that inode. In the code, this is called the "inode glock" ---
glocks being an abstraction above dlm locks --- but it boils down to
dlm locks in the end. An additional layer of locking will only work
correctly if all cluster nodes use the new locks consistently, so old
cluster nodes will become incompatible. Those kinds of changes are
hard.

But the additional lock taking would also hurt performance, forever,
and I'd really like to avoid taking that hit.

It may not be obvious to everyone, but allowing page faults during
reads and writes (i.e., while holding dlm locks) can lead to
distributed deadlocks. We cannot just pretend to be a local
filesystem.

Thanks,
Andreas

> > > I'm absolutely not in favour to add workarounds for thes kind of lock=
ing
> > > problems to the core kernel.  I already feel bad for allowing the
> > > small workaround in iomap for btrfs, as just fixing the locking back
> > > then would have avoid massive ratholing.
> >
> > Please let me know when those btrfs changes are in a presentable shape =
...
>
> I would also be curious to know what btrfs needs and what the approach
> is there.

