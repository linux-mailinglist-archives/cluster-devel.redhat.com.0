Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC60405BDB
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Sep 2021 19:17:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-5ccfs5rgMkKKWvPwxM3EWA-1; Thu, 09 Sep 2021 13:17:57 -0400
X-MC-Unique: 5ccfs5rgMkKKWvPwxM3EWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C57B8C8969;
	Thu,  9 Sep 2021 17:17:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDFBB5D9F4;
	Thu,  9 Sep 2021 17:17:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F48D1800FE4;
	Thu,  9 Sep 2021 17:17:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 189HHjOU015723 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Sep 2021 13:17:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31C492051B6C; Thu,  9 Sep 2021 17:17:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ADAB2051B69
	for <cluster-devel@redhat.com>; Thu,  9 Sep 2021 17:17:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F624800182
	for <cluster-devel@redhat.com>; Thu,  9 Sep 2021 17:17:36 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-434-7jbdlTwhMhSUyUGVUTiYVg-1; Thu, 09 Sep 2021 13:17:35 -0400
X-MC-Unique: 7jbdlTwhMhSUyUGVUTiYVg-1
Received: by mail-lf1-f47.google.com with SMTP id e23so5101805lfj.9
	for <cluster-devel@redhat.com>; Thu, 09 Sep 2021 10:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jlWzkECk20+XqmMBmmlhgHERfUmOY5RNnADt8Z36qog=;
	b=p6rkHITQUggEVBTYWTYbNl5T8H5m9jK44hq3ZqsTRLTs7Xfy1jsNiJpakleRZeXuL0
	49c7dF/b9MlP+kV4Zi3Ca+UXoI7vhvLPjJdyfphvBsRPKjYe40yLKuTjEA+wTSY1IV6C
	iqJjFxhkrpOwREoGyzthTL6mBSu7gHz/mWO+uB1CkclzsAXJlm9HGt8kiHKP1R1Qdkne
	2WoS02/IXP4Nvu/PwdOege+hzPOV7CMuuBj1VYaQvywNqvMu971Vp3GJ+W1wggtAgHxH
	bqDKnhK0w3AL+MVU+OvnPC/rAYbYyxl93rRH30ZwjsTubPnJIG9JOFqzaKUQFgtqEW9n
	nThQ==
X-Gm-Message-State: AOAM532k1lpSCVK3Up+NednaajFMLwmgCkN17vmt/ebQTBjzXMHUxc7Z
	8bytqrrZ1wOUvb9Fzs3Bpmwa2ZYE/aACNikwmRI=
X-Google-Smtp-Source: ABdhPJzDS2hULQp16ywbQu6nb/oWAKUWs4Anw0wWLtpws6ClYxw099Jn2s3yYEYhpwh+Zbj6aEY12A==
X-Received: by 2002:ac2:5f1b:: with SMTP id 27mr717563lfq.79.1631207851708;
	Thu, 09 Sep 2021 10:17:31 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
	[209.85.208.175])
	by smtp.gmail.com with ESMTPSA id z4sm257033lfd.298.2021.09.09.10.17.30
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Sep 2021 10:17:30 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id i28so4113114ljm.7
	for <cluster-devel@redhat.com>; Thu, 09 Sep 2021 10:17:30 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr734988ljg.31.1631207850194;
	Thu, 09 Sep 2021 10:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-18-agruenba@redhat.com>
	<YTnxruxm/xA/BBmQ@infradead.org>
In-Reply-To: <YTnxruxm/xA/BBmQ@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Sep 2021 10:17:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4RER3XeG34nLH2PgvuRuj_NRgDx=wLTKv=jYaQnFe+Q@mail.gmail.com>
Message-ID: <CAHk-=wj4RER3XeG34nLH2PgvuRuj_NRgDx=wLTKv=jYaQnFe+Q@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 17/19] gup: Introduce FOLL_NOFAULT
	flag to disable page faults
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 9, 2021 at 4:36 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Aug 27, 2021 at 06:49:24PM +0200, Andreas Gruenbacher wrote:
> > Introduce a new FOLL_NOFAULT flag that causes get_user_pages to return
> > -EFAULT when it would otherwise trigger a page fault.  This is roughly
> > similar to FOLL_FAST_ONLY but available on all architectures, and less
> > fragile.
>
> So, FOLL_FAST_ONLY only has one single user through
> get_user_pages_fast_only (pin_user_pages_fast_only is entirely unused,
> which makes totally sense given that give up on fault and pin are not
> exactly useful semantics).

So I think we should treat FOLL_FAST_ONLY as a special "internal to
gup.c" flag, and perhaps not really compare it to the new
FOLL_NOFAULT.

In fact, maybe we could even just make FOLL_FAST_ONLY be the high bit,
and not expose it in <linux/mm.h> and make it entirely private as a
name in gup.c.

Because FOLL_FAST_ONLY really is meant more as a "this way we can
share code easily inside gup.c, by having the internal helpers that
*can* do everything, but not do it all when the user is one of the
limited interfaces".

Because we don't really expect people to use FOLL_FAST_ONLY externally
- they'll use the explicit interfaces we have instead (ie
"get_user_pages_fast()"). Those use-cases that want that fast-only
thing really are so special that they need to be very explicitly so.

FOLL_NOFAULT is different, in that that is something an external user
_would_ use.

Admittedly we'd only have one single case for now, but I think we may
end up with other filesystems - or other cases entirely - having that
same kind of "I am holding locks, so I can't fault into the MM, but
I'm otherwise ok with the immediate mmap_sem lock usage and sleeping".

End result: FOLL_FAST_ONLY and FOLL_NOFAULT have some similarities,
but at the same time I think they are fundamentally different.

The FAST_ONLY is the very very special "I can't sleep, I can't even
take the fundamental MM lock, and we export special interfaces because
it's _so_ special and can be used in interrupts etc".

In contrast, NOFAULT is not _that_ special. It's just another flag,
and has generic use.

               Linus

