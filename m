Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50ADE2C1050
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 17:32:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-qH6P6Gd2OK-5OIRODUe9Hg-1; Mon, 23 Nov 2020 11:31:55 -0500
X-MC-Unique: qH6P6Gd2OK-5OIRODUe9Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBAA98042A2;
	Mon, 23 Nov 2020 16:31:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0918F5D9CC;
	Mon, 23 Nov 2020 16:31:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2DA44A7C6;
	Mon, 23 Nov 2020 16:31:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANGVifw020038 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 11:31:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9244330BA2; Mon, 23 Nov 2020 16:31:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BAA35D203
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 16:31:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A646F1871BF5
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 16:31:41 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [96.44.175.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-512-SQ51G46xPeCR-2p_9CM0Kw-1;
	Mon, 23 Nov 2020 11:31:37 -0500
X-MC-Unique: SQ51G46xPeCR-2p_9CM0Kw-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7EDBD12808F6; 
	Mon, 23 Nov 2020 08:31:35 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id S05__PC1UR2d; Mon, 23 Nov 2020 08:31:35 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
	[IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id
	9FAA112808A8; Mon, 23 Nov 2020 08:31:31 -0800 (PST)
Message-ID: <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Date: Mon, 23 Nov 2020 08:31:30 -0800
In-Reply-To: <20201123130348.GA3119@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
	<0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
	<d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
	<dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
	<20201123130348.GA3119@embeddedor>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
	target-devel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mmc@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, linux-geode@lists.infradead.org,
	linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, Jakub, linux-scsi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, linux-atm-general@lists.sourceforge.net,
	ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Kicinski <kuba@kernel.org>, linux-ext4@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-media@vger.kernel.org,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-sctp@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-block@vger.kernel.org,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	nouveau@lists.freedesktop.org, netdev@vger.kernel.org,
	linux-decnet-user@lists.sourceforge.net,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	linux-integrity@vger.kernel.org, x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [Cluster-devel] [Intel-wired-lan] [PATCH 000/141] Fix
 fall-through warnings for Clang
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

On Mon, 2020-11-23 at 07:03 -0600, Gustavo A. R. Silva wrote:
> On Sun, Nov 22, 2020 at 11:53:55AM -0800, James Bottomley wrote:
> > On Sun, 2020-11-22 at 11:22 -0800, Joe Perches wrote:
> > > On Sun, 2020-11-22 at 11:12 -0800, James Bottomley wrote:
> > > > On Sun, 2020-11-22 at 10:25 -0800, Joe Perches wrote:
> > > > > On Sun, 2020-11-22 at 10:21 -0800, James Bottomley wrote:
> > > > > > Please tell me our reward for all this effort isn't a
> > > > > > single missing error print.
> > > > > 
> > > > > There were quite literally dozens of logical defects found
> > > > > by the fallthrough additions.  Very few were logging only.
> > > > 
> > > > So can you give us the best examples (or indeed all of them if
> > > > someone is keeping score)?  hopefully this isn't a US election
> > > > situation ...
> > > 
> > > Gustavo?  Are you running for congress now?
> > > 
> > > https://lwn.net/Articles/794944/
> > 
> > That's 21 reported fixes of which about 50% seem to produce no
> > change in code behaviour at all, a quarter seem to have no user
> > visible effect with the remaining quarter producing unexpected
> > errors on obscure configuration parameters, which is why no-one
> > really noticed them before.
> 
> The really important point here is the number of bugs this has
> prevented and will prevent in the future. See an example of this,
> below:
> 
> https://lore.kernel.org/linux-iio/20190813135802.GB27392@kroah.com/

I think this falls into the same category as the other six bugs: it
changes the output/input for parameters but no-one has really noticed,
usually because the command is obscure or the bias effect is minor.

> This work is still relevant, even if the total number of issues/bugs
> we find in the process is zero (which is not the case).

Really, no ... something which produces no improvement has no value at
all ... we really shouldn't be wasting maintainer time with it because
it has a cost to merge.  I'm not sure we understand where the balance
lies in value vs cost to merge but I am confident in the zero value
case.

> "The sucky thing about doing hard work to deploy hardening is that
> the result is totally invisible by definition (things not happening)
> [..]"
> - Dmitry Vyukov

Really, no.  Something that can't be measured at all doesn't exist.

And actually hardening is one of those things you can measure (which I
do have to admit isn't true for everything in the security space) ...
it's number of exploitable bugs found before you did it vs number of
exploitable bugs found after you did it.  Usually hardening eliminates
a class of bug, so the way I've measured hardening before is to go
through the CVE list for the last couple of years for product X, find
all the bugs that are of the class we're looking to eliminate and say
if we had hardened X against this class of bug we'd have eliminated Y%
of the exploits.  It can be quite impressive if Y is a suitably big
number.

James


