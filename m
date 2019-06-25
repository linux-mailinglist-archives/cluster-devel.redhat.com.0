Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A5253004
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 12:36:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD751308FBB1;
	Tue, 25 Jun 2019 10:36:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A941F600CD;
	Tue, 25 Jun 2019 10:36:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA85C1806B16;
	Tue, 25 Jun 2019 10:36:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PAaXVK003663 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 06:36:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D6B55DA34; Tue, 25 Jun 2019 10:36:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42E865D9C5;
	Tue, 25 Jun 2019 10:36:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B17F309266D;
	Tue, 25 Jun 2019 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=udd2XNj0YQOu5KwyPQP6GFnOEKmvMvFG7ADPEjU+Kkg=;
	b=WTUrhABTI+04Ecv/wTwMGFqws
	h83jvImwQjRmpyswq4BLoUHmZ/DO4bIEFAWliQdhwR/IO5JwBpD6O9oUE9Yt3/EcpTG5W4F2mq7SF
	c7WS4oVyW9z145U5z78har86EvY1kK6Lil5ieALtK5onJber42zkPbtfhiair4Re5myMU3gel2cqN
	uf9du978Erbf8539T8MoEAoS+G4wKslSYBqFobc7ljDTEpU1p7Mn56HfucBU9QbV6NE5dRj+JG3Ud
	4UM2Y/FCVMBrsWlW8F5U1zQyfO9PgP1dZ1yVWXeHngUJ2VaQczuyJ2JukZNJjtMD8Unmum78t1eK+
	pqthdEtBg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=hirez.programming.kicks-ass.net)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hfimX-0008Ce-Ev; Tue, 25 Jun 2019 10:34:33 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 11FC12063D031; Tue, 25 Jun 2019 12:34:30 +0200 (CEST)
Date: Tue, 25 Jun 2019 12:34:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190625103430.GW3402@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
	<CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Tue, 25 Jun 2019 10:36:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 25 Jun 2019 10:36:23 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'peterz@infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org <peterz@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 25 Jun 2019 10:36:46 +0000 (UTC)

On Tue, Jun 25, 2019 at 11:19:35AM +0200, Andreas Gruenbacher wrote:
> > diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> > index cf4c767005b1..666629ea5da7 100644
> > --- a/fs/gfs2/glops.c
> > +++ b/fs/gfs2/glops.c
> > @@ -227,6 +227,7 @@ static void gfs2_clear_glop_pending(struct gfs2_inode *ip)
> >                 return;
> >
> >         clear_bit_unlock(GIF_GLOP_PENDING, &ip->i_flags);
> > +       smp_mb__after_atomic();
> >         wake_up_bit(&ip->i_flags, GIF_GLOP_PENDING);
> 
> This should become clear_and_wake_up_bit as well, right? There are
> several more instances of the same pattern.

Only if we do as David suggested and make clean_and_wake_up_bit()
provide the RELEASE barrier.

That is, currently clear_and_wake_up_bit() is

	clear_bit()
	smp_mb__after_atomic();
	wake_up_bit();

But the above is:

	clear_bit_unlock();
	smp_mb__after_atomic();
	wake_up_bit()

the difference is that _unlock() uses RELEASE semantics, where
clear_bit() does not.

The difference is illustrated with something like:

	cond = true;
	clear_bit()
	smp_mb__after_atomic();
	wake_up_bit();

In this case, a remote CPU can first observe the clear_bit() and then
the 'cond = true' store. When we use clear_bit_unlock() this is not
possible, because the RELEASE barrier ensures that everything before,
stays before.

> >  }
> >

