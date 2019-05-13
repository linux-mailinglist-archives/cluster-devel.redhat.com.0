Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F581B44D
	for <lists+cluster-devel@lfdr.de>; Mon, 13 May 2019 12:50:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E44230054AB;
	Mon, 13 May 2019 10:50:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4ABC10018E0;
	Mon, 13 May 2019 10:49:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5457C41F58;
	Mon, 13 May 2019 10:49:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DAec74014021 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 06:40:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F204C6A487; Mon, 13 May 2019 10:40:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 997D160BEC;
	Mon, 13 May 2019 10:40:36 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FAE836807;
	Mon, 13 May 2019 10:40:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 4C01C30D;
	Mon, 13 May 2019 06:40:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 13 May 2019 06:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=WApew/vuxJIVZtbLL/hzndegcPF
	zwFvShwAPmp+eSVw=; b=UMf5oONS/DFmzS5SYtP1oefeJJtM75U5GxD1sqM8G36
	Ssd+pl3UkYGqMtVK1wGA4W7fm6eaRYv4wSo4234Pby9eppUqXk3na7zS75Bx9i3I
	IYlsZGNMi3se89ciebk5i0O2Q9zycJWtRmZZth2wVIjadbheztqCZGfUUJbUvrWJ
	KGuUCHLc2XS2DaPd8ufTVQwaqcKMdrIw/CHQWG5i6vYjzn8m6r5xKVumjEyUDGsy
	KOS/ugG4lSwdtjwYUVutVmqG/oQZwHRFXLB+wJybshUlAXJ83keLWLeAxqxJaNLd
	sExE+oFqAYaf9TLh514XjBou61y7YAEkBfuFK1kSusw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WApew/
	vuxJIVZtbLL/hzndegcPFzwFvShwAPmp+eSVw=; b=24W6q/NP/SFakj5ZCoiGVv
	SEdjFX1uZ/mBVHoSbdp5gK1h6IjeJwq2n0X9ZCJALxSZMiEvF9W+bnVpxbpj0aJ+
	qOTWF3Ltogn09ptqVyKRgxPNt2PeKRbTnU0Bg+Pab975sMY9y6f4kFe/dyNmeoNM
	TZZ8TuRbGHJXSdRi3ekmdj7Re5lOODWFqrOMUwvsBhwSU3n5PlEwhqdfmwKZGtU1
	eHXh/tOE8af+mFWxAdX+XFG3hsZIhSQFEjYfEJXZ0NZQDkgWh7M6R6OGBBWCqPVx
	ZRYfFem/MkYG5qqwXEsH/t58tnnnXh0UzmYg1TnlpMZB4kkkznXXsXFtAtT93y/g
	==
X-ME-Sender: <xms:oEnZXGJBEYRY3jLjzBu_7d93obVCWIoxjD40Ad0bGwjcvZjdRTeCsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleeggdeftdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
	hrlhcuvffnffculdduhedmnecujfgurhepfffhvffukfhfgggtuggjofgfsehttdertdfo
	redvnecuhfhrohhmpedfvfhosghinhcuvedrucfjrghrughinhhgfdcuoehmvgesthhosg
	hinhdrtggtqeenucfkphepuddvgedrudeiledrudeirddukeehnecurfgrrhgrmhepmhgr
	ihhlfhhrohhmpehmvgesthhosghinhdrtggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:oEnZXE4rpE1JjAe9wFG_jPXkjsmajRj4XqNfes1Z53jmQE4WRGsnYg>
	<xmx:oEnZXPiQFp6beyvTFhkCumt-pM5rBhXanuNBO04tGmezRPSfuKWaRg>
	<xmx:oEnZXAG3-60dlihvqnuEOg-CiHcXY7HcWk4SwPa_au2jRqTorT7FRw>
	<xmx:oEnZXOpmeuZHjYu2KPeZPJ7q7mXJ-MyD-HJLX8Dlm8n2V_7g_Z1jwg>
Received: from localhost (124-169-16-185.dyn.iinet.net.au [124.169.16.185])
	by mail.messagingengine.com (Postfix) with ESMTPA id C537F80063;
	Mon, 13 May 2019 06:40:31 -0400 (EDT)
Date: Mon, 13 May 2019 20:39:36 +1000
From: "Tobin C. Harding" <me@tobin.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190513103936.GA15053@eros.localdomain>
References: <20190513033213.2468-1-tobin@kernel.org>
	<20190513071405.GF2868@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513071405.GF2868@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Mon, 13 May 2019 10:40:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Mon, 13 May 2019 10:40:35 +0000 (UTC) for IP:'64.147.123.20'
	DOMAIN:'wout4-smtp.messagingengine.com'
	HELO:'wout4-smtp.messagingengine.com' FROM:'me@tobin.cc' RCPT:''
X-RedHat-Spam-Score: -0.801  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS) 64.147.123.20 wout4-smtp.messagingengine.com
	64.147.123.20 wout4-smtp.messagingengine.com <me@tobin.cc>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 May 2019 06:49:51 -0400
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com, "Tobin C. Harding" <tobin@kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 13 May 2019 10:50:01 +0000 (UTC)

On Mon, May 13, 2019 at 09:14:05AM +0200, Greg Kroah-Hartman wrote:
> On Mon, May 13, 2019 at 01:32:13PM +1000, Tobin C. Harding wrote:
> > If a call to kobject_init_and_add() fails we must call kobject_put()
> > otherwise we leak memory.
> > 
> > Function always calls kobject_init_and_add() which always calls
> > kobject_init().
> > 
> > It is safe to leave object destruction up to the kobject release
> > function and never free it manually.
> > 
> > Remove call to kfree() and always call kobject_put() in the error path.
> > 
> > Signed-off-by: Tobin C. Harding <tobin@kernel.org>
> > ---
> > 
> > Is it ok to send patches during the merge window?
> > 
> > Applies on top of Linus' mainline tag: v5.1
> > 
> > Happy to rebase if there are conflicts.
> > 
> > thanks,
> > Tobin.
> > 
> >  fs/gfs2/sys.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
> > index 1787d295834e..98586b139386 100644
> > --- a/fs/gfs2/sys.c
> > +++ b/fs/gfs2/sys.c
> > @@ -661,8 +661,6 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
> >  	if (error)
> >  		goto fail_reg;
> >  
> > -	sysfs_frees_sdp = 1; /* Freeing sdp is now done by sysfs calling
> > -				function gfs2_sbd_release. */
> 
> You should also delete this variable at the top of the function, as it
> is now only set once there and never used.

Thanks, I should have gotten a compiler warning for that.  I was feeling
so confident with my builds this morning ... pays not to get too cocky
I suppose.

> With that:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks, will re-spin.

	Tobin.

