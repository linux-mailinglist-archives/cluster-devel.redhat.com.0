Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51EC62C169D
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 21:39:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-zitgd2NMNgi6FkAsbRnaRA-1; Mon, 23 Nov 2020 15:39:00 -0500
X-MC-Unique: zitgd2NMNgi6FkAsbRnaRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 278908145E3;
	Mon, 23 Nov 2020 20:38:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72DA860873;
	Mon, 23 Nov 2020 20:38:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11D1718095FF;
	Mon, 23 Nov 2020 20:38:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANKcC6b021213 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 15:38:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8D08C1111C97; Mon, 23 Nov 2020 20:38:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88D561111C96
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 20:38:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5043C800962
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 20:38:10 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [96.44.175.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-223-KpRfVSQxMoegmwdiVtiEXA-1;
	Mon, 23 Nov 2020 15:38:05 -0500
X-MC-Unique: KpRfVSQxMoegmwdiVtiEXA-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 81FC7128092C; 
	Mon, 23 Nov 2020 12:38:03 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Fm687JPabQpA; Mon, 23 Nov 2020 12:38:03 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
	[IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id
	EBC5C128091E; Mon, 23 Nov 2020 12:37:59 -0800 (PST)
Message-ID: <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 12:37:58 -0800
In-Reply-To: <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
	<1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
	<CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
	<fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
	<CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
	linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, Linux,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, Nick, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	tipc-discussion@lists.sourceforge.net, Linux-MM <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
	List <linux-crypto@vger.kernel.org>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	linux-integrity@vger.kernel.org, wcn36xx@lists.infradead.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 19:56 +0100, Miguel Ojeda wrote:
> On Mon, Nov 23, 2020 at 4:58 PM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > Well, I used git.  It says that as of today in Linus' tree we have
> > 889 patches related to fall throughs and the first series went in
> > in october 2017 ... ignoring a couple of outliers back to February.
> 
> I can see ~10k insertions over ~1k commits and 15 years that mention
> a fallthrough in the entire repo. That is including some commits
> (like the biggest one, 960 insertions) that have nothing to do with C
> fallthrough. A single kernel release has an order of magnitude more
> changes than this...
> 
> But if we do the math, for an author, at even 1 minute per line
> change and assuming nothing can be automated at all, it would take 1
> month of work. For maintainers, a couple of trivial lines is noise
> compared to many other patches.

So you think a one line patch should take one minute to produce ... I
really don't think that's grounded in reality.  I suppose a one line
patch only takes a minute to merge with b4 if no-one reviews or tests
it, but that's not really desirable.

> In fact, this discussion probably took more time than the time it
> would take to review the 200 lines. :-)

I'm framing the discussion in terms of the whole series of changes we
have done for fall through, both what's in the tree currently (889
patches) both in terms of the produce and the consumer.  That's what I
used for my figures for cost.

> > We're also complaining about the inability to recruit maintainers:
> > 
> > https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/
> > 
> > And burn out:
> > 
> > http://antirez.com/news/129
> 
> Accepting trivial and useful 1-line patches

Part of what I'm trying to measure is the "and useful" bit because
that's not a given.

> is not what makes a voluntary maintainer quit...

so the proverb "straw which broke the camel's back" uniquely doesn't
apply to maintainers

>  Thankless work with demanding deadlines is.

That's another potential reason, but it doesn't may other reasons less
valid.

> > The whole crux of your argument seems to be maintainers' time isn't
> > important so we should accept all trivial patches
> 
> I have not said that, at all. In fact, I am a voluntary one and I
> welcome patches like this. It takes very little effort on my side to
> review and it helps the kernel overall.

Well, you know, subsystems are very different in terms of the amount of
patches a maintainer has to process per release cycle of the kernel. 
If a maintainer is close to capacity, additional patches, however
trivial, become a problem.  If a maintainer has spare cycles, trivial
patches may look easy.

> Paid maintainers are the ones that can take care of big
> features/reviews.
> 
> > What I'm actually trying to articulate is a way of measuring value
> > of the patch vs cost ... it has nothing really to do with who foots
> > the actual bill.
> 
> I understand your point, but you were the one putting it in terms of
> a junior FTE.

No, I evaluated the producer side in terms of an FTE.  What we're
mostly arguing about here is the consumer side: the maintainers and
people who have to rework their patch sets. I estimated that at 100h.

>  In my view, 1 month-work (worst case) is very much worth
> removing a class of errors from a critical codebase.
> 
> > One thesis I'm actually starting to formulate is that this
> > continual devaluing of maintainers is why we have so much
> > difficulty keeping and recruiting them.
> 
> That may very well be true, but I don't feel anybody has devalued
> maintainers in this discussion.

You seem to be saying that because you find it easy to merge trivial
patches, everyone should.  I'm reminded of a friend long ago who
thought being a Tees River Pilot was a sinecure because he could
navigate the Tees blindfold.  What he forgot, of course, is that just
because it's easy with a trawler doesn't mean it's easy with an oil
tanker.  In fact it takes longer to qualify as a Tees River Pilot than
it does to get a PhD.

James


