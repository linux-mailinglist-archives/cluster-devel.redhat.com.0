Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B25263A
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 10:15:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA44A30BB557;
	Tue, 25 Jun 2019 08:15:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 930A01001DFD;
	Tue, 25 Jun 2019 08:14:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74CC91806B18;
	Tue, 25 Jun 2019 08:14:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5P8E7I9011988 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 04:14:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89D405D71A; Tue, 25 Jun 2019 08:14:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 670905D70D;
	Tue, 25 Jun 2019 08:13:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BBF180F81;
	Tue, 25 Jun 2019 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FeL4YGXndhcHsWSAlte0b7Wx3ZKgDBGUgp4zwa60pPc=;
	b=tuUzdHIExne/eeS1c00vc7gjS
	AB3LJq0ZQ++Fg6J9CyRBrX4gTrDnwlDJ/Tlg4VwE9EZRX0L7mpJs2iWaNLbecP/UkjiJXVhaFuinv
	efEBhY3azsP53SGPaXLJ7K4+xH3UrVJBVbab7TYd/NhRi4NM6b2joLRQHY3MMZZkKc+ZdLVuLI7OE
	dre6EZ2IAwApDLiwNd+y6XYWNYjwUZwMMPYQNsdKeZs0D9c7jfiuKmdqNZ4YkOKC/SzkotBgMJg+i
	24yIjZQ5KzGpb++2nZrAY8EI3/jnnNxtQW1CqqPB5Krupk3Igd6R4aRfeq60YT3cfWKiHmI6GoOIp
	WwO2NS7gw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=hirez.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hfgXg-0003Dx-KG; Tue, 25 Jun 2019 08:11:04 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 56053209FFF54; Tue, 25 Jun 2019 10:11:03 +0200 (CEST)
Date: Tue, 25 Jun 2019 10:11:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20190625081103.GU3436@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
	<32379.1561449061@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32379.1561449061@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Tue, 25 Jun 2019 08:13:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 25 Jun 2019 08:13:45 +0000 (UTC) for IP:'205.233.59.134'
	DOMAIN:'merlin.infradead.org' HELO:'merlin.infradead.org'
	FROM:'peterz@infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 205.233.59.134 merlin.infradead.org 205.233.59.134
	merlin.infradead.org <peterz@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Martin Brandenburg <martin@omnibond.com>, Mike Snitzer <snitzer@redhat.com>,
	linux-aio@kvack.org, David Airlie <airlied@linux.ie>,
	samba-technical@lists.samba.org,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
	"J. Bruce Fields" <bfields@fieldses.org>,
	Chris Mason <clm@fb.com>, dm-devel@redhat.com,
	keyrings@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
	Antti Palosaari <crope@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>,
	Paul McKenney <paulmck@linux.vnet.ibm.com>,
	intel-gfx@lists.freedesktop.org, devel@lists.orangefs.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
	MauroCarvalho Chehab <mchehab@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-arm-kernel@lists.infradead.org, linux-cachefs@redhat.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, Steve French <sfrench@samba.org>,
	linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 25 Jun 2019 08:15:07 +0000 (UTC)


(sorry for cross-posting to moderated lists btw, I've since
 acquired a patch to get_maintainers.pl that wil exclude them
 in the future)

On Tue, Jun 25, 2019 at 08:51:01AM +0100, David Howells wrote:
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > I tried using wake_up_var() today and accidentally noticed that it
> > didn't imply an smp_mb() and specifically requires it through
> > wake_up_bit() / waitqueue_active().
> 
> Thinking about it again, I'm not sure why you need to add the barrier when
> wake_up() (which this is a wrapper around) is required to impose a barrier at
> the front if there's anything to wake up (ie. the wait queue isn't empty).
> 
> If this is insufficient, does it make sense just to have wake_up*() functions
> do an unconditional release or full barrier right at the front, rather than it
> being conditional on something being woken up?

The curprit is __wake_up_bit()'s usage of waitqueue_active(); it is this
latter (see its comment) that requires the smp_mb().

wake_up_bit() and wake_up_var() are wrappers around __wake_up_bit().

Without this barrier it is possible for the waitqueue_active() load to
be hoisted over the cond=true store and the remote end can miss the
store and we can miss its enqueue and we'll all miss a wakeup and get
stuck.

Adding an smp_mb() (or use wq_has_sleeper()) in __wake_up_bit() would be
nice, but I fear some people will complain about overhead, esp. since
about half the sites don't need the barrier due to being behind
test_and_clear_bit() and the other half using smp_mb__after_atomic()
after some clear_bit*() variant.

There's a few sites that seem to open-code
wait_var_event()/wake_up_var() and those actually need the full
smp_mb(), but then maybe they should be converted to var instread of bit
anyway.

> > @@ -619,9 +614,7 @@ static int dvb_usb_fe_sleep(struct dvb_frontend *fe)
> >  err:
> >  	if (!adap->suspend_resume_active) {
> >  		adap->active_fe = -1;
> 
> I'm wondering if there's a missing barrier here.  Should the clear_bit() on
> the next line be clear_bit_unlock() or clear_bit_release()?

That looks reasonable, but I'd like to hear from the DVB folks on that.

> > -		clear_bit(ADAP_SLEEP, &adap->state_bits);
> > -		smp_mb__after_atomic();
> > -		wake_up_bit(&adap->state_bits, ADAP_SLEEP);
> > +		clear_and_wake_up_bit(ADAP_SLEEP, &adap->state_bits);
> >  	}
> >  
> >  	dev_dbg(&d->udev->dev, "%s: ret=%d\n", __func__, ret);
> > diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
> > index cfe62b154f68..377ee07d5f76 100644
> > --- a/fs/afs/fs_probe.c
> > +++ b/fs/afs/fs_probe.c
> > @@ -18,6 +18,7 @@ static bool afs_fs_probe_done(struct afs_server *server)
> >  
> >  	wake_up_var(&server->probe_outstanding);
> >  	clear_bit_unlock(AFS_SERVER_FL_PROBING, &server->flags);
> > +	smp_mb__after_atomic();
> >  	wake_up_bit(&server->flags, AFS_SERVER_FL_PROBING);
> >  	return true;
> >  }
> 
> Looking at this and the dvb one, does it make sense to stick the release
> semantics of clear_bit_unlock() into clear_and_wake_up_bit()?

I was thinking of adding another helper, maybe unlock_and_wake_up_bit()
that included that extra barrier, but maybe making it unconditional
isn't the worst idea.

> Also, should clear_bit_unlock() be renamed to clear_bit_release() (and
> similarly test_and_set_bit_lock() -> test_and_set_bit_acquire()) if we seem to
> be trying to standardise on that terminology.

That definitely makes sense to me, there's only 157 clear_bit_unlock()
and 76 test_and_set_bit_lock() users (note the asymetry of that).

