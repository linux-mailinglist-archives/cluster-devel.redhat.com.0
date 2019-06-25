Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42754EA2
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 14:16:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D5328830C;
	Tue, 25 Jun 2019 12:16:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 865E06085B;
	Tue, 25 Jun 2019 12:16:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E1A11806B18;
	Tue, 25 Jun 2019 12:16:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PCCc8u013681 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 08:12:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9517600CD; Tue, 25 Jun 2019 12:12:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F06600C7
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 12:12:34 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A4F65277D
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 12:12:34 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id 186so4634563oid.17
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 05:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xtX13vSVbmx57mGL/Q0hXK8kpnRo7HFPa5oOdLxipaM=;
	b=fa0RBgRBKATPx3KM2wpPjhhSJOa9hIUTRNsaKI0+Sa7aZ3Hn9jU/whv024713VIPnB
	GRWFxx1Yg7Pb0lAguBV5utHQA9XwZ4Jqi4QgprEN8zqWuNIRf6B5vaWg0n1HYcnhKKJA
	FxWTzBDN5k+Ou5Cjylrinbw1cg0OBAweP3RzVkzca4amis6OYZo2lJUZQtuOFBJnUEO6
	hgI+4vLmQxwCNXwF9+9BTgMDtScbiWLnVrNVH6jY83PoSt3xm/zSqYjcz8jPL/8bHXGN
	Y92yGZyQqXS95eyZE+c6TftXCUknTen+XG+HBuItwfQBzBBd/5/rRCc30za2A+kx7fDY
	7+wg==
X-Gm-Message-State: APjAAAUqWbin0BNgJQNu4sAX5fNrgCAaTWRjkO7z4dorlDIHgNcuFGlf
	kdV3kvcVezqhskFLnRLaVMny/KwuprGNxgFecxWNnD572GI/o28dpktCslWnR7EpWQCTviuvMzJ
	rgbpK2b1rRi/bwingkBXMhp8pA5/glUV95jcTcA==
X-Received: by 2002:aca:b58b:: with SMTP id
	e133mr14183010oif.147.1561464753895; 
	Tue, 25 Jun 2019 05:12:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIF0shhnL3kTWbxYnFTIfJoQ9NWdzzlYJbdr7wT1RELz57W5jZU6ihqAiJYZbsgta0nM0Q5SDLuZyhNwwIoP0=
X-Received: by 2002:aca:b58b:: with SMTP id
	e133mr14182998oif.147.1561464753642; 
	Tue, 25 Jun 2019 05:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
	<CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
	<20190625103430.GW3402@hirez.programming.kicks-ass.net>
In-Reply-To: <20190625103430.GW3402@hirez.programming.kicks-ass.net>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 25 Jun 2019 14:12:22 +0200
Message-ID: <CAHc6FU6zUCdQZ1AfN2KYcPYVKc5bwvc0bD7=-KZpFXws+F9QZQ@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Martin Brandenburg <martin@omnibond.com>, linux-cachefs@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, linux-aio@kvack.org,
	David Airlie <airlied@linux.ie>,
	samba-technical <samba-technical@lists.samba.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	dm-devel@redhat.com, keyrings@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	James Morris <jmorris@namei.org>, cluster-devel <cluster-devel@redhat.com>,
	Antti Palosaari <crope@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>,
	Paul McKenney <paulmck@linux.vnet.ibm.com>,
	intel-gfx@lists.freedesktop.org, devel@lists.orangefs.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mediatek@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
	MauroCarvalho Chehab <mchehab@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-arm-kernel@lists.infradead.org,
	"J. Bruce Fields" <bfields@fieldses.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	netdev@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>, Steve French <sfrench@samba.org>,
	linux-bluetooth@vger.kernel.org,
	LSM <linux-security-module@vger.kernel.org>,
	Benjamin LaHaise <bcrl@kvack.org>,
	Daniel Vetter <daniel@ffwll.ch>, linux-media@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [RFC][PATCH] wake_up_var() memory ordering
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 25 Jun 2019 12:16:48 +0000 (UTC)

On Tue, 25 Jun 2019 at 12:36, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Jun 25, 2019 at 11:19:35AM +0200, Andreas Gruenbacher wrote:
> > > diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> > > index cf4c767005b1..666629ea5da7 100644
> > > --- a/fs/gfs2/glops.c
> > > +++ b/fs/gfs2/glops.c
> > > @@ -227,6 +227,7 @@ static void gfs2_clear_glop_pending(struct gfs2_inode *ip)
> > >                 return;
> > >
> > >         clear_bit_unlock(GIF_GLOP_PENDING, &ip->i_flags);
> > > +       smp_mb__after_atomic();
> > >         wake_up_bit(&ip->i_flags, GIF_GLOP_PENDING);
> >
> > This should become clear_and_wake_up_bit as well, right? There are
> > several more instances of the same pattern.
>
> Only if we do as David suggested and make clean_and_wake_up_bit()
> provide the RELEASE barrier.

(It's clear_and_wake_up_bit, not clean_and_wake_up_bit.)

> That is, currently clear_and_wake_up_bit() is
>
>         clear_bit()
>         smp_mb__after_atomic();
>         wake_up_bit();
>
> But the above is:
>
>         clear_bit_unlock();
>         smp_mb__after_atomic();
>         wake_up_bit()
>
> the difference is that _unlock() uses RELEASE semantics, where
> clear_bit() does not.
>
> The difference is illustrated with something like:
>
>         cond = true;
>         clear_bit()
>         smp_mb__after_atomic();
>         wake_up_bit();
>
> In this case, a remote CPU can first observe the clear_bit() and then
> the 'cond = true' store. When we use clear_bit_unlock() this is not
> possible, because the RELEASE barrier ensures that everything before,
> stays before.

Now I'm confused because clear_and_wake_up_bit() in mainline does use
clear_bit_unlock(), so it's the exact opposite of what you just said.

Thanks,
Andreas

