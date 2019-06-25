Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 436255506F
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 15:32:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8677B308626C;
	Tue, 25 Jun 2019 13:32:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE0C6085B;
	Tue, 25 Jun 2019 13:32:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FF6F19725;
	Tue, 25 Jun 2019 13:31:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PDUZ2S021551 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 09:30:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCF275DA34; Tue, 25 Jun 2019 13:30:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80DC45D9DC;
	Tue, 25 Jun 2019 13:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 631E790901;
	Tue, 25 Jun 2019 13:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vCL2IOPiHU9kJW2bBZYOqxawmR17SekCCFnRDcOOjFE=;
	b=g0ITzi4aEbR6lSdnqiy2ElfSg
	g779gyAaI7Ux0091eXAVoKggjsFo/t+M6NWIocT8AMgHmAAh0yh80ypR6Qbrn/+LZz95Bc5tDvCen
	z4EMW1PvzMzmn7ebko6NG+ty+dz11z5vxAH09EtqjAX8ydZyEpvMqdktJcGUrgc2Dgx66WDRoalDB
	qnMzX1ROanw2yW2oUXHPcEvjQ3b3DC0dOeSFFur1rAygN3R9e1t4x90/HNJodZAxXJkupMEfn77Fm
	hpkVJrCMUlq/fbnIZCSHsL7NRYfw+QRUFFHQvO2QCLXRHQbEJ1FO9NQzzkv9ouNrzplrkLdnx7Roh
	OV0fobmDw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=hirez.programming.kicks-ass.net)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hflU2-0000AO-GD; Tue, 25 Jun 2019 13:27:38 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id ED4AC209FCA10; Tue, 25 Jun 2019 15:27:36 +0200 (CEST)
Date: Tue, 25 Jun 2019 15:27:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190625132736.GZ3419@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
	<CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
	<20190625103430.GW3402@hirez.programming.kicks-ass.net>
	<CAHc6FU6zUCdQZ1AfN2KYcPYVKc5bwvc0bD7=-KZpFXws+F9QZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU6zUCdQZ1AfN2KYcPYVKc5bwvc0bD7=-KZpFXws+F9QZQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Tue, 25 Jun 2019 13:30:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 25 Jun 2019 13:30:16 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'peterz@infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org <peterz@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 25 Jun 2019 13:32:44 +0000 (UTC)

On Tue, Jun 25, 2019 at 02:12:22PM +0200, Andreas Gruenbacher wrote:

> > Only if we do as David suggested and make clean_and_wake_up_bit()
> > provide the RELEASE barrier.
> 
> (It's clear_and_wake_up_bit, not clean_and_wake_up_bit.)

Yes, typing hard.

> > That is, currently clear_and_wake_up_bit() is
> >
> >         clear_bit()
> >         smp_mb__after_atomic();
> >         wake_up_bit();
> >

> Now I'm confused because clear_and_wake_up_bit() in mainline does use
> clear_bit_unlock(), so it's the exact opposite of what you just said.

Argh; clearly I couldn't read. And then yes, you're right.

