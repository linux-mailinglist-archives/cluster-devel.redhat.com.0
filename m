Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7163F2F85
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 17:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629473633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AlytKq7WyOzUT/K3H+q4IM3u5JgzyFxG/3NBnWm69Pg=;
	b=Wb3tWbWYRcTSPRCU7xQ6L0MJI+IGeLB3tLz3++E5DW3QKoHN3IsnNCknCsR0wF+LuTkqvj
	bTHY9vnm1wNCKGYd7BkP1Qz7EhAb86NZdvGq48GOJBredkzJFYRGKhDniymxDC3S7a8TY8
	4BLniJ2d5tr+rnNOL6QlRjBLmRxIUEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-fhMExwYTMvS_8G_dIh54qA-1; Fri, 20 Aug 2021 11:33:52 -0400
X-MC-Unique: fhMExwYTMvS_8G_dIh54qA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68AD01082920;
	Fri, 20 Aug 2021 15:33:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5657560CA1;
	Fri, 20 Aug 2021 15:33:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 184E04BB7C;
	Fri, 20 Aug 2021 15:33:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KFX0pV028719 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 11:33:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B05D01182E2; Fri, 20 Aug 2021 15:33:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE081182E7
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:32:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAA79106669A
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:23:08 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-1RbjpoV8MPCF3tXynHCZzA-1; Fri, 20 Aug 2021 11:23:07 -0400
X-MC-Unique: 1RbjpoV8MPCF3tXynHCZzA-1
Received: by mail-wm1-f71.google.com with SMTP id
	z186-20020a1c7ec30000b02902e6a27a9962so4942224wmc.3
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 08:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AlytKq7WyOzUT/K3H+q4IM3u5JgzyFxG/3NBnWm69Pg=;
	b=QAJGUMmcwEzboF/P/+5WWAP2K2W38+TvUxuPAdJzLl7FeF4Lwy3zafhZQNChFzjUM8
	epXC5qtXHEF+nE9CCktxxQeTpYGTUQ/g5b38kA18gcCSn80ZGYQJy2ynhTapRdRE1pIx
	+RG94lKGKI8Tqsw4lBxhGXw9quwhD0Zp3htcBCaqa7F8ERQ7yunAEzLgMNjHF0F2Jg1J
	7S8u+AbYAUWB4iOOqK0fMq2AMRK36V85pcdKSAP6hYAkJaOvK2kxDYAMKy7vJnXJ9ioZ
	0fvVd4velEq4sBfT7k9jrCpeqCWJ7TgW4cvkm6ETW5Cs+eN7d90g4RhPXyBME8AOamE+
	guAA==
X-Gm-Message-State: AOAM530rP54gpi6Pe1pUQ6L4iKTnz3kl0+vF6OVKRW1P/Xu9RU3En2GW
	dh+VR/QI78ZTnPwagqvXn0xLXK77B/JhT9ovd3xX2XenCp6uNu8eGc4JBvjK+6o83xce5DXkwlC
	pBTujU6Ta0RBovb3GqInwZjKLgckTGLKEAXZxCg==
X-Received: by 2002:a7b:c106:: with SMTP id w6mr4615321wmi.152.1629472985921; 
	Fri, 20 Aug 2021 08:23:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUvS40eZJ1ySsWNGqcyFBL2tEQZaB8k3Slyb91HTve5oMdHFCyWX4WR3jQt8qnTrXHAXjGShbj4VZTgbuL91g=
X-Received: by 2002:a7b:c106:: with SMTP id w6mr4615303wmi.152.1629472985719; 
	Fri, 20 Aug 2021 08:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
In-Reply-To: <cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 20 Aug 2021 17:22:54 +0200
Message-ID: <CAHc6FU7EMOEU7C5ryu5pMMx1v+8CTAOMyGdf=wfaw8=TTA_btQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 3:11 PM Bob Peterson <rpeterso@redhat.com> wrote:
> On 8/20/21 4:35 AM, Steven Whitehouse wrote:
> > Hi,
> >
> > On Thu, 2021-08-19 at 21:40 +0200, Andreas Gruenbacher wrote:
> >> From: Bob Peterson <rpeterso@redhat.com>
> >>
> >> This patch introduces a new HIF_MAY_DEMOTE flag and infrastructure
> >> that
> >> will allow glocks to be demoted automatically on locking conflicts.
> >> When a locking request comes in that isn't compatible with the
> >> locking
> >> state of a holder and that holder has the HIF_MAY_DEMOTE flag set,
> >> the
> >> holder will be demoted automatically before the incoming locking
> >> request
> >> is granted.
> >>
> > I'm not sure I understand what is going on here. When there are locking
> > conflicts we generate call backs and those result in glock demotion.
> > There is no need for a flag to indicate that I think, since it is the
> > default behaviour anyway. Or perhaps the explanation is just a bit
> > confusing...
>
> I agree that the whole concept and explanation are confusing. Andreas
> and I went through several heated arguments about the semantics,
> comments, patch descriptions, etc. We played around with many different
> flag name ideas, etc. We did not agree on the best way to describe the
> whole concept. He didn't like my explanation and I didn't like his. So
> yes, it is confusing.
>
> My preferred terminology was "DOD" or "Dequeue On Demand"

... which is useless because it adds no clarity as to whose demand
we're talking about.

> which makes
> the concept more understandable to me. So basically a process can say
> "I need to hold this glock, but for an unknown and possibly lengthy
> period of time, but please feel free to dequeue it if it's in your way."
> And bear in mind that several processes may do the same, simultaneously.
>
> You can almost think of this as a performance enhancement. This concept
> allows a process to hold a glock for much longer periods of time, at a
> lower priority, for example, when gfs2_file_read_iter needs to hold the
> glock for very long-running iterative reads.

Consider a process that allocates a somewhat large buffer and reads
into it in chunks that are not page aligned. The buffer initially
won't be faulted in, so we fault in the first chunk and write into it.
Then, when reading the second chunk, we find that the first page of
the second chunk is already present. We fill it, set the
HIF_MAY_DEMOTE flag, fault in more pages, and clear the HIF_MAY_DEMOTE
flag. If we then still have the glock (which is very likely), we
resume the read. Otherwise, we return a short result.

Thanks,
Andreas

