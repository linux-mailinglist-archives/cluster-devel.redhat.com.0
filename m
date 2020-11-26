Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E53B62C66C7
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Nov 2020 14:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606483567;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=IL7sPB68gF1YeWIUFuBJ//YIBDjI3bDL6qHHKubt/Z0=;
	b=KjHDwaGci6UbZ6SPaeR/humEZjHp3czoNWoA8i+E828P0TW/9O1LIFgi0q90dQla7LYGAk
	szefv0XrbwmowyUdRxTZQSuOQWFIOoMIrGRa9qfVJokItHkWO8dinpYez0kq0wnPSvnRvr
	UZpZpFfqgrtaBs2le2a6ZLoE0kPWVkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-qFf3QasBObyr5vK60JU4zg-1; Fri, 27 Nov 2020 08:26:05 -0500
X-MC-Unique: qFf3QasBObyr5vK60JU4zg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE861393A6;
	Fri, 27 Nov 2020 13:26:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D07060864;
	Fri, 27 Nov 2020 13:26:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11AD14A7C6;
	Fri, 27 Nov 2020 13:25:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQGITmD021740 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 11:18:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 69C3D2026D3C; Thu, 26 Nov 2020 16:18:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64CA52026D38
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 16:18:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9865185A7BC
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 16:18:26 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-110-5n5ps9-tM7ittr9UnPax2w-1; Thu, 26 Nov 2020 11:18:25 -0500
X-MC-Unique: 5n5ps9-tM7ittr9UnPax2w-1
Received: by mail-qt1-f199.google.com with SMTP id c11so1312630qtw.10
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 08:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IL7sPB68gF1YeWIUFuBJ//YIBDjI3bDL6qHHKubt/Z0=;
	b=rt9Skozh8azEmIGQa2s/2og2S/WYk4I+6VVa3+92azDspZTPDeLQIaO36N2dGWxANX
	YL/e+sXsTWgzzj3MZV1/X8Vd5mpChuUVy48tnLED+BKtAwYEF3Opv1tNb524rHidGXcK
	7CJA4idTPwpe6sWioEUQ5OGZQcDEqEgwz9PHcUQclyjSuWKVR0npDRCRDY3Y7SATseJ3
	fmoS1q5r3cyPpiLXdT8c5vi6CQJ3JQ0Z+lWPVMILUGJwF+rPsoahQPIopFq8TSQkDtYO
	+zZeKcJcyLjsGXTfTFNqjeL5JKnMMI4EU9IYSZyh+xU1UjUGqfDyTVID5748XW9BZuzP
	fbHw==
X-Gm-Message-State: AOAM532VS57E+n6bHGuiAphrzoPrMoaw56eWH1e88S7xABACKaJubBdI
	eP/8f30I34MTu6bUAGQ7NKWbme9Au8qSm77cYVu7CiJlZccYt3muPshWRkaknukZdfIv7hy6ADS
	7NBRi0xzLkrxAlNqCcx8RreWjq1uNLzslTxdSWw==
X-Received: by 2002:a37:ac8:: with SMTP id 191mr3793913qkk.381.1606407504810; 
	Thu, 26 Nov 2020 08:18:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCU4CKAolN2PpaYdMoKCHma/+NC3lHjkQkQkRPTWC20j3rANbYTTy+FG9V7n634RRlgf0kcsxPjR4LO+NB5fA=
X-Received: by 2002:a37:ac8:: with SMTP id 191mr3793888qkk.381.1606407504531; 
	Thu, 26 Nov 2020 08:18:24 -0800 (PST)
MIME-Version: 1.0
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
	<4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
	<CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
	<44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com>
	<CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
	<CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
In-Reply-To: <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 26 Nov 2020 17:18:13 +0100
Message-ID: <CACO55tsBj3gLECoMWtViDitd7fVTnW+Cp0LVmqYkR=QFBJkEmQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 27 Nov 2020 08:25:49 -0500
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	linux-atm-general@lists.sourceforge.net, linux-iio@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	target-devel <target-devel@vger.kernel.org>,
	MTD Maling List <linux-mtd@lists.infradead.org>,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	driverdevel <devel@driverdev.osuosl.org>,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	scsi <linux-scsi@vger.kernel.org>, Edward Cree <ecree.xilinx@gmail.com>,
	linux-rdma <linux-rdma@vger.kernel.org>,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-block@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	samba-technical@lists.samba.org, xen-devel@lists.xenproject.org,
	Lars Ellenberg <drbd-dev@tron.linbit.com>, linux-hams@vger.kernel.org,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-can@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>, "open list:NFS,
	SUNRPC, AND..." <linux-nfs@vger.kernel.org>, GR-Linux-NIC-Dev@marvell.com,
	tipc-discussion@lists.sourceforge.net,
	Nouveau Dev <nouveau@lists.freedesktop.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net,
	Linux MMC List <linux-mmc@vger.kernel.org>, linux-sctp@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-security-module <linux-security-module@vger.kernel.org>,
	keyrings@vger.kernel.org, NetFilter <netfilter-devel@vger.kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-integrity <linux-integrity@vger.kernel.org>,
	USB list <linux-usb@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
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

On Thu, Nov 26, 2020 at 4:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Miguel,
>
> On Thu, Nov 26, 2020 at 3:54 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> > On Wed, Nov 25, 2020 at 11:44 PM Edward Cree <ecree.xilinx@gmail.com> wrote:
> > > To make the intent clear, you have to first be certain that you
> > >  understand the intent; otherwise by adding either a break or a
> > >  fallthrough to suppress the warning you are just destroying the
> > >  information that "the intent of this code is unknown".
> >
> > If you don't know what the intent of your own code is, then you
> > *already* have a problem in your hands.
>
> The maintainer is not necessarily the owner/author of the code, and
> thus may not know the intent of the code.
>
> > > or does it flag up code
> > >  that can be mindlessly "fixed" (in which case the warning is
> > >  worthless)?  Proponents in this thread seem to be trying to
> > >  have it both ways.
> >
> > A warning is not worthless just because you can mindlessly fix it.
> > There are many counterexamples, e.g. many
> > checkpatch/lint/lang-format/indentation warnings, functional ones like
> > the `if (a = b)` warning...
>
> BTW, you cannot mindlessly fix the latter, as you cannot know if
> "(a == b)" or "((a = b))" was intended, without understanding the code
> (and the (possibly unavailable) data sheet, and the hardware, ...).
>

to allow assignments in if statements was clearly a mistake and if you
need outside information to understand the code, your code is the
issue already.

> P.S. So far I've stayed out of this thread, as I like it if the compiler
>      flags possible mistakes.  After all I was the one fixing new
>      "may be used uninitialized" warnings thrown up by gcc-4.1, until
>      (a bit later than) support for that compiler was removed...
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

