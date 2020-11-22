Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCB52BC7BB
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Nov 2020 19:22:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-doj1hDcHO1uaPQCMF0rgOA-1; Sun, 22 Nov 2020 13:22:25 -0500
X-MC-Unique: doj1hDcHO1uaPQCMF0rgOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE26A1005D75;
	Sun, 22 Nov 2020 18:22:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC7DC5D9CC;
	Sun, 22 Nov 2020 18:22:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24408180954D;
	Sun, 22 Nov 2020 18:22:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMIMBfW028445 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 13:22:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CEE3F2166B2B; Sun, 22 Nov 2020 18:22:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9B152166B27
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 18:22:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77528858EEC
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 18:22:09 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [96.44.175.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-321-fxzNyDYyNgyRsOUiAkGZ3g-1;
	Sun, 22 Nov 2020 13:22:07 -0500
X-MC-Unique: fxzNyDYyNgyRsOUiAkGZ3g-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5BB5B128028F; 
	Sun, 22 Nov 2020 10:22:04 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nGXBdIQjsZJa; Sun, 22 Nov 2020 10:22:04 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
	[IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id
	DB46B1280287; Sun, 22 Nov 2020 10:22:00 -0800 (PST)
Message-ID: <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>
Date: Sun, 22 Nov 2020 10:21:59 -0800
In-Reply-To: <202011220816.8B6591A@keescook>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
	linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	usb-storage@lists.one-eyed-alien.net,
	target-devel@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	tipc-discussion@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
	linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, x86@kernel.org,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
	linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
	Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 000/141] Fix fall-through warnings for
	Clang
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-11-22 at 08:17 -0800, Kees Cook wrote:
> On Fri, Nov 20, 2020 at 11:51:42AM -0800, Jakub Kicinski wrote:
> > On Fri, 20 Nov 2020 11:30:40 -0800 Kees Cook wrote:
> > > On Fri, Nov 20, 2020 at 10:53:44AM -0800, Jakub Kicinski wrote:
> > > > On Fri, 20 Nov 2020 12:21:39 -0600 Gustavo A. R. Silva wrote:  
> > > > > This series aims to fix almost all remaining fall-through
> > > > > warnings in order to enable -Wimplicit-fallthrough for Clang.
> > > > > 
> > > > > In preparation to enable -Wimplicit-fallthrough for Clang,
> > > > > explicitly add multiple break/goto/return/fallthrough
> > > > > statements instead of just letting the code fall through to
> > > > > the next case.
> > > > > 
> > > > > Notice that in order to enable -Wimplicit-fallthrough for
> > > > > Clang, this change[1] is meant to be reverted at some point.
> > > > > So, this patch helps to move in that direction.
> > > > > 
> > > > > Something important to mention is that there is currently a
> > > > > discrepancy between GCC and Clang when dealing with switch
> > > > > fall-through to empty case statements or to cases that only
> > > > > contain a break/continue/return statement[2][3][4].  
> > > > 
> > > > Are we sure we want to make this change? Was it discussed
> > > > before?
> > > > 
> > > > Are there any bugs Clangs puritanical definition of fallthrough
> > > > helped find?
> > > > 
> > > > IMVHO compiler warnings are supposed to warn about issues that
> > > > could be bugs. Falling through to default: break; can hardly be
> > > > a bug?!  
> > > 
> > > It's certainly a place where the intent is not always clear. I
> > > think this makes all the cases unambiguous, and doesn't impact
> > > the machine code, since the compiler will happily optimize away
> > > any behavioral redundancy.
> > 
> > If none of the 140 patches here fix a real bug, and there is no
> > change to machine code then it sounds to me like a W=2 kind of a
> > warning.
> 
> FWIW, this series has found at least one bug so far:
> https://lore.kernel.org/lkml/CAFCwf11izHF=g1mGry1fE5kvFFFrxzhPSM6qKAO8gxSp=Kr_CQ@mail.gmail.com/


Well, it's a problem in an error leg, sure, but it's not a really
compelling reason for a 141 patch series, is it?  All that fixing this
error will do is get the driver to print "oh dear there's a problem"
under four more conditions than it previously did.

We've been at this for three years now with nearly a thousand patches,
firstly marking all the fall throughs with /* fall through */ and later
changing it to fallthrough.  At some point we do have to ask if the
effort is commensurate with the protection afforded.  Please tell me
our reward for all this effort isn't a single missing error print.

James


