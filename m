Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 275321BF2E
	for <lists+cluster-devel@lfdr.de>; Mon, 13 May 2019 23:41:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7630F3082B55;
	Mon, 13 May 2019 21:41:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 806115D71E;
	Mon, 13 May 2019 21:41:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FE1E18089CB;
	Mon, 13 May 2019 21:41:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DLfItu014529 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 17:41:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A330262720; Mon, 13 May 2019 21:41:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C539BAA5;
	Mon, 13 May 2019 21:41:16 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CED5E307D923;
	Mon, 13 May 2019 21:41:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id E36E05C2;
	Mon, 13 May 2019 17:41:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 13 May 2019 17:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=Vn/T/POBtkQCivubXNnOyOKOoXD
	swoy+p7rd61BSZqE=; b=BvZ23USq+n0H6bFfinEnI042Scm2YF1IK4T/Ipy1oA7
	EnMtmM24XOtJG3N6yUG9XfvPeAZ/DSmgYOungx4VobZ6ghiLq//Xwp0sr5EEG7tM
	Chzj5aZKD6m7W1TvsCqEtWYJStcGCVl5G+L6L8KT4XKk/Q49y9FrPvwUw/u5w5D7
	O5qDuZBkWjWLkA8eVdRxL4ZDD4N84oiQQg70BWtobahYl6yrquda8wBvHZGUs04V
	KYsqffXOd3dFefZHvErodbuAPP7ralWwr5/PUjmwOHIPcRoJ33o8+xbuQoRLhy1b
	S+15WBT9/o6/uFE9+rF5lgoLuJ8F+DzCb3RRLdnM1ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Vn/T/P
	OBtkQCivubXNnOyOKOoXDswoy+p7rd61BSZqE=; b=hnx7+g5RF4XXPsmU/JIrvk
	trc7cyfb04VRdoTVoe6lKHx3US8i5l74WHwRKYREd8NxzoJ5f0nOTy1M+wkndKvQ
	s36lQuteqU+wHNSrt27kx4eBalmY3U7wD/jg1Z5IgxEKOZZkUG1dAnxwkJKDRIZM
	WGjxtno8qEf25ApyCQubPFDreAjW3PRnIJWgKKRg/RgBScFbfFagIq9ZZPRXGGMW
	45UJP80rwyEROZa4jRQ3Xpd3vJ2I1jtMqXEB559MMNKKwZLuzZBzxPr7qofa7ejV
	YkFZA7q3aCJ7IZ65bQZZS2tVhrsdzechSy+eWC2ALV6kf0kmor9G9G0gMsENPrkA
	==
X-ME-Sender: <xms:d-TZXFRRkH-8e7vBJEPVZcl5TD4sDNFnspcIQp7fTLcc5I94HJLIGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleeggdduieefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	gfrhhlucfvnfffucdludehmdenucfjughrpeffhffvuffkfhggtggujgfofgesthdtredt
	ofervdenucfhrhhomhepfdfvohgsihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtoh
	gsihhnrdgttgeqnecukfhppeduvdegrdduieelrdduiedrudekheenucfrrghrrghmpehm
	rghilhhfrhhomhepmhgvsehtohgsihhnrdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:d-TZXK5j0tX3LgYou62RdrIWuzXD-nvhFHkz-iUYE9ZiNbWDK7_OQw>
	<xmx:d-TZXEHh35WyA_1MN-hDT2kJcyx-PXCTO7hDV8IbYGIDwM0JtHDAsw>
	<xmx:d-TZXMGzgk4fcT7RSe5zg_VG4SvazSyA1wEV-tv5d0XbsyNngqy8xw>
	<xmx:d-TZXOSeMpWkHt6eP0ekLynCg-eMfbDDpJmpcXY3eYLiYcfYacYm_Q>
Received: from localhost (124-169-16-185.dyn.iinet.net.au [124.169.16.185])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9515E80063;
	Mon, 13 May 2019 17:41:10 -0400 (EDT)
Date: Tue, 14 May 2019 07:40:39 +1000
From: "Tobin C. Harding" <me@tobin.cc>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190513214039.GA27187@eros.localdomain>
References: <20190513033213.2468-1-tobin@kernel.org>
	<20190513071405.GF2868@kroah.com>
	<20190513103936.GA15053@eros.localdomain>
	<CAHc6FU7FCBn1CnzEjyj8W7LBu-Ths7bME2R3_GQ2ZmsFQxWEhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU7FCBn1CnzEjyj8W7LBu-Ths7bME2R3_GQ2ZmsFQxWEhA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Mon, 13 May 2019 21:41:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 13 May 2019 21:41:14 +0000 (UTC) for IP:'64.147.123.25'
	DOMAIN:'wout2-smtp.messagingengine.com'
	HELO:'wout2-smtp.messagingengine.com' FROM:'me@tobin.cc' RCPT:''
X-RedHat-Spam-Score: -0.801  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS) 64.147.123.25 wout2-smtp.messagingengine.com
	64.147.123.25 wout2-smtp.messagingengine.com <me@tobin.cc>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	"Tobin C. Harding" <tobin@kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix error path kobject memory leak
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 13 May 2019 21:41:25 +0000 (UTC)

On Mon, May 13, 2019 at 06:41:23PM +0200, Andreas Gruenbacher wrote:
> On Mon, 13 May 2019 at 12:40, Tobin C. Harding <me@tobin.cc> wrote:
> >
> > On Mon, May 13, 2019 at 09:14:05AM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, May 13, 2019 at 01:32:13PM +1000, Tobin C. Harding wrote:
> > > > If a call to kobject_init_and_add() fails we must call kobject_put()
> > > > otherwise we leak memory.
> > > >
> > > > Function always calls kobject_init_and_add() which always calls
> > > > kobject_init().
> > > >
> > > > It is safe to leave object destruction up to the kobject release
> > > > function and never free it manually.
> > > >
> > > > Remove call to kfree() and always call kobject_put() in the error path.
> > > >
> > > > Signed-off-by: Tobin C. Harding <tobin@kernel.org>
> > > > ---
> > > >
> > > > Is it ok to send patches during the merge window?
> > > >
> > > > Applies on top of Linus' mainline tag: v5.1
> > > >
> > > > Happy to rebase if there are conflicts.
> > > >
> > > > thanks,
> > > > Tobin.
> > > >
> > > >  fs/gfs2/sys.c | 7 +------
> > > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > > >
> > > > diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
> > > > index 1787d295834e..98586b139386 100644
> > > > --- a/fs/gfs2/sys.c
> > > > +++ b/fs/gfs2/sys.c
> > > > @@ -661,8 +661,6 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
> > > >     if (error)
> > > >             goto fail_reg;
> > > >
> > > > -   sysfs_frees_sdp = 1; /* Freeing sdp is now done by sysfs calling
> > > > -                           function gfs2_sbd_release. */
> > >
> > > You should also delete this variable at the top of the function, as it
> > > is now only set once there and never used.
> >
> > Thanks, I should have gotten a compiler warning for that.  I was feeling
> > so confident with my builds this morning ... pays not to get too cocky
> > I suppose.
> >
> > > With that:
> > >
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > Thanks, will re-spin.
> 
> Don't bother, I'll fix that up.

Thanks man!

